# Baseline-correct Gazepoint GSR/EDA

Adds a baseline-corrected GSR/EDA column to a Gazepoint Biometrics
table. When available, `GSR_US` is used by default because it represents
skin conductance in microsiemens in Gazepoint exports. The baseline is
estimated from rows selected by `baseline_rows`, optionally within
groups.

## Usage

``` r
baseline_correct_gazepoint_gsr(
  data,
  baseline_rows,
  value_column = NULL,
  validity_column = "GSRV",
  group_columns = NULL,
  output_column = NULL,
  summary = c("mean", "median"),
  exclude_zero = TRUE
)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- baseline_rows:

  Logical vector identifying baseline rows.

- value_column:

  Optional GSR/EDA value column. If `NULL`, `GSR_US` is used when
  present, otherwise `GSR`.

- validity_column:

  Optional validity column. Defaults to `"GSRV"`.

- group_columns:

  Optional grouping columns. When supplied, baselines are estimated
  separately within each group.

- output_column:

  Name of the corrected output column.

- summary:

  Baseline summary, either `"mean"` or `"median"`.

- exclude_zero:

  Should zero values be excluded from baseline estimation?

## Value

A data frame with the added baseline-corrected column and a
baseline-summary attribute named `"baseline_summary"`.
