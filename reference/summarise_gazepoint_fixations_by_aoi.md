# Summarise Gazepoint fixations by area of interest

Produces participant-, trial-, and AOI-level fixation counts, duration
summaries, dwell proportions, and optional first-fixation latency.

## Usage

``` r
summarise_gazepoint_fixations_by_aoi(
  fixations,
  aoi_col = NULL,
  participant_col = NULL,
  trial_col = NULL,
  group_cols = NULL,
  start_col = NULL,
  end_col = NULL,
  duration_col = NULL,
  event_onset_col = NULL,
  time_unit = c("auto", "seconds", "milliseconds", "samples"),
  duration_unit = c("auto", "seconds", "milliseconds", "samples"),
  sampling_rate_hz = NULL,
  include_unassigned = FALSE,
  unassigned_label = "UNASSIGNED"
)
```

## Arguments

- fixations:

  Fixation-level data frame.

- aoi_col:

  AOI label column.

- participant_col:

  Optional participant column.

- trial_col:

  Optional trial column.

- group_cols:

  Additional grouping columns.

- start_col:

  Fixation-start column.

- end_col:

  Optional fixation-end column.

- duration_col:

  Optional fixation-duration column.

- event_onset_col:

  Optional event/stimulus onset column.

- time_unit:

  Unit for start, end, and event-onset values.

- duration_unit:

  Unit for duration values.

- sampling_rate_hz:

  Sampling frequency required when time or duration values are
  represented as sample indices.

- include_unassigned:

  Include rows with missing or empty AOI labels.

- unassigned_label:

  Label used for retained unassigned rows.

## Value

A data frame of class `"gazepoint_fixation_aoi_summary"`.
