# Correct EDA for ambient or body temperature

Regresses an EDA/conductance signal on one or more continuous
temperature covariates and returns a temperature-adjusted residual
series. The adjusted signal is temperature-adjusted EDA, not "pure"
cognitive or emotional EDA.

## Usage

``` r
correct_gazepoint_eda_temperature(
  dat,
  eda_col = "GSR_US",
  temperature_cols,
  group_cols = NULL,
  time_col = NULL,
  output_col = "eda_temperature_adjusted",
  fitted_col = "eda_temperature_fitted",
  model_by_group = TRUE,
  add_intercept_mean = TRUE
)
```

## Arguments

- dat:

  A data frame.

- eda_col:

  Numeric EDA/conductance column.

- temperature_cols:

  One or more numeric temperature columns.

- group_cols:

  Optional grouping columns.

- time_col:

  Optional time column retained in summaries.

- output_col:

  Output residual-adjusted EDA column.

- fitted_col:

  Output fitted temperature component column.

- model_by_group:

  Logical. If `TRUE`, fit one model per group.

- add_intercept_mean:

  Logical. If `TRUE`, add the group mean EDA back to residuals so the
  adjusted signal remains on the original scale.

## Value

A data frame with adjusted EDA columns and model-summary attributes.
