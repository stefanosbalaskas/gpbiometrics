# Add a decision to a Gazepoint analysis decision log

Add one structured record to a decision log created with
[`create_gazepoint_analysis_decision_log()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_analysis_decision_log.md).

## Usage

``` r
add_gazepoint_decision(
  log,
  stage,
  object_type,
  object_id = NA_character_,
  decision,
  reason = NA_character_,
  function_name = NA_character_,
  parameter = NA_character_,
  value = NA_character_,
  reviewer_note = NA_character_,
  timestamp = Sys.time()
)
```

## Arguments

- log:

  A decision log created with
  [`create_gazepoint_analysis_decision_log()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_analysis_decision_log.md).

- stage:

  Workflow stage, for example `"import"`, `"quality_control"`,
  `"preprocessing"`, `"feature_extraction"`, `"modelling"`,
  `"reporting"`, or `"cluster_permutation"`.

- object_type:

  Type of object affected by the decision, for example `"file"`,
  `"participant"`, `"trial"`, `"signal"`, `"channel"`, `"event_window"`,
  `"model"`, or `"cluster_test"`.

- object_id:

  Identifier for the affected object.

- decision:

  Compact decision label.

- reason:

  Reason for the decision.

- function_name:

  Optional function associated with the decision.

- parameter:

  Optional parameter name.

- value:

  Optional parameter value. Non-scalar values are collapsed into a
  compact character string.

- reviewer_note:

  Optional reviewer-facing note.

- timestamp:

  Optional timestamp. Defaults to the current time.

## Value

Updated decision log.
