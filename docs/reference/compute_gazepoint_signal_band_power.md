# Compute signal band power

Compute signal band power

## Usage

``` r
compute_gazepoint_signal_band_power(
  x,
  sampling_rate_hz = NULL,
  bands = list(very_low = c(0.003, 0.04), low = c(0.04, 0.15), high = c(0.15, 0.4)),
  relative = TRUE
)
```

## Arguments

- x:

  Numeric signal or power-spectrum data frame.

- sampling_rate_hz:

  Sampling rate in Hz when x is a signal.

- bands:

  Named list of frequency bands.

- relative:

  If TRUE, include relative band power.

## Value

Data frame of band powers.
