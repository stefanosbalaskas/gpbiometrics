# Compute detrended fluctuation analysis

Compute detrended fluctuation analysis

## Usage

``` r
compute_gazepoint_pyhrv_dfa(
  nni_ms,
  scales = unique(round(exp(seq(log(4), log(64), length.out = 12))))
)
```

## Arguments

- nni_ms:

  Numeric NN intervals in milliseconds.

- scales:

  Window sizes in beats.

## Value

Data frame with DFA alpha estimates.
