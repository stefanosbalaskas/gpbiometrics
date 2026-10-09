# Run Gazepoint SCR threshold sensitivity checks

Re-runs SCR peak detection across combinations of amplitude thresholds
and minimum peak-distance settings. Optionally, it also carries each
peak-detection result through SCR event-window summaries so users can
see how preprocessing choices affect event-level response rates.

## Usage

``` r
run_gazepoint_scr_threshold_sensitivity(
  data,
  phasic_col = NULL,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  amplitude_min_values = c(0.005, 0.01, 0.02, 0.03),
  min_peak_distance_values = c(1, 5, 10, 20, 30),
  recovery_fraction = 0.5,
  smooth_width = 1,
  events = NULL,
  event_time_col = NULL,
  event_id_col = NULL,
  event_label_col = NULL,
  ttl_cols = NULL,
  ttl_valid_col = NULL,
  event_detection = c("rising", "active"),
  analysis_window = c(0, 6),
  response_window = c(1, 4),
  peak_selection = c("largest_amplitude", "first_peak"),
  collapse_simultaneous_events = FALSE,
  include_event_windows = TRUE,
  keep_objects = FALSE
)
```

## Arguments

- data:

  A Gazepoint biometric data frame.

- phasic_col:

  Optional phasic EDA signal column, typically `GSR_US_PHASIC`.

- signal_col:

  Optional conductance-like fallback signal column, typically `GSR_US`.

- time_col:

  Optional time/counter column.

- group_cols:

  Optional grouping columns.

- amplitude_min_values:

  Numeric vector of SCR amplitude thresholds.

- min_peak_distance_values:

  Numeric vector of minimum peak distances.

- recovery_fraction:

  Fraction used by
  [`detect_gazepoint_scr_peaks()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_scr_peaks.md)
  to define recovery.

- smooth_width:

  Optional moving-average width passed to
  [`detect_gazepoint_scr_peaks()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_scr_peaks.md).

- events:

  Optional event table passed to
  [`summarise_gazepoint_scr_event_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_scr_event_windows.md).

- event_time_col:

  Optional event-time column when `events` is supplied.

- event_id_col:

  Optional event identifier column when `events` is supplied.

- event_label_col:

  Optional event label column when `events` is supplied.

- ttl_cols:

  Optional TTL columns for event derivation when `events` is `NULL`.

- ttl_valid_col:

  Optional TTL validity column.

- event_detection:

  Event-detection rule for TTL columns.

- analysis_window:

  Event-relative analysis window.

- response_window:

  Event-relative response window.

- peak_selection:

  Peak-selection rule for event-window summaries.

- collapse_simultaneous_events:

  Logical. Passed to
  [`summarise_gazepoint_scr_event_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_scr_event_windows.md).

- include_event_windows:

  Logical. If `TRUE`, compute event-window summaries for each
  sensitivity setting.

- keep_objects:

  Logical. If `TRUE`, retain peak-detection and event-window objects in
  list columns.

## Value

A list with `overview`, `sensitivity_grid`, `peak_group_summary`,
`event_window_summary`, optional `objects`, and `settings`.
