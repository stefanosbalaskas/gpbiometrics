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

summarise_gazepoint_decision_log(log)
#> Gazepoint analysis decision log summary
#> ---------------------------------------
#>    study_id analyst description               created_at package_version
#>  demo_study analyst        <NA> 2026-07-18 14:05:09 EEST           2.0.0
#>  n_decisions
#>            1
#>
#> By stage
#>          stage n
#>  preprocessing 1
#>
#> By object type
#>  object_type n
#>       signal 1
#>
#> By decision
#>            decision n
#>  baseline_corrected 1
```
