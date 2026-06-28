# Compute pyHRV-style Lomb PSD

Compute pyHRV-style Lomb PSD

## Usage

``` r
compute_gazepoint_pyhrv_lomb_psd(
  nni_ms,
  time_s = NULL,
  min_hz = 0.003,
  max_hz = 0.4,
  n_freq = 512
)
```

## Arguments

- nni_ms:

  Numeric NN intervals in milliseconds.

- time_s:

  Optional time vector in seconds.

- min_hz:

  Minimum frequency.

- max_hz:

  Maximum frequency.

- n_freq:

  Number of frequencies.

## Value

List with PSD and measures.
