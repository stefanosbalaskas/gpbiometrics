# Run a Gazepoint pulse/PPG cross-check against HeartPy when available

If Python HeartPy is available through reticulate, this function
attempts to run heartpy.process() on the first group. Otherwise it
returns native Gazepoint HeartPy-style results only.

## Usage

``` r
run_gazepoint_heartpy_crosscheck(
  data,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL,
  ...
)
```

## Arguments

- data:

  Data frame containing Gazepoint pulse/PPG samples.

- signal_col:

  Signal column.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- sampling_rate_hz:

  Sampling rate in Hz.

- ...:

  Additional arguments passed to detect_gazepoint_ppg_peaks().

## Value

A list with native, heartpy, and heartpy_available.
