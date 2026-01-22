;; SPDX-License-Identifier: PMPL-1.0-or-later
;; AGENTIC.scm - AI agent interaction patterns for sustainabot

(define agentic-config
  `((version . "1.0.0")
    (project . "sustainabot")

    (patterns
      ((sustainability-analysis
         (focus . ("dependency-health" "license-compliance" "maintenance-burden"))
         (check-for
           ("Abandoned dependencies (>1 year no commits)"
            "Incompatible licenses"
            "Unmaintained security vulnerabilities"
            "High build complexity")))

       (economic-evaluation
         (metrics
           ("Lines of code (tech debt proxy)"
            "Cyclomatic complexity"
            "Test coverage gaps"
            "CI/CD run time"
            "Dependency update frequency"))
         (analysis
           ("Cost to maintain current approach"
            "Cost to refactor/replace"
            "Risk of inaction")))))

    (constraints
      ((languages
         (primary . "rust")
         (analysis . "julia"))

       (banned . ("typescript" "node" "python" "go"))

       (analysis-principles
         ("Focus on actionable insights"
          "Prioritize by impact × effort"
          "Never suggest rewrites lightly"
          "Consider team expertise in recommendations"))))))
