# Create a Gazepoint reproducibility statement

Generate a compact reproducibility statement for manuscripts,
supplements, or reviewer responses.

## Usage

``` r
create_gazepoint_reproducibility_statement(
  decision_log = NULL,
  package_version = as.character(utils::packageVersion("gpbiometrics")),
  repository_url = NA_character_,
  validation = NULL,
  data_statement = NA_character_,
  include_guardrails = TRUE
)
```

## Arguments

- decision_log:

  Optional object from
  [`create_gazepoint_analysis_decision_log()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_analysis_decision_log.md).

- package_version:

  Package version to report.

- repository_url:

  Optional repository URL.

- validation:

  Optional named list with validation entries.

- data_statement:

  Optional text describing data availability or synthetic demonstration
  status.

- include_guardrails:

  Logical. If `TRUE`, include conservative interpretation guardrails.

## Value

A character vector with class `"gazepoint_report_text"`.
