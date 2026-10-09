# Estimate BioSPPy-style EDA recovery times

Estimate BioSPPy-style EDA recovery times

## Usage

``` r
estimate_gazepoint_eda_recovery_times(
  data,
  events = NULL,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL,
  recovery_prop = 0.5,
  max_recovery_seconds = 10
)
```

## Arguments

- data:

  Data frame or numeric EDA/GSR signal.

- events:

  Optional event table from
  extract_gazepoint_eda_events_biosppy_style().

- signal_col:

  EDA/GSR column.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- sampling_rate_hz:

  Sampling rate in Hz.

- recovery_prop:

  Proportion of amplitude used for recovery threshold.

- max_recovery_seconds:

  Maximum search window after peak.

## Value

Event table with recovery-time columns.
