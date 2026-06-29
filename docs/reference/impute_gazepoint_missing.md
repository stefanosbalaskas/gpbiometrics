# Impute missing values in Gazepoint signals

Interpolates missing values in numeric Gazepoint time series, such as
pupil, GSR/EDA, PPG/BVP, heart-rate, IBI/RRI, or other continuous
channels. The function can work on a numeric vector, a time-series
object, or selected numeric columns of a data frame.

## Usage

``` r
impute_gazepoint_missing(
  data,
  method = c("linear", "locf", "nocb", "nearest", "constant"),
  cols = NULL,
  time_col = NULL,
  group_cols = NULL,
  max_gap = Inf,
  fill_edges = TRUE,
  constant_value = 0,
  add_flags = TRUE,
  treat_infinite_as_missing = TRUE
)
```

## Arguments

- data:

  Numeric vector, time-series object, or data frame.

- method:

  Imputation method: `"linear"`, `"locf"`, `"nocb"`, `"nearest"`, or
  `"constant"`.

- cols:

  Columns to impute when `data` is a data frame. If NULL, all numeric
  columns except time and grouping columns are used.

- time_col:

  Optional time column for interpolation.

- group_cols:

  Optional grouping columns. Imputation is performed within groups.

- max_gap:

  Maximum missing-gap length, in samples, to impute. Longer gaps remain
  missing. Defaults to `Inf`.

- fill_edges:

  If TRUE, leading and trailing gaps are filled using the nearest
  observed value for methods that support it.

- constant_value:

  Value used when `method = "constant"`.

- add_flags:

  If TRUE and `data` is a data frame, add logical `<column>_was_imputed`
  columns.

- treat_infinite_as_missing:

  If TRUE, infinite values are treated as missing before imputation.

## Value

Object of the same basic type as `data`. Data-frame outputs include an
`imputation_summary` attribute.

## Examples

``` r
x <- c(1, NA, 3, 4)
impute_gazepoint_missing(x)
#> [1] 1 2 3 4

dat <- data.frame(time_s = 1:5, GSR = c(1, NA, 3, NA, 5))
impute_gazepoint_missing(dat, cols = "GSR", time_col = "time_s")
#>   time_s GSR GSR_was_imputed
#> 1      1   1           FALSE
#> 2      2   2            TRUE
#> 3      3   3           FALSE
#> 4      4   4            TRUE
#> 5      5   5           FALSE
```
