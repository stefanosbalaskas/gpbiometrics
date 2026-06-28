# Clean Gazepoint pupil signal

Flags blink samples, non-positive pupil values, and robust outlier
spikes, then interpolates short missing segments. The function returns
the original data with cleaned pupil columns and provenance flags.

## Usage

``` r
clean_gazepoint_pupil_signal(
  data,
  pupil_cols = NULL,
  time_col = NULL,
  group_cols = NULL,
  validity_cols = NULL,
  method = c("linear", "locf", "nocb", "nearest", "constant"),
  max_gap = Inf,
  spike_mad = 6,
  combine = c("all", "any"),
  min_blink_samples = 1L,
  suffix = "_clean",
  keep_flags = TRUE
)
```

## Arguments

- data:

  Eye-tracking data frame.

- pupil_cols:

  Pupil columns. If NULL, common Gazepoint pupil columns are detected
  automatically.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- validity_cols:

  Optional validity columns corresponding to pupil columns.

- method:

  Imputation method passed to
  [`impute_gazepoint_missing()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/impute_gazepoint_missing.md).

- max_gap:

  Maximum missing run length, in samples, to interpolate.

- spike_mad:

  Robust MAD threshold for pupil outlier spikes.

- combine:

  Blink rule passed to
  [`detect_gazepoint_pupil_blinks()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_pupil_blinks.md).

- min_blink_samples:

  Minimum blink run length in samples.

- suffix:

  Suffix for cleaned pupil columns.

- keep_flags:

  If TRUE, add blink/spike/imputation flag columns.

## Value

Data frame with cleaned pupil columns and a `pupil_cleaning_summary`
attribute.

## Examples

``` r
dat <- data.frame(time_s = 0:4, LPD = c(3, NA, 3.2, 40, 3.1))
clean_gazepoint_pupil_signal(dat, pupil_cols = "LPD", time_col = "time_s")
#> Error in clean_gazepoint_pupil_signal(dat, pupil_cols = "LPD", time_col = "time_s"): could not find function "clean_gazepoint_pupil_signal"
```
