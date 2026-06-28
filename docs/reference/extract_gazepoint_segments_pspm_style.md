# Extract event-centred Gazepoint segments PsPM-style

Extract event-centred Gazepoint segments PsPM-style

## Usage

``` r
extract_gazepoint_segments_pspm_style(
  data,
  events,
  signal_col,
  time_col = NULL,
  event_time_col = "onset_time_s",
  event_id_col = NULL,
  condition_col = NULL,
  pre_s = 1,
  post_s = 5,
  baseline_window = c(-1, 0),
  baseline_correct = TRUE
)
```

## Arguments

- data:

  Gazepoint signal data.

- events:

  Event table.

- signal_col:

  Signal column.

- time_col:

  Signal time column.

- event_time_col:

  Event onset-time column.

- event_id_col:

  Optional event-id column.

- condition_col:

  Optional condition column.

- pre_s:

  Seconds before event.

- post_s:

  Seconds after event.

- baseline_window:

  Baseline window relative to event.

- baseline_correct:

  If TRUE, subtract event baseline.

## Value

Long-format segment table.
