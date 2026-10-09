# Process Gazepoint pulse/PPG data in overlapping HeartPy-style segments

Process Gazepoint pulse/PPG data in overlapping HeartPy-style segments

## Usage

``` r
process_gazepoint_ppg_segmentwise(
  data,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL,
  window_seconds = 60,
  overlap = 0.5,
  min_segment_seconds = 10,
  clean_rr = TRUE,
  clean_rr_method = c("quotient", "iqr", "modified_z", "zscore", "none"),
  frequency_method = c("welch", "fft", "periodogram"),
  ...
)
```

## Arguments

- data:

  Data frame or numeric pulse/PPG signal.

- signal_col:

  Signal column when data is a data frame.

- time_col:

  Time column.

- group_cols:

  Optional grouping columns.

- sampling_rate_hz:

  Sampling rate in Hz.

- window_seconds:

  Segment length.

- overlap:

  Segment overlap proportion.

- min_segment_seconds:

  Minimum segment duration to process.

- clean_rr:

  Whether to clean RR intervals.

- clean_rr_method:

  RR cleaning method.

- frequency_method:

  Frequency-domain method.

- ...:

  Additional arguments passed to detect_gazepoint_ppg_peaks().

## Value

A list with segment table, peaks, measures, frequency, and settings.
