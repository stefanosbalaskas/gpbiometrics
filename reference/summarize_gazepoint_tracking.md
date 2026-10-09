# Summarize Gazepoint tracking validity

Computes valid-pupil, valid-gaze, and combined tracking ratios overall
or by participant/trial/group.

## Usage

``` r
summarize_gazepoint_tracking(
  data,
  pupil_cols = NULL,
  x_col = NULL,
  y_col = NULL,
  group_cols = NULL,
  screen_bounds = c(0, 1, 0, 1),
  nonpositive_is_invalid = TRUE
)
```

## Arguments

- data:

  Eye-tracking data frame.

- pupil_cols:

  Optional pupil columns.

- x_col:

  Optional gaze x column.

- y_col:

  Optional gaze y column.

- group_cols:

  Optional grouping columns.

- screen_bounds:

  Numeric vector `c(x_min, x_max, y_min, y_max)`.

- nonpositive_is_invalid:

  If TRUE, non-positive pupil values are invalid.

## Value

Data frame of tracking ratios by group.
