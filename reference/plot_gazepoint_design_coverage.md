# Plot Gazepoint design and event-coverage audits

Create compact diagnostic plots from design, condition-balance, or
event-coverage audit objects.

## Usage

``` r
plot_gazepoint_design_coverage(
  audit,
  type = c("condition_counts", "participant_trials", "event_coverage", "warnings")
)
```

## Arguments

- audit:

  Object returned by
  [`audit_gazepoint_experiment_design()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_experiment_design.md),
  [`audit_gazepoint_event_coverage()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_event_coverage.md),
  or
  [`audit_gazepoint_condition_balance()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_condition_balance.md).

- type:

  Plot type. Supported values depend on the audit object:
  `"condition_counts"`, `"participant_trials"`, `"event_coverage"`, and
  `"warnings"`.

## Value

A `ggplot` object.
