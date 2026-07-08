# Create a compact Gazepoint methods section

Generate conservative, manuscript-ready methods text from available
Gazepoint workflow objects. The function reports workflow structure and
audit coverage only; it does not infer emotion, stress, cognition,
preference, diagnosis, mechanism, or exact temporal onset from biometric
or gaze-linked signals.

## Usage

``` r
create_gazepoint_methods_section(
  export_profile = NULL,
  design_audit = NULL,
  event_audit = NULL,
  condition_audit = NULL,
  decision_log = NULL,
  package_version = as.character(utils::packageVersion("gpbiometrics")),
  validation = NULL,
  include_guardrails = TRUE
)
```

## Arguments

- export_profile:

  Optional object from
  [`profile_gazepoint_export_folder()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/profile_gazepoint_export_folder.md).

- design_audit:

  Optional object from
  [`audit_gazepoint_experiment_design()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_experiment_design.md).

- event_audit:

  Optional object from
  [`audit_gazepoint_event_coverage()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_event_coverage.md).

- condition_audit:

  Optional object from
  [`audit_gazepoint_condition_balance()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_condition_balance.md).

- decision_log:

  Optional object from
  [`create_gazepoint_analysis_decision_log()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_analysis_decision_log.md).

- package_version:

  Package version to report. Defaults to the installed gpbiometrics
  version.

- validation:

  Optional named list with validation entries, for example
  `list(test = "PASS 2322", check = "0 errors, 0 warnings, 0 notes")`.

- include_guardrails:

  Logical. If `TRUE`, append conservative interpretation guardrails.

## Value

A character vector with class `"gazepoint_report_text"`.

## Examples

``` r
log <- create_gazepoint_analysis_decision_log(study_id = "demo")
create_gazepoint_methods_section(decision_log = log)
#> Gazepoint biometric workflow processing was conducted using gpbiometrics 0.3.0.9000, an R package designed for importing, checking, preprocessing, summarising, and reporting Gazepoint Biometrics and GP3-derived biometric exports.
#>
#> Workflow decisions were recorded in a structured analysis decision log. The log contained 0 decision record(s), covering exclusions, preprocessing choices, quality-control decisions, analysis settings, or reviewer-facing notes where applicable.
#>
#> All biometric, gaze-linked, and time-course outputs were treated as workflow descriptors. They were not interpreted as direct measures of emotion, stress, cognition, preference, health status, diagnosis, mechanism, or precise temporal onset.
```
