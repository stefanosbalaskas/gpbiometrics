# Detect BioSPPy-style PPG pulse onsets

Detect BioSPPy-style PPG pulse onsets

## Usage

``` r
detect_gazepoint_ppg_onsets(
  data,
  signal_col = NULL,
  time_col = NULL,
  peaks = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL,
  search_seconds = 0.6
)
```

## Arguments

- data:

  Data frame or numeric PPG/BVP signal.

- signal_col:

  PPG/BVP column.

- time_col:

  Optional time column.

- peaks:

  Optional peak table or peak indices.

- group_cols:

  Optional grouping columns.

- sampling_rate_hz:

  Sampling rate in Hz.

- search_seconds:

  Seconds before peak used to find onset.

## Value

Data frame of onsets.
