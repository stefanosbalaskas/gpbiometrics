# Apply a second-order Butterworth-style low-pass filter to pulse/PPG data

Apply a second-order Butterworth-style low-pass filter to pulse/PPG data

## Usage

``` r
filter_gazepoint_ppg_butterworth(
  x,
  cutoff_hz = 5,
  sampling_rate_hz,
  passes = 1L
)
```

## Arguments

- x:

  Numeric signal.

- cutoff_hz:

  Low-pass cutoff frequency in Hz.

- sampling_rate_hz:

  Sampling rate in Hz.

- passes:

  Number of repeated two-pole sections.

## Value

Filtered numeric signal.
