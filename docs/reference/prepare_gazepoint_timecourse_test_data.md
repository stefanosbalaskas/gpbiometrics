# Prepare Gazepoint time-course data for cluster permutation testing

Prepares a participant-level, condition-level time-course data set for a
conservative two-condition cluster-based permutation prototype. The
helper aggregates repeated observations to one value per participant,
condition, and time bin, then checks that the resulting data form a
complete within-subject time grid.

## Usage

``` r
prepare_gazepoint_timecourse_test_data(
  data,
  outcome_col,
  time_col,
  condition_col,
  participant_col,
  condition_a = NULL,
  condition_b = NULL,
  time_bin_width = NULL,
  aggregation = c("mean", "median"),
  require_complete = TRUE
)
```

## Arguments

- data:

  A data frame.

- outcome_col:

  Name of the numeric outcome column.

- time_col:

  Name of the numeric time column.

- condition_col:

  Name of the condition column.

- participant_col:

  Name of the participant identifier column.

- condition_a:

  Optional first condition level.

- condition_b:

  Optional second condition level.

- time_bin_width:

  Optional numeric time-bin width. If supplied, time is binned using
  `floor(time / time_bin_width) * time_bin_width`.

- aggregation:

  Aggregation rule for repeated rows within participant, condition, and
  time. Currently `"mean"` or `"median"`.

- require_complete:

  Logical. If `TRUE`, require a complete participant by condition by
  time grid.

## Value

A data frame with columns `participant`, `condition`, `time`, and
`value`, with class `gazepoint_timecourse_test_data`.

## Details

This function is intended for exploratory time-course inference on
already preprocessed Gazepoint-derived signals. It does not perform
blink correction, artefact correction, baseline correction, filtering,
or physiological interpretation.
