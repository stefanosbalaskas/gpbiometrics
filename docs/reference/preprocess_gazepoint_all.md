# Preprocess all available Gazepoint channels

Runs a conservative, beginner-friendly preprocessing sequence over a
Gazepoint data frame or imported session list. Available channels are
detected heuristically. Missing numeric signal gaps can be imputed,
pupil blinks cleaned, and gaze samples filtered when the relevant
functions and columns are available.

## Usage

``` r
preprocess_gazepoint_all(
  data,
  impute_missing = TRUE,
  clean_pupil = TRUE,
  filter_gaze = TRUE,
  max_gap = 10,
  screen_bounds = c(0, 1, 0, 1),
  max_velocity = Inf,
  verbose = TRUE
)
```

## Arguments

- data:

  Data frame or list of data frames.

- impute_missing:

  If TRUE, impute short missing gaps in numeric columns.

- clean_pupil:

  If TRUE, clean detected pupil columns.

- filter_gaze:

  If TRUE, filter detected gaze coordinates.

- max_gap:

  Maximum gap length in samples for imputation.

- screen_bounds:

  Screen bounds for gaze filtering.

- max_velocity:

  Maximum gaze velocity for gaze filtering.

- verbose:

  If TRUE, print a compact preprocessing log.

## Value

A preprocessed object of the same basic structure as `data`, with a
`preprocessing_log` attribute.

## Examples

``` r
dat <- data.frame(time_s = 1:5, GSR = c(1, NA, 3, 4, 5))
preprocess_gazepoint_all(dat)
#> Error in preprocess_gazepoint_all(dat): could not find function "preprocess_gazepoint_all"
```
