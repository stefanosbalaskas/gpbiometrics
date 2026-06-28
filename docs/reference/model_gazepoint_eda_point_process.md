# Model EDA events as a dependency-light point process

Creates event-time, inter-event interval, and inverse-Gaussian-style
summary tables for EDA/SCR events. Events can be supplied directly
through an event column or derived from positive EDA-derivative bursts.

## Usage

``` r
model_gazepoint_eda_point_process(
  dat,
  eda_col = "GSR_US",
  time_col = "CNT",
  group_cols = NULL,
  event_time_col = NULL,
  event_indicator_col = NULL,
  derivative_mad_multiplier = 6,
  min_event_distance_s = 1
)
```

## Arguments

- dat:

  A data frame.

- eda_col:

  Numeric EDA column.

- time_col:

  Numeric time column.

- group_cols:

  Optional grouping columns.

- event_time_col:

  Optional column of event onset times.

- event_indicator_col:

  Optional binary event indicator column.

- derivative_mad_multiplier:

  MAD multiplier for derivative-derived events.

- min_event_distance_s:

  Minimum distance between derived events.

## Value

A list with `overview`, `event_table`, `interval_table`,
`process_summary`, and `settings`.

## Details

This function is a compact point-process summary/model-preparation
helper. It does not fit a full latent sympathetic state-space model.
