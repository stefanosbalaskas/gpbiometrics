# Estimate breathing rate from RR/IBI frequency content

Estimate breathing rate from RR/IBI frequency content

## Usage

``` r
estimate_gazepoint_breathing_rate_from_ibi(
  rr_ms,
  rr_time_s = NULL,
  resample_hz = 4,
  breathing_band = c(0.1, 0.5)
)
```

## Arguments

- rr_ms:

  RR or IBI intervals in milliseconds.

- rr_time_s:

  Optional interval time stamps in seconds.

- resample_hz:

  Interpolation frequency.

- breathing_band:

  Frequency band for breathing-rate search.

## Value

A list with breathing_rate_hz, frequency, psd, and band.
