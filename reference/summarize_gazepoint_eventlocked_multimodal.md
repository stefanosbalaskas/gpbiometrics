# Summarize event-locked multimodal Gazepoint data

Creates event-locked sample windows and trial-level summary metrics for
one or more numeric Gazepoint modalities such as EDA, PPG, HR, IBI,
pupil, gaze, or derived signals.

## Usage

``` r
summarize_gazepoint_eventlocked_multimodal(
  data,
  events,
  time_col = NULL,
  event_time_col = NULL,
  event_id_col = NULL,
  group_cols = NULL,
  signal_cols = NULL,
  pre_s = 1,
  post_s = 3,
  baseline_window_s = c(-1, 0),
  summary_window_s = c(0, 3)
)
```

## Arguments

- data:

  Data frame or named list of data frames.

- events:

  Event table or numeric event times.

- time_col:

  Optional time column for data-frame input.

- event_time_col:

  Optional event-time column.

- event_id_col:

  Optional event identifier column.

- group_cols:

  Optional grouping columns used to match events to samples.

- signal_cols:

  Optional character vector, or named list for list input.

- pre_s:

  Seconds before each event.

- post_s:

  Seconds after each event.

- baseline_window_s:

  Two-element baseline window relative to event.

- summary_window_s:

  Two-element summary window relative to event.

## Value

Object of class `gazepoint_eventlocked_multimodal`.
