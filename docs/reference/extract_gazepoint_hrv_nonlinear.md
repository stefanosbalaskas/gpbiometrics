# Extract nonlinear HRV features from IBI/RR intervals

Computes dependency-light nonlinear HRV descriptors from IBI/RR
intervals, including Poincare SD1/SD2, sample entropy, approximate
entropy, multiscale entropy, and detrended fluctuation analysis.

## Usage

``` r
extract_gazepoint_hrv_nonlinear(
  dat,
  ibi_col = "IBI",
  group_cols = NULL,
  min_intervals = 10,
  sampen_m = 2,
  sampen_r_multiplier = 0.2,
  mse_scales = 1:5
)
```

## Arguments

- dat:

  A data frame containing IBI/RR intervals.

- ibi_col:

  IBI/RR interval column.

- group_cols:

  Optional grouping columns.

- min_intervals:

  Minimum finite intervals per group.

- sampen_m:

  Embedding dimension for sample entropy.

- sampen_r_multiplier:

  Tolerance multiplier applied to the within-group SD.

- mse_scales:

  Integer scales used for multiscale entropy.

## Value

A list with `overview`, `features`, and `settings`.

## Details

These are variability and complexity descriptors. They should not be
interpreted as direct emotion, cognitive-load, health-status, or
diagnostic labels by themselves.
