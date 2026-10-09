# Prepare Gazepoint biometric summaries for mixed-model analysis

Prepares biometric window-level or event-level summaries for downstream
mixed-model analysis. This helper does not fit a model. It checks
variables, optionally baseline-corrects the selected outcome, optionally
scales numeric predictors, converts grouping/factor variables, flags
complete cases, and returns a conservative model formula.

## Usage

``` r
prepare_gazepoint_biometrics_lme_data(
  data,
  outcome_col,
  fixed_effect_cols = NULL,
  condition_cols = NULL,
  covariate_cols = NULL,
  random_effect_cols = NULL,
  participant_col = NULL,
  stimulus_col = NULL,
  trial_col = NULL,
  window_col = NULL,
  baseline_col = NULL,
  baseline_correct = FALSE,
  factor_cols = NULL,
  continuous_cols = NULL,
  scale_continuous = FALSE,
  include_window = TRUE,
  drop_missing = TRUE,
  min_rows = 10
)
```

## Arguments

- data:

  A data frame containing biometric summary rows.

- outcome_col:

  Name of the outcome column to analyse.

- fixed_effect_cols:

  Optional fixed-effect predictor columns.

- condition_cols:

  Optional condition/design columns to include as fixed effects.

- covariate_cols:

  Optional covariate columns to include as fixed effects.

- random_effect_cols:

  Optional grouping columns for random intercepts.

- participant_col, stimulus_col, trial_col:

  Optional common grouping columns.

- window_col:

  Optional analysis-window column. Included as a fixed effect when
  `include_window = TRUE`.

- baseline_col:

  Optional baseline column.

- baseline_correct:

  Logical. If `TRUE`, creates an outcome column equal to
  `outcome_col - baseline_col`.

- factor_cols:

  Optional columns to convert to factors.

- continuous_cols:

  Optional numeric predictor columns to scale when
  `scale_continuous = TRUE`.

- scale_continuous:

  Logical. If `TRUE`, creates z-scored versions of numeric continuous
  predictors and uses those in the formula.

- include_window:

  Logical. Should `window_col` be included as a fixed effect?

- drop_missing:

  Logical. Should incomplete model rows be removed from `model_data`?

- min_rows:

  Minimum number of complete rows required for a `"ready"` status.

## Value

A list with `overview`, `data`, `model_data`, `model_formula`,
`variable_summary`, and `settings`.
