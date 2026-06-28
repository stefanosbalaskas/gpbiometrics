# Smooth a Gazepoint pulse/PPG signal

Smooth a Gazepoint pulse/PPG signal

## Usage

``` r
smooth_gazepoint_ppg_signal(
  x,
  sampling_rate_hz,
  method = c("mean", "median"),
  window_seconds = 0.1
)
```

## Arguments

- x:

  Numeric signal.

- sampling_rate_hz:

  Sampling rate in Hz.

- method:

  Smoothing method: mean or median.

- window_seconds:

  Smoothing window length.

## Value

Smoothed numeric signal.
