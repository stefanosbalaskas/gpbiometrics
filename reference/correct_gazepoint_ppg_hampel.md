# Apply Hampel-style correction to raw pulse/PPG data

Apply Hampel-style correction to raw pulse/PPG data

## Usage

``` r
correct_gazepoint_ppg_hampel(
  x,
  sampling_rate_hz,
  window_seconds = 1,
  n_sigmas = 3
)
```

## Arguments

- x:

  Numeric signal.

- sampling_rate_hz:

  Sampling rate in Hz.

- window_seconds:

  Running median window length.

- n_sigmas:

  Threshold in MAD units.

## Value

Corrected numeric signal.
