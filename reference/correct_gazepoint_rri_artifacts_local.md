# Correct local RRI/IBI artifacts

Correct local RRI/IBI artifacts

## Usage

``` r
correct_gazepoint_rri_artifacts_local(
  rri_ms,
  method = c("local_median", "quotient", "zscore"),
  window_intervals = 5L,
  threshold = 0.2,
  replacement = c("local_median", "interpolate")
)
```

## Arguments

- rri_ms:

  Numeric RRI/IBI intervals in milliseconds.

- method:

  local_median, quotient, or zscore.

- window_intervals:

  Local window in intervals.

- threshold:

  Threshold for artifact detection.

- replacement:

  Replacement method: local_median or interpolate.

## Value

Data frame with corrected RRI values and artifact flags.
