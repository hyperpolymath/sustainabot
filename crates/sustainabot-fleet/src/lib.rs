// SPDX-License-Identifier: PMPL-1.0-or-later
// SPDX-FileCopyrightText: 2025-2026 Jonathan D.A. Jewell

//! Gitbot fleet integration for sustainabot
//!
//! Publishes ecological and economic analysis findings to the shared context
//! layer for consumption by other bots in the fleet.

use anyhow::Result;
use gitbot_shared_context::{BotId, Context, Finding, Severity};
use sustainabot_metrics::{Carbon, Duration, Energy, Memory};

/// Analysis result that can be published to the fleet
pub struct AnalysisResult {
    pub function_name: String,
    pub file_path: String,
    pub energy: Energy,
    pub carbon: Carbon,
    pub duration: Duration,
    pub patterns: Vec<Pattern>,
}

/// Detected code pattern with ecological impact
pub struct Pattern {
    pub name: String,
    pub description: String,
    pub severity: PatternSeverity,
    pub estimated_impact: String,
}

#[derive(Clone, Copy, PartialEq, Eq)]
pub enum PatternSeverity {
    High,    // Significant ecological impact
    Medium,  // Moderate impact
    Low,     // Minor impact
    Info,    // Informational
}

/// Publish sustainabot analysis findings to the fleet shared context
pub fn publish_findings(
    ctx: &mut Context,
    results: &[AnalysisResult],
    thresholds: &EcologicalThresholds,
) -> Result<()> {
    let mut total_energy = Energy::joules(0.0);
    let mut total_carbon = Carbon::grams_co2e(0.0);
    let mut high_impact_functions = Vec::new();

    // Aggregate results
    for result in results {
        total_energy = total_energy + result.energy;
        total_carbon = total_carbon + result.carbon;

        // Flag high-impact functions
        if result.energy.0 > thresholds.energy_per_function_joules {
            high_impact_functions.push((result.function_name.clone(), result.energy));
        }

        // Report detected patterns
        for pattern in &result.patterns {
            let finding_id = format!(
                "SUSTAIN-PATTERN-{}-{}",
                pattern.name.to_uppercase().replace(' ', "-"),
                result.function_name
            );

            ctx.add_finding(Finding::new(
                BotId::Sustainabot,
                &finding_id,
                map_severity(pattern.severity),
                &format!(
                    "{} in {}: {}. Estimated impact: {}",
                    pattern.name, result.function_name, pattern.description, pattern.estimated_impact
                ),
            ));
        }
    }

    // Report overall resource usage
    let total_energy_kj = total_energy.0 / 1000.0;
    if total_energy_kj > thresholds.total_energy_threshold_kj {
        ctx.add_finding(Finding::new(
            BotId::Sustainabot,
            "SUSTAIN-HIGH-ENERGY",
            Severity::Warning,
            &format!(
                "High total energy consumption: {:.2} kJ (threshold: {:.2} kJ)",
                total_energy_kj, thresholds.total_energy_threshold_kj
            ),
        ));
    }

    let total_carbon_g = total_carbon.0;
    if total_carbon_g > thresholds.total_carbon_threshold_grams {
        ctx.add_finding(Finding::new(
            BotId::Sustainabot,
            "SUSTAIN-HIGH-CARBON",
            Severity::Warning,
            &format!(
                "High carbon footprint: {:.2}g CO₂ (threshold: {:.2}g)",
                total_carbon_g, thresholds.total_carbon_threshold_grams
            ),
        ));
    }

    // Report high-impact functions
    if !high_impact_functions.is_empty() {
        let function_list = high_impact_functions
            .iter()
            .map(|(name, energy)| format!("{} ({:.2}J)", name, energy.0))
            .collect::<Vec<_>>()
            .join(", ");

        ctx.add_finding(Finding::new(
            BotId::Sustainabot,
            "SUSTAIN-HIGH-IMPACT-FUNCTIONS",
            Severity::Info,
            &format!(
                "{} function(s) exceed per-function energy threshold: {}",
                high_impact_functions.len(),
                function_list
            ),
        ));
    }

    // Add ecological efficiency rating
    let efficiency_rating = calculate_efficiency_rating(results, thresholds);
    ctx.add_finding(Finding::new(
        BotId::Sustainabot,
        "SUSTAIN-EFFICIENCY-RATING",
        Severity::Info,
        &format!("Ecological efficiency rating: {}", efficiency_rating),
    ));

    Ok(())
}

/// Ecological thresholds for reporting
pub struct EcologicalThresholds {
    /// Total energy threshold in kilojoules
    pub total_energy_threshold_kj: f64,
    /// Total carbon threshold in grams
    pub total_carbon_threshold_grams: f64,
    /// Per-function energy threshold in joules
    pub energy_per_function_joules: f64,
}

impl Default for EcologicalThresholds {
    fn default() -> Self {
        Self {
            total_energy_threshold_kj: 10.0,      // 10 kJ
            total_carbon_threshold_grams: 2.0,     // 2g CO₂
            energy_per_function_joules: 100.0,     // 100 J per function
        }
    }
}

/// Calculate efficiency rating (A-F scale like energy ratings)
fn calculate_efficiency_rating(
    results: &[AnalysisResult],
    _thresholds: &EcologicalThresholds,
) -> String {
    if results.is_empty() {
        return "N/A".to_string();
    }

    let avg_energy: f64 = results.iter().map(|r| r.energy.0).sum::<f64>() / results.len() as f64;

    // Simple rating scale (could be more sophisticated)
    if avg_energy < 10.0 {
        "A (Excellent)".to_string()
    } else if avg_energy < 50.0 {
        "B (Good)".to_string()
    } else if avg_energy < 100.0 {
        "C (Average)".to_string()
    } else if avg_energy < 200.0 {
        "D (Below Average)".to_string()
    } else if avg_energy < 500.0 {
        "E (Poor)".to_string()
    } else {
        "F (Very Poor)".to_string()
    }
}

/// Map sustainabot PatternSeverity to fleet Severity
fn map_severity(s: PatternSeverity) -> Severity {
    match s {
        PatternSeverity::High => Severity::Warning,
        PatternSeverity::Medium => Severity::Warning,
        PatternSeverity::Low => Severity::Info,
        PatternSeverity::Info => Severity::Info,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_efficiency_rating() {
        let thresholds = EcologicalThresholds::default();

        // Excellent rating
        let results = vec![AnalysisResult {
            function_name: "fast_fn".to_string(),
            file_path: "test.rs".to_string(),
            energy: Energy::joules(5.0),
            carbon: Carbon::grams_co2e(0.1),
            duration: Duration::milliseconds(10.0),
            patterns: vec![],
        }];

        let rating = calculate_efficiency_rating(&results, &thresholds);
        assert!(rating.starts_with('A'));
    }
}
