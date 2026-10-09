# Detect HeartPy-style pulse/PPG peaks in Gazepoint exports

Detect HeartPy-style pulse/PPG peaks in Gazepoint exports

## Usage

``` r
detect_gazepoint_ppg_peaks(
  data,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL,
  bpm_min = 40,
  bpm_max = 180,
  moving_average_seconds = 0.75,
  threshold_offsets = seq(-0.25, 1.25, by = 0.05),
  reconstruct_clipping = TRUE,
  enhance_peaks = FALSE,
  lowpass_hz = NULL,
  hampel = FALSE,
  high_precision = TRUE
)
```

## Arguments

- data:

  Data frame or numeric signal.

- signal_col:

  Signal column when data is a data frame.

- time_col:

  Optional time column in seconds.

- group_cols:

  Optional grouping columns.

- sampling_rate_hz:

  Sampling rate in Hz.

- bpm_min:

  Minimum plausible BPM.

- bpm_max:

  Maximum plausible BPM.

- moving_average_seconds:

  Moving-average half-window scale used for thresholding.

- threshold_offsets:

  Candidate threshold offsets in signal SD units.

- reconstruct_clipping:

  Whether to reconstruct clipped peaks.

- enhance_peaks:

  Whether to run peak enhancement.

- lowpass_hz:

  Optional low-pass cutoff.

- hampel:

  Whether to apply Hampel correction.

- high_precision:

  Whether to refine peak timing by local spline upsampling.

## Value

A list with peaks, processed_signal, settings, and diagnostics.
