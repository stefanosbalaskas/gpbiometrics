# Summarize Gazepoint time clusters

Returns a compact cluster-level summary table from a
`gazepoint_cluster_permutation` object.

## Usage

``` r
summarize_gazepoint_time_clusters(x, alpha = NULL)
```

## Arguments

- x:

  Object returned by
  [`run_gazepoint_cluster_permutation()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_cluster_permutation.md).

- alpha:

  Optional cluster-level alpha. If `NULL`, the alpha stored in the
  object is used.

## Value

A data frame.
