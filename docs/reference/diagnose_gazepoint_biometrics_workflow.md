# Diagnose a Gazepoint Biometrics workflow

Creates a compact diagnostic readiness summary from a Gazepoint
Biometrics workflow object. The function does not change or remove data.
It returns a one-row decision table with pass/review/fail status and
concise reasons.

## Usage

``` r
diagnose_gazepoint_biometrics_workflow(
  workflow,
  require_gsr = TRUE,
  require_hr = TRUE,
  require_dial = FALSE,
  max_exclude_window_pct = 25,
  max_review_window_pct = 25
)
```

## Arguments

- workflow:

  A workflow object produced by
  [`run_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_biometrics_workflow.md).

- require_gsr:

  Should GSR/EDA be required for a pass status?

- require_hr:

  Should heart rate be required for a pass status?

- require_dial:

  Should engagement dial be required for a pass status?

- max_exclude_window_pct:

  Maximum acceptable percentage of excluded windows before the workflow
  is marked as fail.

- max_review_window_pct:

  Maximum acceptable percentage of review windows before the workflow is
  marked as review.

## Value

A one-row data frame with diagnostic status and reasons.
