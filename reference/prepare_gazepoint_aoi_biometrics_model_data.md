# Prepare AOI-biometric model data

Converts AOI-biometric summaries into a modelling-ready table for
GLM/LMM/GLMM workflows.

## Usage

``` r
prepare_gazepoint_aoi_biometrics_model_data(
  x,
  outcome_col = "mean_value",
  predictor_cols = c("aoi_label", "signal"),
  factor_cols = c("aoi_label", "signal"),
  numeric_cols = NULL,
  group_cols = NULL,
  drop_missing_outcome = TRUE,
  min_rows = NULL,
  standardise_outcome = FALSE,
  standardise_within = c("signal", "all")
)
```

## Arguments

- x:

  A `gazepoint_aoi_biometrics_summary` object or summary data frame.

- outcome_col:

  Outcome column to model.

- predictor_cols:

  Optional predictor columns to retain.

- factor_cols:

  Optional columns converted to factors.

- numeric_cols:

  Optional columns converted to numeric.

- group_cols:

  Optional grouping columns for random-effect formulas.

- drop_missing_outcome:

  Logical. If `TRUE`, rows with missing outcomes are removed.

- min_rows:

  Optional minimum contributing rows required.

- standardise_outcome:

  Logical. If `TRUE`, add a z-scored outcome column.

- standardise_within:

  Standardization scope used when `standardise_outcome = TRUE`. Use
  `"signal"` to z-score within each biometric signal or `"all"` to
  z-score across all rows.

## Value

A list with `overview`, `model_data`, `variable_summary`,
`model_formulas`, and `settings`.
