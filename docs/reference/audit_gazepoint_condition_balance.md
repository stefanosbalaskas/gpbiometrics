# Audit Gazepoint condition balance

Summarise condition balance across participants and trials before
modelling, event-window summaries, or two-condition time-course
workflows.

## Usage

``` r
audit_gazepoint_condition_balance(
  data,
  participant_col,
  condition_col,
  trial_col = NULL,
  expected_conditions = NULL
)
```

## Arguments

- data:

  A data frame containing trial-, event-, or sample-level records.

- participant_col:

  Name of the participant identifier column.

- condition_col:

  Name of the condition column.

- trial_col:

  Optional trial identifier column.

- expected_conditions:

  Optional character vector of expected conditions.

## Value

A list with class `"gazepoint_condition_balance_audit"`.
