# Flag HRV/RR segments for quality review

Splits RR/NN intervals into windows and flags segments with too few
beats, implausible intervals, excessive beat-to-beat changes, short
duration, or high artifact burden. The helper is intended as transparent
QC before HRV summaries or mixed-model analysis.

## Usage

``` r
flag_gazepoint_hrv_segments(
  data,
  rr_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  window_s = 60,
  min_beats = 20,
  min_duration_s = 20,
  min_rr_ms = 300,
  max_rr_ms = 2000,
  max_artifact_prop = 0.2,
  max_successive_change_prop = 0.2
)
```

## Arguments

- data:

  Data frame or numeric RR/NN interval vector.

- rr_col:

  RR/NN interval column for data-frame input.

- time_col:

  Optional timestamp column. If omitted, cumulative RR time is used.

- group_cols:

  Optional grouping columns such as participant or condition.

- window_s:

  Optional window length in seconds. If NULL, one segment is returned
  per group.

- min_beats:

  Minimum finite beats required for `quality_ok`.

- min_duration_s:

  Minimum segment duration in seconds.

- min_rr_ms:

  Minimum plausible RR interval in milliseconds.

- max_rr_ms:

  Maximum plausible RR interval in milliseconds.

- max_artifact_prop:

  Maximum allowed artifact proportion.

- max_successive_change_prop:

  Maximum allowed proportional beat-to-beat change before an interval is
  flagged.

## Value

Data frame with one row per segment.
