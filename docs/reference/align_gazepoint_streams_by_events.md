# Align two Gazepoint streams using matched event markers

Estimates offset or linear drift between a reference stream and a target
stream using matched event times, then adds an aligned reference-clock
time column to the target stream.

## Usage

``` r
align_gazepoint_streams_by_events(
  reference,
  target,
  reference_events,
  target_events,
  reference_time_col = NULL,
  target_time_col = NULL,
  reference_event_time_col = NULL,
  target_event_time_col = NULL,
  event_id_col = NULL,
  method = c("linear", "offset"),
  include_streams = TRUE
)
```

## Arguments

- reference:

  Reference data frame.

- target:

  Target data frame to align to the reference clock.

- reference_events:

  Reference event table or numeric event times.

- target_events:

  Target event table or numeric event times.

- reference_time_col:

  Reference stream time column.

- target_time_col:

  Target stream time column.

- reference_event_time_col:

  Optional reference-event time column.

- target_event_time_col:

  Optional target-event time column.

- event_id_col:

  Optional event identifier column used for matching.

- method:

  `"linear"` estimates offset and drift; `"offset"` estimates a fixed
  lag only.

- include_streams:

  If TRUE, include reference and aligned target streams in the returned
  object.

## Value

Object of class `gazepoint_stream_alignment`.
