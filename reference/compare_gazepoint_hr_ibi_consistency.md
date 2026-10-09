# Compare Gazepoint HR and IBI-derived heart rate

Compares recorded HR against HR derived from genuine IBI/RR intervals
using `60000 / IBI_ms`.

## Usage

``` r
compare_gazepoint_hr_ibi_consistency(
  data,
  hr_col = "HR",
  ibi_col = "IBI",
  time_col = NULL,
  group_cols = NULL,
  unit = c("auto", "ms", "seconds"),
  max_abs_diff_bpm = 10,
  max_rel_diff_prop = 0.15
)
```

## Arguments

- data:

  A Gazepoint biometric data frame or `gazepoint_ibi_filter` object.

- hr_col:

  Heart-rate column in beats per minute.

- ibi_col:

  IBI/RR interval column.

- time_col:

  Optional time/counter column.

- group_cols:

  Optional grouping columns.

- unit:

  Unit of the IBI column: `"auto"`, `"ms"`, or `"seconds"`.

- max_abs_diff_bpm:

  Maximum acceptable absolute HR difference in bpm.

- max_rel_diff_prop:

  Maximum acceptable relative HR difference.

## Value

A list with `overview`, `row_diagnostics`, `group_summary`, and
`settings`.
