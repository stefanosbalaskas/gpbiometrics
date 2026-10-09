# Compute a pairwise signal-lag matrix

Computes pairwise lag/correlation summaries across synchronized numeric
signals. The output is useful as a compact multimodal lag screen before
event-locked or mixed-model analyses.

## Usage

``` r
compute_gazepoint_signal_lag_matrix(
  data,
  signal_cols = NULL,
  time_col = NULL,
  group_cols = NULL,
  max_lag_s = 2,
  lag_step_s = NULL,
  min_overlap = 10
)
```

## Arguments

- data:

  Data frame with a common time column and numeric signals.

- signal_cols:

  Numeric signal columns. If omitted, all numeric columns except
  `time_col` and `group_cols` are used.

- time_col:

  Time column.

- group_cols:

  Optional grouping columns.

- max_lag_s:

  Maximum lag in seconds.

- lag_step_s:

  Optional lag-step size. If omitted, the median sample interval is
  used.

- min_overlap:

  Minimum paired samples required per lag.

## Value

Data frame with one row per group and signal pair.
