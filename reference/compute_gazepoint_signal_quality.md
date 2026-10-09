# Compute transparent signal-quality indicators

Computes conservative, rule-based descriptive quality indicators for one
or more Gazepoint biometric signal columns. The function does not
interpret the physiological meaning of the signal and does not exclude
data.

## Usage

``` r
compute_gazepoint_signal_quality(
  data,
  signal_cols,
  group_cols = NULL,
  flatline_tolerance = 0,
  long_missing_run_threshold = 10,
  long_constant_run_threshold = 10,
  spike_z = 4,
  extreme_z = 4
)
```

## Arguments

- data:

  A data frame.

- signal_cols:

  Character vector of numeric signal columns to evaluate.

- group_cols:

  Optional character vector of grouping columns, such as participant,
  trial, condition, session, window, or segment identifiers.

- flatline_tolerance:

  Numeric tolerance used when detecting adjacent constant values.
  Defaults to 0.

- long_missing_run_threshold:

  Integer threshold used to count whether a segment contains a long
  missing run. The maximum run length is always returned regardless of
  this threshold.

- long_constant_run_threshold:

  Integer threshold used to count whether a segment contains a long
  constant run. The maximum run length is always returned regardless of
  this threshold.

- spike_z:

  Numeric z-score threshold for adjacent-change spikes.

- extreme_z:

  Numeric z-score threshold for extreme standardized values.

## Value

A data frame with class `gazepoint_signal_quality`.
