# Compute correlation between two Gazepoint signals

Compute correlation between two Gazepoint signals

## Usage

``` r
compute_gazepoint_signal_correlation(
  x,
  y,
  method = c("pearson", "spearman", "kendall"),
  lag_max = NULL
)
```

## Arguments

- x:

  First numeric signal.

- y:

  Second numeric signal.

- method:

  Correlation method.

- lag_max:

  Optional maximum lag in samples for cross-correlation.

## Value

Correlation summary.
