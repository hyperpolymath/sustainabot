;; SPDX-License-Identifier: PMPL-1.0-or-later
;; ECOSYSTEM.scm - Ecosystem relationships for sustainabot
;; Media-Type: application/vnd.ecosystem+scm

(ecosystem
  (version "1.0.0")
  (name "sustainabot")
  (type "analysis-bot")
  (purpose "Ecological and economic code analysis platform. Makes carbon intensity,
    energy efficiency, Pareto optimality, and allocative efficiency first-class
    concerns in software development. Practices what it preaches via dogfooding.")

  (position-in-ecosystem
    (role "verifier-tier-bot")
    (layer "sustainability-analysis")
    (fleet-tier "verifier")
    (execution-order 3)
    (description "Runs in parallel with rhodibot and echidnabot as a Verifier-tier bot.
      Produces sustainability findings that inform downstream bots. Its carbon and
      efficiency metrics feed into finishbot's release readiness assessment."))

  (related-projects
    (parent
      (gitbot-fleet
        (relationship "fleet-member")
        (description "Sustainabot is one of six specialized bots in the gitbot-fleet.
          It is the only bot focused on ecological and economic analysis.")
        (integration "Publishes sustainability findings via shared-context API")))
    (engine
      (hypatia
        (relationship "rules-engine")
        (description "Hypatia determines sustainability thresholds and policy rules.
          Its neurosymbolic reasoning can encode complex ecological constraints
          (e.g. 'repos with >100 gCO2e/build must optimize before release').")
        (integration "Receives sustainability rules and threshold configurations")))
    (executor
      (robot-repo-automaton
        (relationship "fix-executor")
        (description "When sustainabot identifies energy anti-patterns with known
          fixes (e.g. replacing busy-wait loops), robot-repo-automaton applies them.")
        (integration "Sends FixRequest actions for energy optimization patterns")))
    (theoretical-foundations
      (eclexia
        (relationship "policy-language")
        (description "Eclexia is the ecological economics language that provides
          sustainabot's theoretical foundation. Shadow prices, resource tracking,
          and Pareto optimality concepts come from Eclexia's type system.")
        (status "Eclexia at 55% completion. Sustainabot uses its principles
          in Rust implementation while FFI to actual Eclexia interpreter is planned."))
      (oikos
        (relationship "name-origin")
        (description "Sustainabot was originally called 'oikos-bot' after the Greek
          word for household/ecosystem — the root of both 'ecology' and 'economics'.")))
    (siblings
      (rhodibot
        (relationship "peer-verifier")
        (description "Both are Verifier-tier bots. Rhodibot checks structural compliance,
          sustainabot checks ecological compliance. Independent but complementary."))
      (echidnabot
        (relationship "peer-verifier")
        (description "Both are Verifier-tier bots. Echidnabot verifies mathematical
          correctness, sustainabot verifies ecological efficiency."))
      (seambot
        (relationship "potential-consumer")
        (description "Sustainabot's efficiency metrics could inform seambot about
          which architectural boundaries cause the most energy waste."))
      (finishingbot
        (relationship "consumer")
        (description "Finishbot uses sustainabot's carbon metrics as part of release
          readiness validation. Repos exceeding carbon thresholds may be flagged.")))
    (infrastructure
      (git-private-farm
        (relationship "propagation")
        (description "Sustainability reports propagate across all forges via mirroring."))
      (rsr-template-repo
        (relationship "standard")
        (description "RSR templates could include sustainabot configuration defaults
          so new repos are born with sustainability awareness."))))

  (what-this-is
    "An ecological and economic code analysis platform"
    "A carbon intensity estimator using ISO/IEC 21031:2024 SCI specification"
    "An energy pattern detector (busy-waiting, inefficient I/O, polling)"
    "A Pareto optimality analyzer for multi-objective code optimization"
    "A dogfooding example: the analyzer itself is designed with ecological principles"
    "A Verifier-tier bot in the gitbot-fleet ecosystem")

  (what-this-is-not
    "Not a general performance profiler — it focuses on ecological metrics"
    "Not a runtime monitor — it performs static AST analysis"
    "Not a carbon offset calculator — it estimates code-level energy impact"
    "Not a standalone tool — it integrates with the gitbot-fleet"
    "Not a replacement for actual energy measurement — it provides estimates"
    "Not feature-complete — Eclexia FFI integration is Phase 2"))
