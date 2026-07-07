# Audit gpbiometrics release readiness

Performs conservative package-level checks for release preparation. The
audit inspects package files, exported functions, manual pages, tests,
pkgdown reference pages, vignettes/articles, and optional roadmap terms.
It does not inspect participant-level data and does not make biometric,
psychological, clinical, or diagnostic interpretations.

## Usage

``` r
audit_gazepoint_release_readiness(
  path = ".",
  required_files = c("DESCRIPTION", "NAMESPACE", "R", "man", "tests/testthat",
    "_pkgdown.yml"),
  expected_exports = NULL,
  roadmap_terms = NULL,
  require_pkgdown = TRUE
)
```

## Arguments

- path:

  Package root.

- required_files:

  Character vector of required package paths.

- expected_exports:

  Optional character vector of exported function names expected to be
  present in `NAMESPACE`.

- roadmap_terms:

  Optional character vector of roadmap terms or helper names to check
  across R files, tests, documentation, and pkgdown output.

- require_pkgdown:

  Logical. If `TRUE`, missing pkgdown reference pages for exported
  functions are warnings. If `FALSE`, they are recorded as not-checked.

## Value

A list with checks, overview, exports, feature coverage, release
checklist, and settings. The object has class
`gazepoint_release_readiness_audit`.
