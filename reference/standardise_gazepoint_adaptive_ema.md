# Adaptive EMA normalization for non-stationary EDA

Applies dependency-light adaptive normalization using an exponential
moving average center and robust local scale after IQR-based outlier
screening. This preserves local dynamics more than whole-session
z-scoring, but it is still a preprocessing transformation and not an
emotion/stress classifier.

## Usage

``` r
standardise_gazepoint_adaptive_ema(
  dat,
  signal_col = "GSR_US",
  group_cols = NULL,
  time_col = NULL,
  alpha = 0.05,
  iqr_multiplier = 1.5,
  suffix = "_adaptive_ema",
  center_suffix = "_ema_center",
  scale_suffix = "_ema_scale",
  min_scale = 1e-08,
  overwrite = FALSE
)

standardize_gazepoint_adaptive_ema(
  dat,
  signal_col = "GSR_US",
  group_cols = NULL,
  time_col = NULL,
  alpha = 0.05,
  iqr_multiplier = 1.5,
  suffix = "_adaptive_ema",
  center_suffix = "_ema_center",
  scale_suffix = "_ema_scale",
  min_scale = 1e-08,
  overwrite = FALSE
)
```

## Arguments

- dat:

  A data frame.

- signal_col:

  Numeric signal column.

- group_cols:

  Optional grouping columns.

- time_col:

  Optional time column used to order rows within group.

- alpha:

  EMA smoothing parameter in `(0, 1]`.

- iqr_multiplier:

  IQR multiplier for outlier screening.

- suffix:

  Suffix for the normalized output column.

- center_suffix:

  Suffix for the EMA center column.

- scale_suffix:

  Suffix for the EMA scale column.

- min_scale:

  Minimum scale used to avoid division by zero.

- overwrite:

  Logical. If `FALSE`, existing output columns are protected.

## Value

A data frame with adaptive normalized signal columns and attributes.
