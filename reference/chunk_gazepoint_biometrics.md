# Chunk Gazepoint biometric data into fixed analysis episodes

Adds programmatic fixed-duration chunks/episodes to continuous biometric
data. This is useful for baseline segmentation, repeated-measures
feature extraction, and analyses that do not rely on external TTL
markers.

## Usage

``` r
chunk_gazepoint_biometrics(
  dat,
  time_col = "CNT",
  group_cols = NULL,
  chunk_seconds = 60,
  start_time = NULL,
  chunk_col = "chunk_id",
  episode_col = "episode_id",
  include_partial = FALSE
)
```

## Arguments

- dat:

  A data frame.

- time_col:

  Numeric time column.

- group_cols:

  Optional grouping columns.

- chunk_seconds:

  Chunk duration in seconds.

- start_time:

  Optional fixed start time. If `NULL`, uses group minimum.

- chunk_col:

  Output chunk identifier column.

- episode_col:

  Output episode label column.

- include_partial:

  Logical. If `FALSE`, partial final chunks are marked but not assigned
  as complete chunks.

## Value

A data frame with chunk columns and chunk-summary attributes.
