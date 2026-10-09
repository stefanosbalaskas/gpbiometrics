# Audit session comparability across QC metrics

Aggregates selected QC metrics by session, participant, trial, or
another grouping unit, then flags unusual values using transparent
z-score and/or IQR rules. The function is intended for audit reporting
only and does not imply automatic exclusion.

## Usage

``` r
audit_gazepoint_session_comparability(
  data,
  metric_cols,
  group_cols = NULL,
  method = c("both", "z", "iqr"),
  z_threshold = 2,
  iqr_multiplier = 1.5
)
```

## Arguments

- data:

  A data frame.

- metric_cols:

  Character vector of numeric QC metric columns.

- group_cols:

  Optional character vector defining the session or analysis unit to
  compare.

- method:

  Outlier rule: `"z"`, `"iqr"`, or `"both"`.

- z_threshold:

  Absolute z-score threshold.

- iqr_multiplier:

  IQR multiplier used for Tukey-style fences.

## Value

A list with class `gazepoint_session_comparability_audit`.
