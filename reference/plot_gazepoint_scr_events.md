# Plot Gazepoint SCR events on an EDA signal

Plots an EDA/GSR signal with detected SCR peak markers and optional
event onsets from SCR event-window summaries or event tables.

## Usage

``` r
plot_gazepoint_scr_events(
  data,
  scr_peaks,
  event_windows = NULL,
  events = NULL,
  time_col = NULL,
  signal_col = NULL,
  phasic_col = NULL,
  group_cols = NULL,
  show_events = TRUE,
  max_points = 5000,
  title = NULL
)
```

## Arguments

- data:

  Gazepoint biometric data frame.

- scr_peaks:

  A `gazepoint_scr_peak_detection` object or peak data frame.

- event_windows:

  Optional `gazepoint_scr_event_window_summary` object or event-window
  data frame.

- events:

  Optional event table used when `event_windows` is not supplied.

- time_col:

  Optional time/counter column.

- signal_col:

  Optional signal column to plot.

- phasic_col:

  Optional preferred phasic signal column.

- group_cols:

  Optional grouping columns used for facets and matching.

- show_events:

  Logical. If `TRUE`, show event onsets when available.

- max_points:

  Maximum number of signal rows retained after downsampling.

- title:

  Optional plot title.

## Value

A ggplot object with plot data stored in attributes.
