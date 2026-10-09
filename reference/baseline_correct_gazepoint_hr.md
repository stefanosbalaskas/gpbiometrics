# Baseline-correct Gazepoint heart rate

Adds a baseline-corrected heart-rate column to a Gazepoint Biometrics
table. `HRV` is treated as the heart-rate validity flag, not as a
heart-rate variability metric.

## Usage

``` r
baseline_correct_gazepoint_hr(
  data,
  baseline_rows,
  value_column = "HR",
  validity_column = "HRV",
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

  Heart-rate value column. Defaults to `"HR"`.

- validity_column:

  Heart-rate validity column. Defaults to `"HRV"`.

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
