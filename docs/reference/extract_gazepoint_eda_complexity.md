# Extract EDA complexity features

Computes dependency-light EDA complexity descriptors, including sample
entropy and detrended fluctuation analysis alpha.

## Usage

``` r
extract_gazepoint_eda_complexity(
  dat,
  eda_col = "GSR_US",
  group_cols = NULL,
  min_samples = 32,
  sampen_m = 2,
  sampen_r_multiplier = 0.2
)
```

## Arguments

- dat:

  A data frame containing EDA data.

- eda_col:

  EDA/conductance column.

- group_cols:

  Optional grouping columns.

- min_samples:

  Minimum finite samples per group.

- sampen_m:

  Embedding dimension for sample entropy.

- sampen_r_multiplier:

  Tolerance multiplier applied to within-group SD.

## Value

A list with `overview`, `features`, and `settings`.
