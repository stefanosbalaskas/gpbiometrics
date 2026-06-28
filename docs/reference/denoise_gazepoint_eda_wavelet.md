# Denoise EDA using dependency-light Haar wavelet shrinkage

Applies simple Haar wavelet soft-threshold denoising to EDA signals
within optional groups. This is a dependency-light wavelet denoising
helper and should not be described as an exact reproduction of
stationary-wavelet artifact-removal algorithms.

## Usage

``` r
denoise_gazepoint_eda_wavelet(
  dat,
  eda_col = "GSR_US",
  group_cols = NULL,
  output_col = NULL,
  levels = 3,
  threshold_multiplier = 1,
  overwrite = FALSE
)
```

## Arguments

- dat:

  A data frame containing EDA data.

- eda_col:

  EDA/conductance column.

- group_cols:

  Optional grouping columns.

- output_col:

  Optional output column.

- levels:

  Number of Haar decomposition levels.

- threshold_multiplier:

  Multiplier applied to the robust noise estimate.

- overwrite:

  Logical. If `FALSE`, protect existing output columns.

## Value

A data frame with denoised EDA and denoising attributes.
