# Audit Gazepoint experiment design structure

Check whether an imported or prepared Gazepoint workflow table contains
the expected participant, trial, condition, and optional session
structure before modelling, event-locking, or time-course analysis.

## Usage

``` r
audit_gazepoint_experiment_design(
  data,
  participant_col,
  trial_col = NULL,
  condition_col = NULL,
  session_col = NULL,
  expected_conditions = NULL,
  min_trials_per_condition = 1L
)
```

## Arguments

- data:

  A data frame containing trial-, event-, or sample-level records.

- participant_col:

  Name of the participant identifier column.

- trial_col:

  Optional name of the trial identifier column.

- condition_col:

  Optional name of the condition column.

- session_col:

  Optional name of the session/block column.

- expected_conditions:

  Optional character vector of expected conditions.

- min_trials_per_condition:

  Minimum acceptable number of trials per participant-condition cell
  when `trial_col` and `condition_col` are supplied.

## Value

A list with class `"gazepoint_experiment_design_audit"`.

## Examples

``` r
dat <- data.frame(
  participant = rep(paste0("P", 1:4), each = 4),
  trial = rep(1:4, times = 4),
  condition = rep(c("A", "B"), times = 8)
)

audit_gazepoint_experiment_design(
  dat,
  participant_col = "participant",
  trial_col = "trial",
  condition_col = "condition",
  expected_conditions = c("A", "B")
)
#> Gazepoint experiment design audit
#> ---------------------------------
#>  n_rows n_participants n_trials n_unique_participant_trials n_conditions
#>      16              4        4                          16            2
#>  n_sessions has_trial_column has_condition_column has_session_column
#>          NA             TRUE                 TRUE              FALSE
#>
#> No design warnings detected.
```
