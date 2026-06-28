# Summarize SCR recovery around events

Computes event-level baseline, peak amplitude, peak latency, recovery
latency, and post-peak recovery slope from EDA/GSR data.

## Usage

``` r
summarize_gazepoint_scr_recovery(
  data,
  events,
  pre = 1,
  post = 6,
  time_col = NULL,
  signal_col = NULL,
  event_time_col = NULL,
  event_id_col = NULL,
  baseline_window = NULL,
  peak_window = c(0.5, 4),
  recovery_fraction = 0.5
)
```

## Arguments

- data:

  EDA/GSR data frame.

- events:

  Event timestamps, event data frame, or event-log path.

- pre:

  Seconds before event onset.

- post:

  Seconds after event onset.

- time_col:

  Time column in `data`.

- signal_col:

  EDA/GSR signal column.

- event_time_col:

  Event-time column in `events`.

- event_id_col:

  Event identifier column in `events`.

- baseline_window:

  Baseline window relative to event onset.

- peak_window:

  Peak-search window relative to event onset.

- recovery_fraction:

  Fraction of peak amplitude used as recovery target.

## Value

Data frame with one row per event.
