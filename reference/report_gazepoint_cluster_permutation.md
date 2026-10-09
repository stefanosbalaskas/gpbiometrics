# Create conservative reporting text for a cluster-permutation result

Generates cautious manuscript-ready wording for a cluster-permutation
result. The wording avoids precise onset or offset claims and frames
cluster timing as descriptive.

## Usage

``` r
report_gazepoint_cluster_permutation(
  result,
  cluster_alpha = 0.05,
  digits = 3L,
  include_assumptions = TRUE
)
```

## Arguments

- result:

  Object returned by
  [`run_gazepoint_cluster_permutation()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_cluster_permutation.md).

- cluster_alpha:

  Cluster-level alpha used to classify clusters.

- digits:

  Number of digits used for p-values.

- include_assumptions:

  Should an assumptions note be included?

## Value

An object of class `gazepoint_cluster_report`.
