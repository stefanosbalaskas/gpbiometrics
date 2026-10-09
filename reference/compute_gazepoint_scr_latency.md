# Compute SCR latency metrics from event-locked EDA

Estimates onset latency, peak latency, peak amplitude, AUC, and
half-recovery latency for each event using a baseline window and
response window.

## Usage

``` r
compute_gazepoint_scr_latency(
  data,
  events,
  time_col = NULL,
  eda_col = NULL,
  event_time_col = NULL,
  event_id_col = NULL,
  group_cols = NULL,
  baseline_window_s = c(-1, 0),
  response_window_s = c(0, 5),
  onset_threshold = 0.01,
  recovery_fraction = 0.5
)
```

## Arguments

- data:

  Data frame containing EDA/GSR samples.

- events:

  Event table or numeric event times.

- time_col:

  Time column in `data`.

- eda_col:

  EDA/GSR column.

- event_time_col:

  Event-time column.

- event_id_col:

  Event identifier column.

- group_cols:

  Optional grouping columns used to match events to samples.

- baseline_window_s:

  Two-element baseline window relative to event.

- response_window_s:

  Two-element response window relative to event.

- onset_threshold:

  Minimum increase above baseline used for onset.

- recovery_fraction:

  Fraction of peak amplitude used for recovery time.

## Value

Data frame with one row per event.
