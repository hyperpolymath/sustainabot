;; SPDX-License-Identifier: PMPL-1.0-or-later
;; META.scm - Architectural decisions and project meta-information for sustainabot
;; Media-Type: application/meta+scheme

(define-meta sustainabot
  (version "1.0.0")

  (architecture-decisions
    ((adr-001 accepted "2025-01-29"
      "Need a software sustainability analysis tool for the ecosystem"
      "Build sustainabot as a hybrid Rust + Eclexia platform that practices
       what it preaches (dogfooding). The analyzer itself follows Eclexia
       principles: explicit resource tracking, shadow prices, measurable cost."
      "Provides ecological analysis. Dogfooding proves Eclexia works.
       Rust ensures performance while Eclexia provides theoretical foundation.")

     (adr-002 accepted "2025-01-29"
      "Eclexia interpreter is only 55% complete — cannot wait for it"
      "Implement core analysis in Rust with Eclexia-inspired type system.
       Use Eclexia interpreter for policy engine (FFI) when ready.
       Cargo workspace: sustainabot-metrics, sustainabot-analysis,
       sustainabot-cli, sustainabot-eclexia (FFI stub)."
      "Unblocked development. Clean separation allows Eclexia integration
       later without rewriting. Metrics crate captures Eclexia's resource
       types (Energy, Carbon, Duration, Memory) in Rust.")

     (adr-003 accepted "2025-01-29"
      "Need to analyze code for energy patterns without runtime measurement"
      "Use tree-sitter for AST parsing. Estimate resources from code structure:
       Energy = Complexity * 0.1J, Carbon = Energy * grid_intensity (475 gCO2e/kWh),
       Time = Complexity * 0.5ms, Memory = Complexity * 2KB."
      "Static analysis is fast and repeatable. Estimates are rough but
       directionally correct. Tree-sitter supports Rust, JS, and many languages.
       Can be calibrated against actual measurements later.")

     (adr-004 accepted "2025-01-29"
      "The tool should demonstrate its own principles"
      "Add 'self-analyze' command: sustainabot analyzes its own source code
       and reports its own resource usage. This is the dogfooding principle."
      "Proves the tool works on real code. Demonstrates Eclexia principles
       in practice. Makes the tool self-documenting — its own metrics are
       a usage example.")

     (adr-005 proposed "2026-02-05"
      "Carbon estimation uses static averages — need real grid data"
      "Integrate with ElectricityMaps or WattTime API for real-time grid
       carbon intensity. Fall back to ISO 21031 SCI specification defaults."
      "Would dramatically improve accuracy of carbon estimates. API dependency
       adds complexity but the fallback keeps offline operation possible.")

     (adr-006 proposed "2026-02-05"
      "Need to connect sustainability metrics to economic decision-making"
      "Add Pareto optimality analysis: identify code changes that improve
       one metric (energy, time, memory) without worsening others. Use
       allocative efficiency concepts from Eclexia to quantify trade-offs."
      "Makes sustainability actionable — developers see which optimizations
       are Pareto-improving (pure wins) vs which require trade-offs.")

     (adr-007 proposed "2026-02-05"
      "Sustainabot needs to work within the gitbot-fleet coordination system"
      "Integrate as Verifier-tier bot. Publish sustainability findings to
       shared-context. Support consultant/advisor/regulator modes."
      "Enables fleet-wide sustainability analysis. Findings feed into
       finishbot for release gating. Hypatia rules can set thresholds.")))

  (development-practices
    (code-style
      "Cargo workspace with 4 crates. Rust with tree-sitter for AST parsing.
       Eclexia-inspired type system for resource tracking. Metrics types are
       newtypes wrapping f64 for type safety.")
    (security
      "No external API keys in source. Grid intensity APIs use env vars.
       No shell injection vectors. Hypatia neurosymbolic scanning enabled.")
    (testing
      "Unit tests for metrics types. Integration tests for file analysis.
       Self-analysis ('sustainabot self-analyze') as continuous validation.")
    (versioning "Semantic versioning (semver).")
    (documentation
      "README.hybrid.md explains the Rust+Eclexia strategy.
       STATE.scm tracks implementation progress.
       Eclexia policy examples in policies/ directory.")
    (branching "Main branch protected. Feature branches for new work. PRs required."))

  (design-rationale
    (why-ecological-analysis
      "Software has a carbon footprint. Data centers consume 1-2% of global
       electricity. Making energy efficiency measurable at the code level —
       even approximately — creates awareness and enables optimization.
       Sustainabot makes the invisible environmental cost of code visible.")
    (why-economic-framing
      "Ecology and economics share the same root (oikos). Treating energy as
       a resource with a shadow price (from Eclexia) connects environmental
       concerns to economic decision-making frameworks developers already
       understand. Pareto optimality is a rigorous way to evaluate trade-offs.")
    (why-dogfooding
      "A sustainability tool that wastes resources is hypocritical. By analyzing
       its own code and reporting its own metrics, sustainabot demonstrates
       that the principles it enforces are achievable in practice.")
    (why-tree-sitter
      "Tree-sitter provides incremental, fault-tolerant parsing for 50+ languages.
       It enables sustainabot to analyze polyglot codebases without custom parsers
       for each language. Complexity estimation from AST structure is language-agnostic.")
    (why-eclexia-foundation
      "Eclexia provides the theoretical rigor — shadow prices, resource types,
       allocative efficiency — that elevates sustainabot above a simple 'lint for
       energy'. The hybrid approach means we can ship now (Rust) while building
       toward the full vision (Eclexia policy engine).")))
