# Summarize event-related pupil responses

Computes event-level baseline-corrected pupil metrics, including peak
dilation, peak latency, mean response, and area under the curve.

## Usage

``` r
summarize_gazepoint_pupil_events(
  data,
  events,
  pre = 1,
  post = 3,
  time_col = NULL,
  pupil_col = NULL,
  event_time_col = NULL,
  event_id_col = NULL,
  baseline_window = NULL,
  response_window = c(0, 3)
)
```

## Arguments

- data:

  Pupil data frame.

- events:

  Event timestamps, event data frame, or event-log path.

- pre:

  Seconds before event onset.

- post:

  Seconds after event onset.

- time_col:

  Time column.

- pupil_col:

  Pupil column.

- event_time_col:

  Event-time column in `events`.

- event_id_col:

  Event identifier column in `events`.

- baseline_window:

  Baseline window relative to event onset.

- response_window:

  Response window relative to event onset.

## Value

Data frame with one row per event.
