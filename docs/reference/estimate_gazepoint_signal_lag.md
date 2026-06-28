# Estimate lag between two Gazepoint biometric signals

Estimates the time shift that maximizes the association between two
recorded biometric signals within each group. This is a conservative
synchronization diagnostic for inspecting whether two recorded traces
show similar temporal structure at different shifts. It should not be
interpreted as causal timing or true physiological latency unless the
design includes appropriate event markers and independently justified
signal-processing assumptions.

## Usage

``` r
estimate_gazepoint_signal_lag(
  data,
  signal_x_col,
  signal_y_col,
  time_col = NULL,
  group_cols = NULL,
  max_lag = 1000,
  lag_step = NULL,
  method = c("pearson", "spearman"),
  min_complete_pairs = 20,
  use_first_difference = FALSE
)
```

## Arguments

- data:

  A Gazepoint biometric data frame.

- signal_x_col:

  Name of the first signal column.

- signal_y_col:

  Name of the second signal column.

- time_col:

  Optional time or counter column. If `NULL`, a common Gazepoint
  time/counter column is detected.

- group_cols:

  Optional grouping columns, such as participant, stimulus, trial, or
  source file.

- max_lag:

  Maximum absolute lag to evaluate, in the same units as `time_col`.

- lag_step:

  Step size between candidate lags, in the same units as `time_col`. If
  `NULL`, the median positive time step is used.

- method:

  Correlation method passed to
  [`stats::cor()`](https://rdrr.io/r/stats/cor.html).

- min_complete_pairs:

  Minimum complete aligned observations required for a candidate lag.

- use_first_difference:

  If `TRUE`, correlations are estimated on first differences rather than
  raw signal levels.

## Value

A list with `overview`, `lag_by_group`, `lag_profile`, and `settings`.
