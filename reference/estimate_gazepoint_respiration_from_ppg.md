# Estimate respiration rate from PPG

Estimates an exploratory respiration rate from low-frequency modulation
in a PPG/BVP signal. This is a lightweight screening helper and should
not be interpreted as a replacement for a respiratory sensor.

## Usage

``` r
estimate_gazepoint_respiration_from_ppg(
  data,
  ppg_col = NULL,
  time_col = NULL,
  sampling_rate_hz = NULL,
  respiratory_band_hz = c(0.1, 0.5),
  detrend = TRUE
)
```

## Arguments

- data:

  Data frame or numeric PPG vector.

- ppg_col:

  PPG/BVP signal column for data-frame input.

- time_col:

  Optional time column.

- sampling_rate_hz:

  Sampling rate for vector input or when no time column is available.

- respiratory_band_hz:

  Two-element frequency band used to search for the respiration peak.

- detrend:

  If TRUE, remove a linear trend before spectral estimation.

## Value

List with `summary`, `spectrum`, and `settings`.
