# Regress stimulus luminance from pupil diameter

Regresses continuous pupil diameter on frame-wise or sample-wise
stimulus luminance and returns a luminance-adjusted pupil series. This
controls a major visual confound but does not prove that residual pupil
changes are cognitive-load-only effects.

## Usage

``` r
regress_gazepoint_pupil_luminance(
  dat,
  pupil_col,
  luminance_col,
  group_cols = NULL,
  time_col = NULL,
  output_col = "pupil_luminance_adjusted",
  fitted_col = "pupil_luminance_fitted",
  include_quadratic = TRUE,
  model_by_group = TRUE,
  add_intercept_mean = TRUE
)
```

## Arguments

- dat:

  A data frame.

- pupil_col:

  Numeric pupil column.

- luminance_col:

  Numeric luminance/brightness column.

- group_cols:

  Optional grouping columns.

- time_col:

  Optional time column.

- output_col:

  Output luminance-adjusted pupil column.

- fitted_col:

  Output fitted luminance component column.

- include_quadratic:

  Logical. If `TRUE`, include luminance squared.

- model_by_group:

  Logical. If `TRUE`, fit models per group.

- add_intercept_mean:

  Logical. If `TRUE`, add mean pupil size back to residuals.

## Value

A data frame with luminance-adjusted pupil columns and attributes.
