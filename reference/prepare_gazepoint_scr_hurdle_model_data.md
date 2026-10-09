# Prepare Gazepoint SCR hurdle-model data

Converts SCR event-window summaries into model-ready data for two-part
electrodermal-response analyses: a binary response/no-response component
and a positive-amplitude component among response events.

## Usage

``` r
prepare_gazepoint_scr_hurdle_model_data(
  scr_event_windows,
  response_col = "response_flag",
  amplitude_col = "scr_amplitude",
  latency_col = "scr_latency",
  rise_time_col = "scr_rise_time",
  recovery_time_col = "scr_recovery_time",
  predictor_cols = NULL,
  factor_cols = NULL,
  numeric_cols = NULL,
  group_cols = NULL,
  event_id_col = "event_id",
  amplitude_transform = c("none", "log", "log1p"),
  amplitude_offset = 1e-06,
  drop_missing_predictors = TRUE
)
```

## Arguments

- scr_event_windows:

  A `gazepoint_scr_event_window_summary` object returned by
  [`summarise_gazepoint_scr_event_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_scr_event_windows.md),
  or a data frame containing event-window SCR summaries.

- response_col:

  Column containing the binary SCR response flag.

- amplitude_col:

  Column containing SCR amplitude.

- latency_col:

  Optional column containing SCR latency.

- rise_time_col:

  Optional column containing SCR rise time.

- recovery_time_col:

  Optional column containing SCR recovery time.

- predictor_cols:

  Optional fixed-effect predictor columns to include in generated
  formulas and complete-case checks.

- factor_cols:

  Optional columns to coerce to factors.

- numeric_cols:

  Optional columns to coerce to numeric.

- group_cols:

  Optional grouping columns retained for random effects or clustered
  summaries.

- event_id_col:

  Optional event identifier column.

- amplitude_transform:

  Transformation for the positive-amplitude outcome: `"none"`, `"log"`,
  or `"log1p"`.

- amplitude_offset:

  Small positive offset used when `amplitude_transform = "log"`.

- drop_missing_predictors:

  Logical. If `TRUE`, model datasets are restricted to rows complete on
  outcome and predictor columns.

## Value

A list with `overview`, `response_model_data`, `amplitude_model_data`,
`variable_summary`, `model_formulas`, and `settings`.
