# Align Gazepoint timestamps to an EEG clock

Estimates a constant offset or linear offset-plus-drift mapping from
matched Gazepoint and EEG events, then applies that mapping to a
Gazepoint stream.

## Usage

``` r
align_gazepoint_to_eeg(
  gazepoint,
  gazepoint_events,
  eeg_events,
  gazepoint_time_col = NULL,
  gazepoint_event_time_col = NULL,
  eeg_event_time_col = NULL,
  eeg_event_sample_col = NULL,
  gazepoint_event_id_col = NULL,
  eeg_event_id_col = NULL,
  gazepoint_time_unit = c("auto", "seconds", "milliseconds", "samples"),
  eeg_time_unit = c("auto", "seconds", "milliseconds", "samples"),
  eeg_sampling_rate_hz = NULL,
  method = c("offset", "linear"),
  match_by = c("auto", "id", "row"),
  robust = TRUE,
  maximum_residual_s = NULL,
  residual_action = c("error", "allow"),
  output_col = "time_eeg_s"
)
```

## Arguments

- gazepoint:

  Gazepoint sample-level data.

- gazepoint_events:

  Gazepoint event table or numeric times.

- eeg_events:

  EEG event table or numeric times.

- gazepoint_time_col:

  Gazepoint stream time column.

- gazepoint_event_time_col:

  Gazepoint event-time column.

- eeg_event_time_col:

  EEG event-time column.

- eeg_event_sample_col:

  Optional EEG event-sample column.

- gazepoint_event_id_col:

  Optional Gazepoint event identifier.

- eeg_event_id_col:

  Optional EEG event identifier.

- gazepoint_time_unit:

  Gazepoint time unit.

- eeg_time_unit:

  EEG event-time unit.

- eeg_sampling_rate_hz:

  Required when EEG events are sample numbers.

- method:

  `"offset"` or `"linear"`.

- match_by:

  Match events by identifier or row order.

- robust:

  Use one MAD-based residual refit for linear alignment.

- maximum_residual_s:

  Optional maximum permitted absolute residual.

- residual_action:

  Handling when the residual threshold is exceeded.

- output_col:

  Added aligned-time column.

## Value

A `"gazepoint_eeg_alignment"` object.
