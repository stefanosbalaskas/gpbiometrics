# Run a full HeartPy-style Gazepoint pulse/PPG process

Run a full HeartPy-style Gazepoint pulse/PPG process

## Usage

``` r
process_gazepoint_ppg_heartpy_style(
  data,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL,
  clean_rr = TRUE,
  clean_rr_method = c("quotient", "iqr", "modified_z", "zscore", "none"),
  frequency_method = c("welch", "fft", "periodogram"),
  output_dir = NULL,
  ...
)
```

## Arguments

- data:

  Data frame or numeric pulse/PPG signal.

- signal_col:

  Signal column when data is a data frame.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- sampling_rate_hz:

  Sampling rate in Hz.

- clean_rr:

  Whether to clean RR intervals after peak rejection.

- clean_rr_method:

  RR cleaning method.

- frequency_method:

  Frequency-domain method.

- output_dir:

  Optional output directory. If NULL, no files are written.

- ...:

  Additional arguments passed to detect_gazepoint_ppg_peaks().

## Value

A list with detection, peaks, measures, frequency, quality, report, and
settings.
