// SPDX-License-Identifier: PMPL-1.0-or-later
// SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

//! # SustainaBot CLI
//!
//! Ecological and economic code analysis tool.
//! Built with Eclexia principles - proving resource-aware design works.

use anyhow::Result;
use clap::{Parser, Subcommand};
use std::path::PathBuf;
use sustainabot_analysis::analyze_file;
use tracing::info;
use walkdir::WalkDir;

#[derive(Parser)]
#[command(name = "sustainabot")]
#[command(about = "Ecological & Economic Code Analysis", long_about = None)]
#[command(version)]
struct Cli {
    #[command(subcommand)]
    command: Commands,

    /// Enable verbose logging
    #[arg(short, long, global = true)]
    verbose: bool,
}

#[derive(Subcommand)]
enum Commands {
    /// Analyze a single file
    Analyze {
        /// File to analyze
        file: PathBuf,

        /// Output format (text, json, sarif)
        #[arg(short, long, default_value = "text")]
        format: String,
    },

    /// Analyze a directory recursively
    Check {
        /// Directory to check
        path: PathBuf,

        /// Minimum eco score threshold (0-100)
        #[arg(long, default_value = "50")]
        eco_threshold: f64,
    },

    /// Show analysis of sustainabot itself (dogfooding!)
    SelfAnalyze,
}

fn main() -> Result<()> {
    let cli = Cli::parse();

    // Set up logging
    let log_level = if cli.verbose { "debug" } else { "info" };
    tracing_subscriber::fmt()
        .with_env_filter(log_level)
        .init();

    match cli.command {
        Commands::Analyze { file, format } => {
            info!("Analyzing file: {}", file.display());
            let results = analyze_file(&file)?;

            match format.as_str() {
                "json" => {
                    let json = serde_json::to_string_pretty(&results)?;
                    println!("{}", json);
                }
                "text" => {
                    print_results_text(&results);
                }
                _ => {
                    eprintln!("Unsupported format: {}", format);
                }
            }
        }

        Commands::Check { path, eco_threshold } => {
            info!("Checking directory: {}", path.display());
            println!("Checking directory: {} (eco threshold: {})\n", path.display(), eco_threshold);

            let mut total_files = 0u32;
            let mut files_below_threshold = 0u32;
            let mut all_results = Vec::new();

            for entry in WalkDir::new(&path)
                .follow_links(false)
                .into_iter()
                .filter_entry(|e| {
                    let name = e.file_name().to_str().unwrap_or("");
                    !matches!(name, "target" | "node_modules" | ".git" | "dist" | "build" | ".cache")
                })
                .filter_map(|e| e.ok())
            {
                let entry_path = entry.path();
                if !entry_path.is_file() {
                    continue;
                }

                // Only analyze supported source files
                let ext = entry_path.extension().and_then(|e| e.to_str()).unwrap_or("");
                if !matches!(ext, "rs" | "js") {
                    continue;
                }

                match analyze_file(entry_path) {
                    Ok(results) => {
                        total_files += 1;
                        for result in &results {
                            if result.health.eco_score.0 < eco_threshold {
                                files_below_threshold += 1;
                                println!(
                                    "  BELOW THRESHOLD: {} :: {} (eco: {:.1}, threshold: {})",
                                    entry_path.display(),
                                    result.location.name.as_deref().unwrap_or("<anon>"),
                                    result.health.eco_score.0,
                                    eco_threshold
                                );
                            }
                        }
                        all_results.extend(results);
                    }
                    Err(e) => {
                        info!("Skipping {}: {}", entry_path.display(), e);
                    }
                }
            }

            // Summary
            println!("\n--- Summary ---");
            println!("Files analyzed:        {}", total_files);
            println!("Functions found:       {}", all_results.len());
            println!("Below threshold:       {}", files_below_threshold);

            if !all_results.is_empty() {
                let avg_eco: f64 = all_results.iter().map(|r| r.health.eco_score.0).sum::<f64>()
                    / all_results.len() as f64;
                let avg_overall: f64 = all_results.iter().map(|r| r.health.overall).sum::<f64>()
                    / all_results.len() as f64;
                let total_energy: f64 = all_results.iter().map(|r| r.resources.energy.0).sum();
                let total_carbon: f64 = all_results.iter().map(|r| r.resources.carbon.0).sum();

                println!("Avg eco score:         {:.1}/100", avg_eco);
                println!("Avg overall health:    {:.1}/100", avg_overall);
                println!("Total est. energy:     {:.2} J", total_energy);
                println!("Total est. carbon:     {:.4} gCO2e", total_carbon);
            }

            if files_below_threshold > 0 {
                println!("\nResult: FAIL ({} functions below eco threshold {})", files_below_threshold, eco_threshold);
                std::process::exit(1);
            } else {
                println!("\nResult: PASS (all functions meet eco threshold {})", eco_threshold);
            }
        }

        Commands::SelfAnalyze => {
            println!("🌱 SustainaBot Self-Analysis (Dogfooding!)");
            println!("==========================================\n");
            println!("Analyzing sustainabot's own resource usage...\n");

            // Analyze the analyzer!
            let analyzer_src = PathBuf::from("crates/sustainabot-analysis/src/analyzer.rs");
            if analyzer_src.exists() {
                let results = analyze_file(&analyzer_src)?;
                print_results_text(&results);

                println!("\n💡 Meta-Analysis:");
                println!("This analyzer used minimal resources to analyze itself.");
                println!("Eclexia-inspired design: explicit resource tracking from day 1.");
            } else {
                println!("Run from sustainabot repository root.");
            }
        }
    }

    Ok(())
}

fn print_results_text(results: &[sustainabot_metrics::AnalysisResult]) {
    for result in results {
        println!("\n📍 Function: {}", result.location.name.as_deref().unwrap_or("<anonymous>"));
        println!("   Location: {}:{}", result.location.line, result.location.column);
        println!("\n   Resources:");
        println!("     Energy:   {:.2} J", result.resources.energy.0);
        println!("     Time:     {:.2} ms", result.resources.duration.0);
        println!("     Carbon:   {:.4} gCO2e", result.resources.carbon.0);
        println!("     Memory:   {} bytes", result.resources.memory.0);

        println!("\n   Health Index:");
        println!("     Eco:      {:.1}/100", result.health.eco_score.0);
        println!("     Econ:     {:.1}/100", result.health.econ_score.0);
        println!("     Quality:  {:.1}/100", result.health.quality_score);
        println!("     Overall:  {:.1}/100", result.health.overall);

        if !result.recommendations.is_empty() {
            println!("\n   Recommendations:");
            for rec in &result.recommendations {
                println!("     • {}", rec);
            }
        }
    }

    println!("\n✅ Analysis complete");
}
