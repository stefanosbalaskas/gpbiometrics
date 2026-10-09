# Create a Gazepoint quality-control supplement section

Generate a compact reviewer-facing quality-control supplement from
available export-profile, design-audit, event-audit, condition-balance,
and decision-log objects.

## Usage

``` r
create_gazepoint_qc_supplement(
  export_profile = NULL,
  design_audit = NULL,
  event_audit = NULL,
  condition_audit = NULL,
  decision_log = NULL,
  title = "Gazepoint workflow quality-control supplement"
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

- title:

  Section title.

## Value

A character vector with class `"gazepoint_report_text"`.
