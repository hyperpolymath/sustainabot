;;; STATE.scm - Project Checkpoint
;;; sustainabot (formerly oikos-bot / git-eco-bot)
;;; Format: Guile Scheme S-expressions
;;; Purpose: Preserve AI conversation context across sessions
;;; Reference: https://github.com/hyperpolymath/state.scm

;; SPDX-License-Identifier: PMPL-1.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

;;;============================================================================
;;; METADATA
;;;============================================================================

(define metadata
  '((version . "0.2.0")
    (schema-version . "1.0")
    (created . "2025-12-15")
    (updated . "2026-02-05")
    (project . "sustainabot")
    (repo . "github.com/hyperpolymath/sustainabot")))

;;;============================================================================
;;; PROJECT CONTEXT
;;;============================================================================

(define project-context
  '((name . "sustainabot")
    (tagline . "Ecological & Economic Code Analysis - resource-aware design verification")
    (version . "0.2.0")
    (license . "PMPL-1.0-or-later")
    (rsr-compliance . "gold-target")

    (tech-stack
     ((primary . "Rust (workspace: 5 crates)")
      (analysis . "tree-sitter AST parsing")
      (ci-cd . "GitHub Actions + GitLab CI + Bitbucket Pipelines")
      (security . "CodeQL + OSSF Scorecard")))))

;;;============================================================================
;;; CURRENT POSITION
;;;============================================================================

(define current-position
  '((phase . "v0.2 - Phase 1 Complete, Phase 2-3 Stubs")
    (overall-completion . 25)

    (components
     ((sustainabot-metrics
       ((status . "complete")
        (completion . 90)
        (notes . "AnalysisResult, ResourceUsage, HealthIndex, EcoScore types defined")))

      (sustainabot-analysis
       ((status . "active")
        (completion . 40)
        (notes . "tree-sitter Rust/JS parsing, function-level analysis, 933 lines")))

      (sustainabot-eclexia
       ((status . "stub")
        (completion . 10)
        (notes . "Eclexia integration placeholder, resource-aware principles")))

      (sustainabot-cli
       ((status . "active")
        (completion . 60)
        (notes . "analyze/check/self-analyze commands, recursive dir walking, eco threshold")))

      (sustainabot-bot
       ((status . "stub")
        (completion . 5)
        (notes . "GitHub App integration scaffolding only")))

      (rsr-compliance
       ((status . "complete")
        (completion . 100)
        (notes . "SHA-pinned actions, SPDX headers, multi-platform CI")))))

    (working-features
     ("tree-sitter AST parsing for Rust and JavaScript"
      "Function-level resource estimation (Energy, Carbon, Duration, Memory)"
      "EcoScore and EconScore health indices (0-100)"
      "Quality score based on code complexity metrics"
      "Single file analysis (sustainabot analyze <file>)"
      "Recursive directory analysis (sustainabot check <dir>)"
      "Eco threshold gating (--eco-threshold, exit 1 if below)"
      "Self-analysis dogfooding mode"
      "JSON and text output formats"
      "Filtered directory walking (skips target/node_modules/.git/dist/build/.cache)"
      "Summary statistics (avg eco, avg overall, total energy, total carbon)"
      "RSR-compliant CI/CD pipeline"
      "Multi-platform mirroring (GitHub, GitLab, Bitbucket)"))))

;;;============================================================================
;;; ROUTE TO MVP
;;;============================================================================

(define route-to-mvp
  '((target-version . "1.0.0")
    (definition . "Full ecological+economic analysis with fleet integration")

    (milestones
     ((v0.1
       ((name . "Phase 1 - Core Analysis")
        (status . "complete")
        (items
         ("tree-sitter Rust/JS parsing" . done)
         ("Function-level resource estimation" . done)
         ("CLI with analyze command" . done)
         ("EcoScore/EconScore metrics" . done))))

      (v0.2
       ((name . "Phase 1b - Directory Analysis")
        (status . "complete")
        (items
         ("Recursive directory checking" . done)
         ("Eco threshold gating" . done)
         ("Summary statistics" . done))))

      (v0.5
       ((name . "Phase 2 - Deep Analysis")
        (status . "planned")
        (items
         ("SARIF output format" . todo)
         ("Dependency chain analysis" . todo)
         ("Build system integration" . todo)
         ("Benchmark calibration" . todo))))

      (v1.0
       ((name . "Phase 3 - Fleet Integration")
        (status . "planned")
        (items
         ("GitHub App integration" . todo)
         ("Shared context publishing" . todo)
         ("Fleet coordinator wire-up" . todo)
         ("CI/CD gate mode" . todo))))))))

;;;============================================================================
;;; BLOCKERS & ISSUES
;;;============================================================================

(define blockers-and-issues
  '((critical
     ())

    (high-priority
     ("Phase 2 analysis features are stubs only"))

    (medium-priority
     ((resource-calibration
       ((description . "Energy/carbon estimates are heuristic, not calibrated")
        (impact . "Estimates may not reflect real-world resource usage")
        (needed . "Benchmark suite for calibration")))))

    (low-priority
     ((additional-languages
       ((description . "Only Rust and JavaScript supported")
        (impact . "Cannot analyze other ecosystem languages")
        (needed . "Add tree-sitter grammars for more languages")))))))

;;;============================================================================
;;; CRITICAL NEXT ACTIONS
;;;============================================================================

(define critical-next-actions
  '((immediate
     (("Add SARIF output format for IDE integration" . high)
      ("Calibrate energy/carbon estimates with benchmarks" . high)
      ("Wire up shared-context for fleet integration" . medium)))

    (this-week
     (("Add dependency chain analysis" . high)
      ("Implement build system cost estimation" . medium)))

    (this-month
     (("Complete Phase 2 deep analysis" . high)
      ("GitHub App integration for PR comments" . medium)))))

;;;============================================================================
;;; SESSION HISTORY
;;;============================================================================

(define session-history
  '((snapshots
     ((date . "2026-02-05")
      (session . "opus-continuation")
      (accomplishments
       ("Implemented recursive directory checking in sustainabot-cli"
        "Added walkdir dependency for directory traversal"
        "Eco threshold gating with exit code 1 on failure"
        "Summary statistics: avg eco/overall scores, total energy/carbon"
        "Filtered directory walking (skips target/node_modules/.git/dist/build/.cache)"
        "Fixed STATE.scm: oikos-bot → sustainabot, AGPL → PMPL, updated completion"
        "Verified compilation with cargo check (0 errors)"))
     ((date . "2025-12-25")
      (session . "github-app-manifest")
      (accomplishments
       ("Created .github/app.yml - GitHub App manifest for developer programme"
        "Added manifest flow documentation to DEPLOY.md"
        "Configured permissions: contents:read, pull_requests:write, checks:write")))
     ((date . "2025-12-17")
      (session . "scm-security-review")
      (accomplishments
       ("Fixed critical bug in security-policy.yml"
        "Fixed dependabot.yml scoping"
        "Comprehensive review of all 10 GitHub workflows"
        "Verified SHA-pinned actions across all workflows")))
     ((date . "2025-12-15")
      (session . "initial-state-creation")
      (accomplishments
       ("Added META.scm, ECOSYSTEM.scm, STATE.scm"
        "Established RSR compliance"
        "Created initial project checkpoint"))))))

;;;============================================================================
;;; HELPER FUNCTIONS (for Guile evaluation)
;;;============================================================================

(define (get-completion-percentage component)
  "Get completion percentage for a component"
  (let ((comp (assoc component (cdr (assoc 'components current-position)))))
    (if comp
        (cdr (assoc 'completion (cdr comp)))
        #f)))

(define (get-blockers priority)
  "Get blockers by priority level"
  (cdr (assoc priority blockers-and-issues)))

(define (get-milestone version)
  "Get milestone details by version"
  (assoc version (cdr (assoc 'milestones route-to-mvp))))

;;;============================================================================
;;; EXPORT SUMMARY
;;;============================================================================

(define state-summary
  '((project . "sustainabot")
    (version . "0.2.0")
    (overall-completion . 25)
    (next-milestone . "v0.5 - Phase 2 Deep Analysis")
    (critical-blockers . 0)
    (high-priority-issues . 1)
    (updated . "2026-02-05")))

;;; End of STATE.scm
