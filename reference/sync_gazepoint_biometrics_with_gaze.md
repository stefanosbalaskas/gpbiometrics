# Synchronise Gazepoint Biometrics with gaze data

Joins Gazepoint Biometrics data to gaze or fixation data using exact key
columns. This function is intentionally conservative: it does not
perform interpolation, nearest-neighbour matching, or automatic time
shifting. For a first reproducible workflow, exact joins by participant,
media, trial, sample counter, or fixation identifier are preferred when
those fields are available.

## Usage

``` r
sync_gazepoint_biometrics_with_gaze(
  biometrics,
  gaze,
  by,
  all_x = TRUE,
  suffixes = c(".gaze", ".bio")
)
```

## Arguments

- biometrics:

  A Gazepoint Biometrics data frame.

- gaze:

  A gaze, fixation, AOI, or `gp3tools`-style summary data frame.

- by:

  Character vector of key columns used for joining.

- all_x:

  Logical. Should all rows from `gaze` be retained?

- suffixes:

  Character vector of length two used for duplicate non-key column
  names.

## Value

A data frame with gaze rows joined to biometric columns. The returned
object has class `"gazepoint_biometrics_sync"` and a `"sync_summary"`
attribute.
