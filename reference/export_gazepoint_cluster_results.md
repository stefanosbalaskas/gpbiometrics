# Export cluster-permutation result components

Writes the cluster summary, timewise statistics, null distribution,
parameter table, and conservative reporting text to disk.

## Usage

``` r
export_gazepoint_cluster_results(
  result,
  path = ".",
  prefix = "gazepoint_cluster",
  overwrite = FALSE
)
```

## Arguments

- result:

  Object returned by
  [`run_gazepoint_cluster_permutation()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_cluster_permutation.md).

- path:

  Output directory.

- prefix:

  File-name prefix.

- overwrite:

  Should existing files be overwritten?

## Value

A data frame listing written files, invisibly.
