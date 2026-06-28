# Extract time-domain HRV features from Gazepoint IBI intervals

Computes simple time-domain HRV features from genuine IBI/RR intervals.
This helper does not use the Gazepoint `HRV` column as an HRV outcome.

## Usage

``` r
extract_gazepoint_hrv_features(
  data,
  ibi_col = "IBI_clean_ms",
  group_cols = NULL,
  unit = c("auto", "ms", "seconds"),
  min_intervals = 3,
  min_duration_s = 30,
  diff_threshold_ms = 50,
  collapse_repeated_intervals = TRUE,
  repeated_tolerance_ms = 1e-08
)
```

## Arguments

- data:

  A Gazepoint biometric data frame or `gazepoint_ibi_filter` object.

- ibi_col:

  IBI/RR interval column.

- group_cols:

  Optional grouping columns.

- unit:

  Unit of the IBI column: `"auto"`, `"ms"`, or `"seconds"`.

- min_intervals:

  Minimum clean intervals required per group.

- min_duration_s:

  Minimum IBI-sequence duration in seconds required before computed HRV
  features are treated as fully reportable. Groups below this duration
  still return features but receive `warn_short_hrv_duration`.

- diff_threshold_ms:

  Threshold for NN50/pNN50.

- collapse_repeated_intervals:

  Logical. If `TRUE`, consecutive repeated IBI values are collapsed
  before HRV features are computed. This is useful for Gazepoint exports
  where the same IBI value may be repeated across multiple gaze-sampling
  rows until a new interval is available.

- repeated_tolerance_ms:

  Numeric tolerance used when identifying repeated consecutive IBI
  values.

## Value

A list with `overview`, `features`, `settings`.
