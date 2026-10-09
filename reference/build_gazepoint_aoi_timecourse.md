# Build a tidy AOI time course

Converts gaze or fixation samples into binned AOI proportions by
participant, trial, condition, or other grouping columns. AOIs can be
supplied as labels or derived from rectangular AOI definitions.

## Usage

``` r
build_gazepoint_aoi_timecourse(
  data,
  time_col = NULL,
  aoi_col = NULL,
  x_col = NULL,
  y_col = NULL,
  aoi_definitions = NULL,
  group_cols = NULL,
  bin_width_s = 0.1,
  valid_col = NULL,
  include_empty = TRUE
)
```

## Arguments

- data:

  Gaze or fixation data frame.

- time_col:

  Time column.

- aoi_col:

  Optional AOI label column.

- x_col:

  Optional x-coordinate column.

- y_col:

  Optional y-coordinate column.

- aoi_definitions:

  Optional data frame with `AOI`, `xmin`, `xmax`, `ymin`, and `ymax`.

- group_cols:

  Optional grouping columns.

- bin_width_s:

  Bin width in seconds.

- valid_col:

  Optional validity column.

- include_empty:

  If TRUE, include AOI/bin combinations with zero samples.

## Value

Tidy AOI time-course data frame.
