# Detect blink intervals from Gazepoint pupil data

Identifies blink-like intervals as runs of missing, zero, non-finite, or
invalid pupil samples. For binocular data, the default treats a blink as
a sample where all selected pupil channels are invalid.

## Usage

``` r
detect_gazepoint_pupil_blinks(
  data,
  pupil_cols = NULL,
  time_col = NULL,
  group_cols = NULL,
  validity_cols = NULL,
  invalid_values = c(0),
  nonpositive_is_missing = TRUE,
  combine = c("all", "any"),
  min_blink_samples = 1L,
  return = c("intervals", "onsets", "flags")
)
```

## Arguments

- data:

  Eye-tracking data frame.

- pupil_cols:

  Pupil columns. If NULL, common Gazepoint names such as `LPD` and `RPD`
  are detected automatically.

- time_col:

  Time column. If NULL, common Gazepoint time columns are detected
  automatically.

- group_cols:

  Optional grouping columns, such as participant or trial.

- validity_cols:

  Optional validity columns corresponding to `pupil_cols`, such as `LPV`
  and `RPV`.

- invalid_values:

  Numeric values treated as missing pupil samples.

- nonpositive_is_missing:

  If TRUE, pupil values less than or equal to zero are treated as
  invalid.

- combine:

  Whether a blink requires `"all"` or `"any"` selected pupil channels to
  be invalid.

- min_blink_samples:

  Minimum run length in samples.

- return:

  Return `"intervals"`, `"onsets"`, or `"flags"`.

## Value

A data frame of blink intervals by default. If `return = "onsets"`, a
numeric vector of blink onset times is returned. If `return = "flags"`,
a logical vector marking blink samples is returned.

## Examples

``` r
dat <- data.frame(time_s = 0:4, LPD = c(3, NA, NA, 3.1, 3.2))
detect_gazepoint_pupil_blinks(dat, pupil_cols = "LPD", time_col = "time_s")
#> Error in detect_gazepoint_pupil_blinks(dat, pupil_cols = "LPD", time_col = "time_s"): could not find function "detect_gazepoint_pupil_blinks"
```
