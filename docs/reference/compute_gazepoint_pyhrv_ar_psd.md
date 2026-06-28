# Compute pyHRV-style autoregressive PSD

Compute pyHRV-style autoregressive PSD

## Usage

``` r
compute_gazepoint_pyhrv_ar_psd(
  nni_ms,
  time_s = NULL,
  resample_hz = 4,
  order = NULL
)
```

## Arguments

- nni_ms:

  Numeric NN intervals in milliseconds.

- time_s:

  Optional time vector in seconds.

- resample_hz:

  Resampling frequency.

- order:

  Optional AR order.

## Value

List with PSD and measures.
