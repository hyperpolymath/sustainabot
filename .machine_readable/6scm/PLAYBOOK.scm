;; SPDX-License-Identifier: PMPL-1.0-or-later
;; PLAYBOOK.scm - Operational runbook for sustainabot

(define playbook
  `((version . "1.0.0")
    (project . "sustainabot")

    (procedures
      ((analyze-sustainability
         (steps
           ("1. Scan dependencies for abandoned projects"
            "2. Check license compatibility"
            "3. Analyze build complexity"
            "4. Estimate maintenance burden"
            "5. Generate sustainability report"))
         (troubleshooting
           ((issue . "False positive abandoned dependency")
            (solution . "Check GitHub archive status, verify last commit date"))))

       (economic-analysis
         (steps
           ("1. Calculate tech debt via code metrics"
            "2. Estimate refactoring cost"
            "3. Analyze CI/CD efficiency"
            "4. Report cost/benefit of alternatives")))

       (generate-sustainability-report
         (steps
           ("1. Aggregate findings from all analyzers"
            "2. Prioritize issues by severity"
            "3. Generate markdown report"
            "4. Create GitHub issue with recommendations")))))

    (alerts
      ((medium-priority
         (trigger . "Critical dependency abandoned")
         (response
           ("1. Search for maintained alternatives"
            "2. Estimate migration effort"
            "3. Create tracking issue"
            "4. Alert maintainers"))
         (escalation . "High if no alternatives found"))))))
