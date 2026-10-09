# Plot the cluster-permutation null distribution

Plots the permutation null distribution of maximum cluster masses and,
when available, overlays the observed cluster mass for one observed
cluster.

## Usage

``` r
plot_gazepoint_cluster_null_distribution(
  result,
  cluster_id = 1L,
  observed_mass = NULL,
  bins = 30L
)
```

## Arguments

- result:

  Object returned by
  [`run_gazepoint_cluster_permutation()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_cluster_permutation.md).

- cluster_id:

  Observed cluster to overlay.

- observed_mass:

  Optional observed cluster mass. If `NULL`, the function attempts to
  extract the mass from `result`.

- bins:

  Number of histogram bins.

## Value

A `ggplot` object.
