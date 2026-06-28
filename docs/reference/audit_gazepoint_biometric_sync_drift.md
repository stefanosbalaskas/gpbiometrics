# Audit Gazepoint biometric synchronization drift

Combines time-order/reset diagnostics with conservative signal-lag
summaries across signal pairs and groups. The helper is intended for
quality control and synchronization review. It does not infer emotional
valence, cognitive states, causal timing, or true physiological latency.

## Usage

``` r
audit_gazepoint_biometric_sync_drift(
  data,
  time_col = NULL,
  group_cols = NULL,
  signal_pairs = NULL,
  signal_cols = NULL,
  reference_signal_col = NULL,
  max_lag = 1000,
  lag_step = NULL,
  drift_tolerance = NULL,
  method = c("pearson", "spearman"),
  min_complete_pairs = 20,
  use_first_difference = FALSE,
  include_reset_segments = TRUE
)
```

## Arguments

- data:

  A Gazepoint biometric data frame.

- time_col:

  Optional time or counter column.

- group_cols:

  Optional grouping columns.

- signal_pairs:

  Optional two-column data frame, matrix, or list defining signal pairs.
  If `NULL`, pairs are formed between a reference signal and other
  detected biometric signals.

- signal_cols:

  Optional candidate signal columns used when `signal_pairs` is `NULL`.

- reference_signal_col:

  Optional reference signal used when `signal_pairs` is `NULL`.

- max_lag:

  Maximum absolute lag to evaluate, in the same units as `time_col`.

- lag_step:

  Step size between candidate lags. If `NULL`, the median positive time
  step is used.

- drift_tolerance:

  Optional threshold for the range of estimated lags across groups. If
  `NULL`, drift is summarized but not threshold-classified.

- method:

  Correlation method passed to
  [`stats::cor()`](https://rdrr.io/r/stats/cor.html).

- min_complete_pairs:

  Minimum complete aligned observations required for each candidate lag.

- use_first_difference:

  If `TRUE`, lag diagnostics use first differences.

- include_reset_segments:

  If `TRUE`, reset segments from
  [`audit_gazepoint_time_resets()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_time_resets.md)
  are added to grouping when available.

## Value

A list with `overview`, `checks`, `time_reset_audit`, `lag_by_group`,
`lag_profile`, `drift_summary`, and `settings`.
