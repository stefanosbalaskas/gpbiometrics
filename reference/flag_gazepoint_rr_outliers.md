# Flag outlying Gazepoint RR/IBI intervals

Flags implausible RR intervals using absolute physiological limits and
either robust MAD-based or z-score-based deviation rules.

## Usage

``` r
flag_gazepoint_rr_outliers(
  rr_intervals,
  method = c("mad", "z", "range"),
  z_threshold = 5,
  mad_threshold = 5,
  min_rr = 300,
  max_rr = 2000,
  return = c("flags", "filtered", "data")
)
```

## Arguments

- rr_intervals:

  Numeric RR/IBI vector, usually in milliseconds.

- method:

  `"mad"`, `"z"`, or `"range"`.

- z_threshold:

  Z-score threshold when `method = "z"`.

- mad_threshold:

  Robust MAD threshold when `method = "mad"`.

- min_rr:

  Minimum plausible RR interval in ms.

- max_rr:

  Maximum plausible RR interval in ms.

- return:

  `"flags"`, `"filtered"`, or `"data"`.

## Value

Logical vector, filtered RR vector with outliers set to NA, or a data
frame with reason columns.

## Examples

``` r
flag_gazepoint_rr_outliers(c(800, 810, 3000, 790))
#> [1] FALSE FALSE  TRUE FALSE
```
