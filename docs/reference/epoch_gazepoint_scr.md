# Epoch Gazepoint SCR/EDA data around events

Segments an EDA/GSR signal around event timestamps and returns
event-level SCR metrics, including SCR count, maximum amplitude, mean
amplitude, AUC, and baseline-corrected epoch summaries.

## Usage

``` r
epoch_gazepoint_scr(
  data,
  events,
  pre,
  post,
  time_col = NULL,
  signal_col = NULL,
  event_time_col = NULL,
  event_id_col = NULL,
  event_group_cols = NULL,
  baseline_window = NULL,
  response_window = NULL,
  min_amplitude = 0.01,
  min_distance_s = 1
)
```

## Arguments

- data:

  Data frame containing time and EDA/GSR columns.

- events:

  Numeric vector of event timestamps or a data frame with an event-time
  column.

- pre:

  Seconds before each event to include.

- post:

  Seconds after each event to include.

- time_col:

  Time column in `data`. If NULL, common names are detected.

- signal_col:

  EDA/GSR signal column. If NULL, common names are detected.

- event_time_col:

  Event-time column when `events` is a data frame.

- event_id_col:

  Optional event identifier column.

- event_group_cols:

  Optional event metadata columns to carry into the output.

- baseline_window:

  Baseline window relative to event time. Defaults to `c(-pre, 0)`.

- response_window:

  SCR response window relative to event time. Defaults to `c(0, post)`.

- min_amplitude:

  Minimum peak-minus-trough amplitude counted as SCR.

- min_distance_s:

  Minimum time between counted SCR peaks.

## Value

Data frame with one row per event and event-level SCR metrics.

## Examples

``` r
eda <- data.frame(time_s = seq(0, 10, by = .1), GSR = sin(seq(0, 10, by = .1)) / 20)
epoch_gazepoint_scr(eda, events = 5, pre = 1, post = 3)
#>   event_id event_time n_samples baseline_mean epoch_mean response_mean
#> 1        1          5        41   -0.04646868 0.04041877    0.05340942
#>   response_auc scr_count scr_max_amplitude scr_mean_amplitude
#> 1    0.1608463         1        0.09789328         0.09789328
#>   scr_total_amplitude first_scr_latency_s
#> 1          0.09789328                 2.9
```
