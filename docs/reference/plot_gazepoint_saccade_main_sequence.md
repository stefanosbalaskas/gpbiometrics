# Plot Gazepoint saccade main-sequence diagnostics

Plots saccade amplitude against peak velocity. The function expects
saccade-level amplitude and peak-velocity columns. If raw sample-level
data are supplied, users should first derive saccade-level kinematics
with a validated fixation/saccade detector.

## Usage

``` r
plot_gazepoint_saccade_main_sequence(
  dat,
  amplitude_col = NULL,
  peak_velocity_col = NULL,
  group_col = NULL,
  log_axes = TRUE,
  add_smoother = TRUE,
  main = "Gazepoint saccade main-sequence diagnostic"
)
```

## Arguments

- dat:

  A saccade-level data frame.

- amplitude_col:

  Saccade amplitude column.

- peak_velocity_col:

  Peak velocity column.

- group_col:

  Optional grouping column.

- log_axes:

  Logical. If `TRUE`, use log10 axes.

- add_smoother:

  Logical. If `TRUE`, add a lowess curve.

- main:

  Plot title.

## Value

Invisibly returns the plotted data and settings.
