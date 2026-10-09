# Create a Gazepoint audit-report section

Create a concise integrated report section from available Gazepoint
audit objects.

## Usage

``` r
create_gazepoint_audit_report_section(
  export_profile = NULL,
  design_audit = NULL,
  event_audit = NULL,
  condition_audit = NULL,
  decision_log = NULL,
  include_warnings = TRUE
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

- include_warnings:

  Logical. If `TRUE`, include warning summaries.

## Value

A character vector with class `"gazepoint_report_text"`.
