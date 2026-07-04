# Audit Gazepoint event coverage

Check whether expected events, TTL markers, AOI events, or task events
are present across participant/trial/condition units.

## Usage

``` r
audit_gazepoint_event_coverage(
  data,
  event_col,
  participant_col = NULL,
  trial_col = NULL,
  condition_col = NULL,
  expected_events = NULL,
  unit_cols = NULL
)
```

## Arguments

- data:

  A data frame containing event-, trial-, or sample-level records.

- event_col:

  Name of the event/marker column.

- participant_col:

  Optional participant identifier column.

- trial_col:

  Optional trial identifier column.

- condition_col:

  Optional condition column.

- expected_events:

  Optional character vector of expected event labels.

- unit_cols:

  Optional character vector of columns defining event-coverage units. If
  supplied, this overrides `participant_col`, `trial_col`, and
  `condition_col` for unit construction.

## Value

A list with class `"gazepoint_event_coverage_audit"`.
