# Extract BioSPPy-style EDA events from Gazepoint GSR/EDA data

Extract BioSPPy-style EDA events from Gazepoint GSR/EDA data

## Usage

``` r
extract_gazepoint_eda_events_biosppy_style(
  data,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL,
  smoothing_seconds = 1,
  min_amplitude = NULL,
  min_distance_seconds = 1,
  onset_window_seconds = 4
)
```

## Arguments

- data:

  Data frame or numeric EDA/GSR signal.

- signal_col:

  EDA/GSR column.

- time_col:

  Optional time column in seconds.

- group_cols:

  Optional grouping columns.

- sampling_rate_hz:

  Sampling rate in Hz.

- smoothing_seconds:

  Smoothing window for tonic estimate.

- min_amplitude:

  Minimum SCR amplitude.

- min_distance_seconds:

  Minimum distance between SCR peaks.

- onset_window_seconds:

  Window before peak used to find onset.

## Value

Data frame of EDA events.
