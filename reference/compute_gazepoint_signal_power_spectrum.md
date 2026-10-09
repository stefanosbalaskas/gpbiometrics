# Compute signal power spectrum

Compute signal power spectrum

## Usage

``` r
compute_gazepoint_signal_power_spectrum(x, sampling_rate_hz, detrend = TRUE)
```

## Arguments

- x:

  Numeric signal.

- sampling_rate_hz:

  Sampling rate in Hz.

- detrend:

  If TRUE, remove the mean before FFT.

## Value

Data frame with frequency and power.
