# Prepare Gazepoint data for mixed-model analysis

Lightweight mixed-model preparation helper for Gazepoint-derived
trial-level, event-locked, AOI, or physiology summaries. It coerces
identifier and condition columns to factors, optionally drops rows with
missing outcomes, and adds centered or standardized numeric predictors.

## Usage

``` r
prepare_gazepoint_mixed_model_data(
  data,
  outcome_cols = NULL,
  participant_col = NULL,
  trial_col = NULL,
  condition_cols = NULL,
  factor_cols = NULL,
  numeric_cols = NULL,
  center_numeric = TRUE,
  scale_numeric = FALSE,
  drop_missing_outcomes = TRUE,
  ...
)
```

## Arguments

- data:

  Data frame to prepare.

- outcome_cols:

  Outcome columns used for optional missing-row removal.

- participant_col:

  Optional participant identifier column.

- trial_col:

  Optional trial/item identifier column.

- condition_cols:

  Optional condition columns.

- factor_cols:

  Additional columns to coerce to factors.

- numeric_cols:

  Numeric predictors to center or scale. If omitted, all numeric columns
  except outcomes are considered.

- center_numeric:

  If TRUE, add centered numeric columns using suffix `"_c"`.

- scale_numeric:

  If TRUE, add standardized numeric columns using suffix `"_z"`.

- drop_missing_outcomes:

  If TRUE, remove rows with missing/non-finite values in `outcome_cols`.

- ...:

  Reserved for future extensions.

## Value

Data frame of class `gazepoint_mixed_model_data`.
