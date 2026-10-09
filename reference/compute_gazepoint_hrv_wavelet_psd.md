# Compute a simple Haar-style HRV wavelet PSD summary

Computes a conservative Haar-style multiscale power summary for RR/NN
intervals. This is intended as a lightweight, CRAN-safe exploratory
nonstationary-HRV helper, not as a replacement for specialist HRV
packages.

## Usage

``` r
compute_gazepoint_hrv_wavelet_psd(
  rr_intervals,
  time = NULL,
  bands = list(vlf = c(0.0033, 0.04), lf = c(0.04, 0.15), hf = c(0.15, 0.4)),
  max_scale = NULL
)
```

## Arguments

- rr_intervals:

  Numeric RR/NN intervals in milliseconds or seconds.

- time:

  Optional timestamps for intervals.

- bands:

  Named list of frequency bands in Hz.

- max_scale:

  Optional maximum Haar scale in beats.

## Value

List with `psd`, `band_power`, and `settings`.
