# Regularize signal data to an evenly spaced time grid

Uses [`stats::approx()`](https://rdrr.io/r/stats/approxfun.html) to
interpolate selected numeric signals onto a regular time grid within
each group. The function records an interpolation log and does not
extrapolate beyond the observed time range.

## Usage

``` r
upsample_gazepoint_data(
  data,
  time_col,
  signal_cols = NULL,
  group_cols = NULL,
  interval = NULL,
  method = c("linear", "constant")
)
```

## Arguments

- data:

  A data frame.

- time_col:

  Numeric time column.

- signal_cols:

  Optional character vector of numeric signal columns. If `NULL`, all
  numeric columns except grouping and time columns are used.

- group_cols:

  Optional grouping columns.

- interval:

  Numeric interval for the output time grid, in the same units as
  `time_col`. If `NULL`, the median positive time difference is used
  within each group.

- method:

  Interpolation method passed to
  [`stats::approx()`](https://rdrr.io/r/stats/approxfun.html):
  `"linear"` or `"constant"`.

## Value

A data frame with class `gazepoint_upsampled_data`.
