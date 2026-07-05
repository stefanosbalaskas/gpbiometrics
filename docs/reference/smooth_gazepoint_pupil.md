# Smooth Gazepoint pupil columns

Applies a simple centred moving-average smoother to Gazepoint pupil
columns. The function is intended for transparent preprocessing and
quality-control workflows. It does not interpolate long missing gaps and
does not interpret pupil values as psychological or physiological
states.

## Usage

``` r
smooth_gazepoint_pupil(
  data,
  pupil_cols = NULL,
  id_cols = NULL,
  window = 5L,
  suffix = "_smooth",
  min_nonmissing = 1L
)
```

## Arguments

- data:

  A data frame containing Gazepoint pupil data.

- pupil_cols:

  Character vector naming pupil columns. If `NULL`, numeric columns
  whose names contain `"pupil"` are used.

- id_cols:

  Optional character vector naming grouping columns. Smoothing is
  applied within groups.

- window:

  Positive odd integer giving the moving-average window size.

- suffix:

  Suffix appended to smoothed pupil-column names.

- min_nonmissing:

  Minimum number of non-missing values required inside a window to
  compute a smoothed value.

## Value

A list with the processed data, a summary table, and settings. The
object has class `"gazepoint_pupil_smoothing"`.

## Examples

``` r
d <- data.frame(
  participant = rep("P01", 6),
  pupil_left = c(3.0, 3.2, 3.4, NA, 3.3, 3.1)
)
smooth_gazepoint_pupil(d, pupil_cols = "pupil_left", window = 3)
#> Error in smooth_gazepoint_pupil(d, pupil_cols = "pupil_left", window = 3): could not find function "smooth_gazepoint_pupil"
```
