# Apply generic filtering to Gazepoint pulse/PPG data

Apply generic filtering to Gazepoint pulse/PPG data

## Usage

``` r
filter_gazepoint_ppg_signal(
  x,
  sampling_rate_hz,
  type = c("lowpass", "highpass", "bandpass", "notch"),
  low_hz = NULL,
  high_hz = NULL,
  passes = 1L
)
```

## Arguments

- x:

  Numeric signal.

- sampling_rate_hz:

  Sampling rate in Hz.

- type:

  Filter type: lowpass, highpass, bandpass, or notch.

- low_hz:

  Low cutoff for highpass, bandpass, or notch.

- high_hz:

  High cutoff for lowpass, bandpass, or notch.

- passes:

  Repeated filter passes.

## Value

Filtered numeric signal.
