# Fit PsPM-style event-related convolution GLM

Fit PsPM-style event-related convolution GLM

## Usage

``` r
fit_gazepoint_convolution_glm(
  data,
  design,
  signal_col,
  time_col = NULL,
  design_time_col = "time_s",
  regressor_cols = NULL
)
```

## Arguments

- data:

  Gazepoint signal data.

- design:

  Design matrix from create_gazepoint_pspm_glm_design().

- signal_col:

  Signal column.

- time_col:

  Time column in data.

- design_time_col:

  Time column in design.

- regressor_cols:

  Optional regressor columns. If NULL, inferred.

## Value

List with coefficients, fitted values, residuals, and model summary.
