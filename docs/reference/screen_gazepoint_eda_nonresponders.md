# Screen Gazepoint EDA/SCR nonresponders

Screens groups, usually participants, for low or absent SCR responding
using either SCR event-window summaries or SCR peak-detection outputs.
The helper reports candidate nonresponders under explicit,
user-controlled criteria.

## Usage

``` r
screen_gazepoint_eda_nonresponders(
  x,
  group_cols = NULL,
  response_col = "response_flag",
  amplitude_col = "scr_amplitude",
  min_events = 1,
  min_response_events = 1,
  min_response_rate = 0.05,
  min_detected_peaks = 1
)
```

## Arguments

- x:

  A `gazepoint_scr_event_window_summary`,
  `gazepoint_scr_peak_detection`, or data frame.

- group_cols:

  Optional grouping columns, usually participant columns.

- response_col:

  Binary response column for event-window data.

- amplitude_col:

  SCR amplitude column.

- min_events:

  Minimum number of events required before event-window nonresponder
  classification is made.

- min_response_events:

  Minimum number of response events required.

- min_response_rate:

  Minimum response rate required.

- min_detected_peaks:

  Minimum detected peaks required when only peak data are available.

## Value

A list with `overview`, `group_summary`, `candidate_nonresponders`, and
`settings`.
