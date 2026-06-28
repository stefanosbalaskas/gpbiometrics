# Summarise Gazepoint SCR responses in event windows

Creates one row per event or TTL marker and links detected SCR peaks to
event-relative analysis and response windows. The helper is intended to
produce transparent event-level EDA/SCR features for downstream mixed
models, hurdle models, and reporting.

## Usage

``` r
summarise_gazepoint_scr_event_windows(
  data = NULL,
  scr_peaks,
  events = NULL,
  time_col = NULL,
  event_time_col = NULL,
  event_id_col = NULL,
  event_label_col = NULL,
  group_cols = NULL,
  ttl_cols = NULL,
  ttl_valid_col = NULL,
  event_detection = c("rising", "active"),
  analysis_window = c(0, 6),
  response_window = c(1, 4),
  amplitude_col = "amplitude",
  peak_time_col = "peak_time",
  onset_time_col = "onset_time",
  rise_time_col = "rise_time",
  recovery_time_col = "recovery_time_after_peak",
  peak_status_col = "status",
  peak_selection = c("largest_amplitude", "first_peak"),
  collapse_simultaneous_events = FALSE
)
```

## Arguments

- data:

  Optional Gazepoint biometric data frame. Required when `events` is
  `NULL` and events should be derived from TTL columns.

- scr_peaks:

  A `gazepoint_scr_peak_detection` object returned by
  [`detect_gazepoint_scr_peaks()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_scr_peaks.md),
  or a data frame of detected peaks.

- events:

  Optional event data frame. If `NULL`, events are derived from TTL
  columns in `data`.

- time_col:

  Optional time/counter column in `data`. Used for TTL-derived events.

- event_time_col:

  Optional event-time column in `events`. If `NULL`, common event-time
  column names are detected.

- event_id_col:

  Optional event identifier column in `events`.

- event_label_col:

  Optional event label/condition column in `events`.

- group_cols:

  Optional grouping columns used to match events and peaks.

- ttl_cols:

  Optional TTL marker columns used when `events = NULL`.

- ttl_valid_col:

  Optional TTL validity column. If supplied, TTL-derived events require
  this column to be non-zero.

- event_detection:

  Event-detection rule for TTL columns. `"rising"` detects rising edges;
  `"active"` treats every active TTL row as an event.

- analysis_window:

  Numeric length-two vector giving the event-relative analysis window in
  the same units as `time_col` or `event_time_col`.

- response_window:

  Numeric length-two vector giving the event-relative response window
  used for the binary SCR response flag.

- amplitude_col:

  Column in the peak table containing SCR amplitude.

- peak_time_col:

  Column in the peak table containing peak time.

- onset_time_col:

  Column in the peak table containing onset time.

- rise_time_col:

  Column in the peak table containing SCR rise time.

- recovery_time_col:

  Column in the peak table containing recovery time after peak.

- peak_status_col:

  Column in the peak table containing peak status.

- peak_selection:

  How to choose one peak when several peaks fall in the response window.
  `"largest_amplitude"` selects the largest response; `"first_peak"`
  selects the earliest peak.

- collapse_simultaneous_events:

  Logical. If `TRUE`, events with the same group and event time are
  collapsed into one row before matching peaks. This is useful when
  Gazepoint TTL0–TTL6 channels mark the same event simultaneously.

## Value

A list with `overview`, `event_table`, `window_qc`, `events`, `peaks`,
and `settings`.
