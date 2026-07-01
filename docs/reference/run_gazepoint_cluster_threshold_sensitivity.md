# Run threshold-sensitivity checks for cluster-permutation analysis

Re-runs
[`run_gazepoint_cluster_permutation()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_cluster_permutation.md)
across several cluster-forming thresholds and summarizes whether the
broad result is stable.

## Usage

``` r
run_gazepoint_cluster_threshold_sensitivity(
  data,
  dv,
  time,
  condition,
  subject,
  thresholds = c(0.01, 0.025, 0.05, 0.1),
  cluster_alpha = 0.05,
  seed = NULL,
  ...
)
```

## Arguments

- data:

  A data frame.

- dv:

  Numeric outcome column.

- time:

  Time-bin column.

- condition:

  Condition column.

- subject:

  Participant identifier column.

- thresholds:

  Numeric vector of cluster-forming thresholds.

- cluster_alpha:

  Cluster-level alpha used for counting significant clusters in the
  summary.

- seed:

  Optional seed. If provided, each threshold receives a deterministic
  seed offset.

- ...:

  Additional arguments passed to
  [`run_gazepoint_cluster_permutation()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_cluster_permutation.md).

## Value

An object of class `gazepoint_cluster_threshold_sensitivity`.
