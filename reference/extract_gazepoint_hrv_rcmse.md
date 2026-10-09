# Extract refined composite multiscale entropy from HRV intervals

Computes refined composite multiscale entropy (RCMSE) from IBI/RR
intervals. RCMSE pools template-match counts across all coarse-grained
offsets at each scale, making it more stable than ordinary MSE for
shorter physiological time series.

## Usage

``` r
extract_gazepoint_hrv_rcmse(
  dat,
  ibi_col = "IBI",
  group_cols = NULL,
  scales = 1:10,
  m = 2,
  r_multiplier = 0.2,
  min_intervals = 20
)
```

## Arguments

- dat:

  A data frame containing IBI/RR intervals.

- ibi_col:

  Numeric IBI/RR interval column.

- group_cols:

  Optional grouping columns.

- scales:

  Positive integer scales.

- m:

  Embedding dimension.

- r_multiplier:

  Tolerance multiplier applied to SD.

- min_intervals:

  Minimum intervals per group.

## Value

A list with `overview`, `rcmse_by_scale`, `summary`, and `settings`.
