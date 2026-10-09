# Prepare Gazepoint events for MNE-Python

Creates an integer MNE-style event matrix with columns representing
sample number, previous value, and event code. Input may be an event
table, numeric event-time vector, or continuous table containing marker
columns.

## Usage

``` r
prepare_gazepoint_mne_events(
  events,
  event_time_col = NULL,
  event_label_col = NULL,
  event_code_col = NULL,
  marker_cols = NULL,
  participant_col = NULL,
  trial_col = NULL,
  time_unit = c("auto", "seconds", "milliseconds", "samples"),
  sampling_rate_hz,
  recording_start_s = 0,
  first_samp = 0L,
  event_id = NULL,
  previous_value = 0L,
  marker_onset = c("change", "nonzero"),
  duplicate = c("error", "allow"),
  export_csv = NULL
)
```

## Arguments

- events:

  Numeric event-time vector or data frame.

- event_time_col:

  Event-time column for event-table input.

- event_label_col:

  Optional event-label column.

- event_code_col:

  Optional positive integer event-code column.

- marker_cols:

  Optional marker or TTL columns in continuous input.

- participant_col:

  Optional participant column retained in the audit.

- trial_col:

  Optional trial column retained in the audit.

- time_unit:

  Time unit: `"auto"`, `"seconds"`, `"milliseconds"`, or `"samples"`.

- sampling_rate_hz:

  Positive sampling frequency used to convert event times to MNE sample
  numbers.

- recording_start_s:

  Recording start in seconds in the same clock domain as the converted
  event times.

- first_samp:

  Integer MNE first-sample offset.

- event_id:

  Optional named integer event dictionary or data frame with
  `event_label` and `event_code`.

- previous_value:

  Integer previous-event value placed in the second event-matrix column.

- marker_onset:

  Whether marker input creates events only on value changes or for every
  non-zero row.

- duplicate:

  Handling of repeated event sample numbers.

- export_csv:

  Optional path for a headerless three-column event file.

## Value

A `"gazepoint_mne_events"` object containing the event matrix, event
table, event dictionary, audit, and settings.
