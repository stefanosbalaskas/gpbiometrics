# Plot Gazepoint cluster permutation results

Plots condition-level time courses and highlights clusters that pass the
cluster-level alpha threshold. The shaded regions are descriptive aids
only; they should not be interpreted as precise effect onset or offset
estimates.

## Usage

``` r
plot_gazepoint_cluster_permutation(x, alpha = NULL, show_all_clusters = FALSE)
```

## Arguments

- x:

  Object returned by
  [`run_gazepoint_cluster_permutation()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_cluster_permutation.md).

- alpha:

  Optional cluster-level alpha. If `NULL`, the alpha stored in the
  object is used.

- show_all_clusters:

  Logical. If `FALSE`, only clusters with `p <= alpha` are shaded.

## Value

A `ggplot` object.
