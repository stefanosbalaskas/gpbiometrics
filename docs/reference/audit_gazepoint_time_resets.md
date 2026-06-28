# Audit Gazepoint biometric time resets

Detects negative time steps, duplicate time steps, non-finite time
values, and recording segments within grouped Gazepoint biometric
exports. This helper is intended for quality control and synchronization
inspection. It does not alter raw values unless
`return_reindexed_time = TRUE`, in which case an additional
segment-relative time column is added.

## Usage

``` r
audit_gazepoint_time_resets(
  data,
  time_col = NULL,
  group_cols = NULL,
  allow_ties = TRUE,
  split_on_negative_step = TRUE,
  return_reindexed_time = FALSE,
  min_segment_rows = 1
)
```

## Arguments

- data:

  A data frame containing Gazepoint biometric rows.

- time_col:

  Optional time/counter column. If `NULL`, common Gazepoint time columns
  are detected automatically.

- group_cols:

  Optional grouping columns. If `NULL`, available
  source/participant/media/trial-like columns are used.

- allow_ties:

  Logical. If `TRUE`, repeated time values are not treated as
  non-monotonic.

- split_on_negative_step:

  Logical. If `TRUE`, negative time steps start a new segment within
  each group.

- return_reindexed_time:

  Logical. If `TRUE`, adds `time_reindexed_within_segment`, starting at
  zero within each detected segment.

- min_segment_rows:

  Minimum rows expected per segment before a segment is flagged as
  short.

## Value

A list with `overview`, `segment_summary`, `row_flags`,
`data_with_segments`, and `settings`.
