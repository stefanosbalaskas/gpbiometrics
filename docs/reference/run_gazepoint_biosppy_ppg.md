# Run BioSPPy-style Gazepoint PPG/BVP processing

Run BioSPPy-style Gazepoint PPG/BVP processing

## Usage

``` r
run_gazepoint_biosppy_ppg(
  data,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL
)
```

## Arguments

- data:

  Data frame or numeric PPG/BVP signal.

- signal_col:

  PPG/BVP column.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- sampling_rate_hz:

  Sampling rate in Hz.

## Value

List with filtered signal, peaks, onsets, templates, and heart rate.
