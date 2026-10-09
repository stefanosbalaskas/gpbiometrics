# Plot multimodal Gazepoint biometric timelines

Creates a conservative timeline plot for one or more biometric channels.
The plot is intended for inspection, synchronization checks, and
reporting support. It does not interpret electrodermal activity as
emotional valence.

## Usage

``` r
plot_gazepoint_multimodal_timeline(
  data,
  time_col = NULL,
  signal_cols = NULL,
  group_cols = NULL,
  participant_col = NULL,
  stimulus_col = NULL,
  trial_col = NULL,
  event_time_col = NULL,
  event_col = NULL,
  standardise = TRUE,
  show_event_markers = TRUE,
  title = NULL
)
```

## Arguments

- data:

  A data frame containing biometric samples or aligned biometric rows.

- time_col:

  Optional time column. If `NULL`, common time columns are detected
  automatically.

- signal_cols:

  Optional biometric signal columns. If `NULL`, common Gazepoint
  biometric columns are detected automatically.

- group_cols:

  Optional grouping columns used to separate trajectories.

- participant_col, stimulus_col, trial_col:

  Optional common grouping columns to add to `group_cols`.

- event_time_col:

  Optional column containing event times for vertical markers.

- event_col:

  Optional event/TTL indicator column used for vertical markers.

- standardise:

  Logical. If `TRUE`, signals are z-scored within channel for visual
  comparison.

- show_event_markers:

  Logical. Should event markers be drawn when available?

- title:

  Optional plot title.

## Value

A ggplot object with the long plotting data stored in the `plot_data`
attribute and settings stored in the `settings` attribute.
