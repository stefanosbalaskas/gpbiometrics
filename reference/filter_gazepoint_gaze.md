# Filter implausible Gazepoint gaze samples

Flags and optionally removes gaze samples outside screen bounds or with
implausibly high point-to-point velocity.

## Usage

``` r
filter_gazepoint_gaze(
  data,
  x_col = NULL,
  y_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  screen_bounds = c(0, 1, 0, 1),
  max_velocity = Inf,
  drop_invalid = FALSE,
  suffix = "_filtered"
)
```

## Arguments

- data:

  Gaze data frame.

- x_col:

  Gaze x column. If NULL, common Gazepoint columns are detected.

- y_col:

  Gaze y column. If NULL, common Gazepoint columns are detected.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- screen_bounds:

  Numeric vector `c(x_min, x_max, y_min, y_max)`.

- max_velocity:

  Maximum allowed gaze velocity in coordinate units per second. Use
  `Inf` to disable velocity filtering.

- drop_invalid:

  If TRUE, return only valid rows.

- suffix:

  Suffix for filtered coordinate columns.

## Value

Data frame with validity flags, velocity, filter reason, and filtered
x/y columns.

## Examples

``` r
gaze <- data.frame(time_s = 1:3, BPOGX = c(.1, .2, 2), BPOGY = c(.2, .3, .4))
filter_gazepoint_gaze(gaze, screen_bounds = c(0, 1, 0, 1))
#>   time_s BPOGX BPOGY gaze_in_bounds gaze_velocity gaze_velocity_ok gaze_valid
#> 1      1   0.1   0.2           TRUE            NA             TRUE       TRUE
#> 2      2   0.2   0.3           TRUE     0.1414214             TRUE       TRUE
#> 3      3   2.0   0.4          FALSE     1.8027756             TRUE      FALSE
#>   gaze_filter_reason BPOGX_filtered BPOGY_filtered
#> 1              valid            0.1            0.2
#> 2              valid            0.2            0.3
#> 3     outside_screen             NA             NA
```
