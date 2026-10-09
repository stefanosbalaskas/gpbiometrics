# Detect stochastic change points in noisy biometric signals

Detects abrupt changes in noisy biological time series using a
dependency-light stochastic rolling-window approximation. The score
combines adjacent-window changes in mean and variance with a robust
adaptive threshold.

## Usage

``` r
detect_gazepoint_doubly_stochastic_changepoints(
  dat,
  signal_col,
  time_col = "CNT",
  group_cols = NULL,
  window_seconds = 10,
  step_seconds = 2,
  threshold_mad_multiplier = 6,
  min_distance_s = 5
)
```

## Arguments

- dat:

  A data frame.

- signal_col:

  Numeric signal column.

- time_col:

  Numeric time column.

- group_cols:

  Optional grouping columns.

- window_seconds:

  Window length in seconds.

- step_seconds:

  Step size in seconds.

- threshold_mad_multiplier:

  Robust threshold multiplier.

- min_distance_s:

  Minimum distance between detected change points.

## Value

A list with `overview`, `score_table`, `changepoints`, and `settings`.

## Details

This is not a full reproduction of any specific doubly stochastic model.
It is a transparent approximation for QC and exploratory segmentation.
