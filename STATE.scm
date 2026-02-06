;;; STATE.scm — sustainabot (aka oikos-bot)
;; SPDX-License-Identifier: PMPL-1.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "0.1.0")
    (schema-version . "1.0.0")
    (created . "2025-01-29")
    (updated . "2025-01-29")
    (project . "sustainabot")
    (repo . "hyperpolymath/sustainabot")))

(define project-context
  '((name . "SustainaBot (Oikos Bot)")
    (tagline . "Ecological & Economic Code Analysis Platform")
    (tech-stack . ("Rust" "ReScript" "Eclexia" "Deno"))
    (architecture-approach . "hybrid-eclexia-dogfooding")))

(define current-position
  '((phase . "v0.1 - Hybrid Architecture Implementation")
    (overall-completion . 50)
    (components
      ;; Phase 1: Core Infrastructure (Rust)
      ((analysis-engine-rust
         ((status . "complete")
          (completion . 100)
          (description . "Rust-based AST analysis with Eclexia principles")
          (features . ("resource-tracking" "carbon-estimation" "metrics" "tree-sitter-ast"))
          (notes . "Working! Analyzes Rust & JS, estimates resources, detects patterns")))

       (metrics-crate
         ((status . "complete")
          (completion . 100)
          (description . "Core resource types: Energy, Carbon, Duration, Memory")
          (notes . "Eclexia-inspired design with shadow prices")))

       ;; Phase 2: Bot Integration (ReScript + Deno)
       (bot-integration-rescript
         ((status . "skeleton")
          (completion . 5)
          (description . "GitHub/GitLab webhook handlers")
          (features . ("webhook-server" "pr-comments" "sarif-output"))))

       (fleet-integration
         ((status . "complete")
          (completion . 100)
          (description . "Gitbot-fleet shared context integration")
          (features . ("publish-findings" "ecological-thresholds" "efficiency-ratings"))))

       ;; Phase 3: Policy Engine (Eclexia Interpreter)
       (policy-engine-eclexia
         ((status . "proof-of-concept")
          (completion . 20)
          (description . "Policy rules in Eclexia - dogfooding from day 1")
          (features . ("example-policy" "ffi-stub"))
          (notes . "Example policy written in .ecl, FFI integration next")))

       ;; Supporting Components
       (eclexia-integration
         ((status . "stub")
          (completion . 10)
          (description . "FFI/IPC with Eclexia interpreter")
          (notes . "Stub implementation, ready for Phase 2")))

       (cli-tool
         ((status . "complete")
          (completion . 100)
          (description . "Local analysis CLI with dogfooding feature")
          (features . ("analyze" "check" "self-analyze"))
          (notes . "sustainabot self-analyze demonstrates dogfooding!")))

       (documentation
         ((status . "complete")
          (completion . 100)
          (description . "Architecture, vision, and hybrid approach docs")
          (notes . "README.hybrid.md explains the strategy")))))))

(define route-to-mvp
  '((milestones
      ((m1-foundation
         ((target-date . "2026-02-15")
          (description . "Core Rust analysis engine")
          (items . ("Rust project setup with Cargo workspace"
                    "AST parser for supported languages (start with Rust/JS)"
                    "Resource tracking primitives (energy, time, carbon)"
                    "Basic carbon estimation algorithm"
                    "CLI that can analyze a single file"))))

       (m2-eclexia-integration
         ((target-date . "2026-03-01")
          (description . "Eclexia policy engine integration")
          (items . ("FFI bindings to Eclexia interpreter"
                    "Policy rules defined in .ecl files"
                    "Demonstrate: 'Our policy engine uses 5J to analyze your 100J code'"
                    "Shadow prices guide policy decisions"))))

       (m3-bot-integration
         ((target-date . "2026-03-15")
          (description . "GitHub integration working")
          (items . ("ReScript webhook server on Deno"
                    "PR comment with analysis results"
                    "SARIF output for GitHub Code Scanning"
                    "Basic dashboard"))))

       (m4-mvp
         ((target-date . "2026-04-01")
          (description . "Working end-to-end demo")
          (items . ("Analyze real repos"
                    "Generate actionable recommendations"
                    "Measure own resource usage"
                    "Blog post: 'How we built an ecological analyzer using ecological code'"))))))))

(define blockers-and-issues
  '((critical
      ())
    (high-priority
      (("Decide on AST library for Rust analyzer" . "tree-sitter vs syn vs custom")))
    (medium-priority
      (("Carbon API choice" . "ElectricityMaps vs WattTime vs CO2.js")))
    (low-priority
      ())))

(define critical-next-actions
  '((immediate
      (("Set up Rust workspace for analysis engine" . "high")
       ("Create Cargo.toml with workspace structure" . "high")
       ("Add tree-sitter for AST parsing" . "high")
       ("Design ResourceMetrics types" . "high")))
    (this-week
      (("Implement basic file analyzer" . "medium")
       ("Add carbon estimation baseline" . "medium")
       ("Test with Eclexia's own codebase" . "medium")))
    (this-month
      (("Eclexia FFI bindings" . "medium")
       ("First policy rule in .ecl" . "medium")
       ("ReScript webhook skeleton" . "low")))))

(define session-history
  '((snapshots
      ((date . "2026-02-06")
       (session . "sonnet-fleet-integration")
       (accomplishments . ("Created sustainabot-fleet crate"
                          "Integrated gitbot-shared-context"
                          "Implemented ecological findings publishing"
                          "Added efficiency rating system (A-F scale)"
                          "Ecological thresholds for energy/carbon reporting"
                          "Updated STATE.scm to 50% completion"))
       (notes . "Fleet integration complete. Sustainabot now publishes energy, carbon, and pattern findings to shared context. Analysis results include efficiency ratings and threshold-based warnings. Ready for bot coordination."))

      ((date . "2025-01-29")
       (session . "architecture-design")
       (accomplishments . ("Analyzed Eclexia maturity (55% complete)"
                          "Designed hybrid approach: Rust + Eclexia interpreter"
                          "Created STATE.scm"
                          "Established dogfooding strategy"))
       (notes . "Decision: Build analyzer in Rust with Eclexia principles, use Eclexia interpreter for policy engine. This proves Eclexia works and keeps us unblocked."))

      ((date . "2025-01-29")
       (session . "phase1-implementation")
       (accomplishments . ("Created Cargo workspace with 4 crates"
                          "Implemented sustainabot-metrics (Energy, Carbon, Duration, Memory types)"
                          "Implemented sustainabot-analysis (tree-sitter AST analyzer)"
                          "Implemented sustainabot-cli (with analyze, check, self-analyze commands)"
                          "Created sustainabot-eclexia FFI stub"
                          "Successfully built and tested analyzer"
                          "Analyzed test file - detected nested loops, estimated resources"
                          "Dogfooding feature works: sustainabot self-analyze"
                          "Created example Eclexia policy in policies/energy_threshold.ecl"
                          "Wrote README.hybrid.md explaining the approach"
                          "Updated STATE.scm with progress"))
       (metrics . ("Lines of code: ~1000 Rust"
                  "Build time: ~22s release"
                  "Binary size: ~8MB"
                  "Analysis speed: ~50ms per function"))
       (notes . "Phase 1 COMPLETE! Working analyzer that practices Eclexia principles. Ready for Phase 2 (Eclexia integration).")))))

(define state-summary
  '((project . "sustainabot")
    (completion . 35)
    (blockers . 0)
    (next-milestone . "m2-eclexia-integration")
    (target-date . "2026-03-01")
    (phase1-status . "COMPLETE ✅")
    (updated . "2025-01-29")))

;; Helper functions
(define (get-completion-percentage)
  (cdr (assoc 'overall-completion current-position)))

(define (get-blockers)
  (length (cdr (assoc 'critical blockers-and-issues))))

(define (get-milestone name)
  (assoc name (cdr (assoc 'milestones route-to-mvp))))
