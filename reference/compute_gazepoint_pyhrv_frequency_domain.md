# Compute pyHRV-style frequency-domain summary

Compute pyHRV-style frequency-domain summary

## Usage

``` r
compute_gazepoint_pyhrv_frequency_domain(
  nni_ms,
  time_s = NULL,
  method = c("welch", "lomb", "ar")
)
```

## Arguments

- nni_ms:

  Numeric NN intervals in milliseconds.

- time_s:

  Optional time vector in seconds.

- method:

  Frequency method: welch, lomb, or ar.

## Value

List with PSD and measures.
