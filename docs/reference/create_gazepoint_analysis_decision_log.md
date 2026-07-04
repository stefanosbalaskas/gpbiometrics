# Create a Gazepoint analysis decision log

Create an empty structured log for recording preprocessing choices,
exclusions, missing channels, quality-control decisions, modelling
settings, cluster-permutation settings, and reviewer-facing notes.

## Usage

``` r
create_gazepoint_analysis_decision_log(
  study_id = NA_character_,
  analyst = NA_character_,
  description = NA_character_
)
```

## Arguments

- study_id:

  Optional study identifier.

- analyst:

  Optional analyst name or identifier.

- description:

  Optional free-text description of the analysis workflow.

## Value

A data frame with class `"gazepoint_analysis_decision_log"`.

## Examples

``` r
log <- create_gazepoint_analysis_decision_log(
  study_id = "demo_study",
  analyst = "analyst"
)
#> Error in create_gazepoint_analysis_decision_log(study_id = "demo_study",     analyst = "analyst"): could not find function "create_gazepoint_analysis_decision_log"

log <- add_gazepoint_decision(
  log,
  stage = "preprocessing",
  object_type = "signal",
  object_id = "GSR",
  decision = "baseline_corrected",
  reason = "Pre-event baseline window available",
  function_name = "baseline_correct_gazepoint_gsr",
  parameter = "baseline_window",
  value = "-1000_to_0_ms"
)
#> Error in add_gazepoint_decision(log, stage = "preprocessing", object_type = "signal",     object_id = "GSR", decision = "baseline_corrected", reason = "Pre-event baseline window available",     function_name = "baseline_correct_gazepoint_gsr", parameter = "baseline_window",     value = "-1000_to_0_ms"): could not find function "add_gazepoint_decision"

summarise_gazepoint_decision_log(log)
#> Error in summarise_gazepoint_decision_log(log): could not find function "summarise_gazepoint_decision_log"
```
