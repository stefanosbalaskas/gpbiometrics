# Summarize simple scanpath metrics

Computes simple gaze/fixation-path summaries including path length,
saccade count, regression-like leftward movements, fixation count, AOI
transitions, and transition entropy.

## Usage

``` r
summarize_gazepoint_scanpath_metrics(
  data,
  x_col = NULL,
  y_col = NULL,
  time_col = NULL,
  aoi_col = NULL,
  fixation_id_col = NULL,
  group_cols = NULL,
  min_saccade_distance = 0.02
)
```

## Arguments

- data:

  Gaze or fixation data frame.

- x_col:

  Gaze/fixation x column.

- y_col:

  Gaze/fixation y column.

- time_col:

  Optional time column.

- aoi_col:

  Optional AOI column.

- fixation_id_col:

  Optional fixation identifier column.

- group_cols:

  Optional grouping columns.

- min_saccade_distance:

  Minimum Euclidean movement counted as saccade.

## Value

Data frame with one row per group.
