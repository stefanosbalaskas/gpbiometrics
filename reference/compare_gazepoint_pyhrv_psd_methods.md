# Compare pyHRV-style PSD methods

Compare pyHRV-style PSD methods

## Usage

``` r
compare_gazepoint_pyhrv_psd_methods(
  nni_ms,
  time_s = NULL,
  methods = c("welch", "lomb", "ar"),
  plot = FALSE
)
```

## Arguments

- nni_ms:

  Numeric NN intervals in milliseconds.

- time_s:

  Optional time vector in seconds.

- methods:

  Methods to compare.

- plot:

  If TRUE, draw a comparison plot.

## Value

List with method outputs and combined measures.
