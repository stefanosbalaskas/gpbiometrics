# Match events to biometric windows

Aligns event logs to Gazepoint biometric or eye-tracking data and
returns either sample-level event windows or event-level summary
features.

## Usage

``` r
match_gazepoint_events_to_biometrics(
  data,
  events,
  pre = 0,
  post = 5,
  time_col = NULL,
  event_time_col = NULL,
  event_id_col = NULL,
  summary_cols = NULL,
  return = c("windows", "summary")
)
```

## Arguments

- data:

  Biometric or eye-tracking data frame.

- events:

  Event timestamps, event data frame, or event-log path.

- pre:

  Seconds before event onset.

- post:

  Seconds after event onset.

- time_col:

  Time column in `data`.

- event_time_col:

  Event-time column in `events`.

- event_id_col:

  Event identifier column in `events`.

- summary_cols:

  Numeric columns to summarize when `return = "summary"`.

- return:

  `"windows"` or `"summary"`.

## Value

Data frame of sample-level windows or event-level summaries.
