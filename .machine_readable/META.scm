;; SPDX-License-Identifier: PMPL-1.0-or-later
;; META.scm - Meta-level information for oikos
;; Media-Type: application/meta+scheme

(meta
  (architecture-decisions
    ("ADR-001" . "Functional-first polyglot architecture (Haskell/OCaml/Rust)")
    ("ADR-002" . "Complete removal of Python in favour of formal symbolic reasoning")
    ("ADR-003" . "Deno as the primary runtime for web-integrated logic")
    ("ADR-004" . "Pareto-optimality as the primary objective function for code health"))

  (development-practices
    (code-style 
      ((haskell . "Fourmolu")
       (ocaml . "OCamlFormat")
       (rescript . "Default")))
    (security
      (principle "Defense in depth")
      (validation "Pre-commit security hooks")
      (disclosure "SECURITY.md"))
    (testing 
      ((property-based "Echidna/QuickCheck")
       (unit "Standard framework per language")))
    (versioning "SemVer")
    (documentation "AsciiDoc")
    (branching "main for stable"))

  (design-rationale 
    ("Why Scheme for Meta?" . "Lisp-family languages provide the homoiconicity required for AI agents to reason about the project structure itself.")))
