# Audit beat or IBI sequences

Flags short, long, non-finite, duplicate-time, and abrupt-change
intervals in beat or inter-beat-interval data. The function is intended
for quality control and audit reporting only. It does not remove beats,
modify data, or make physiological, psychological, diagnostic, or
clinical claims.

## Usage

``` r
audit_gazepoint_beats(
  data,
  ibi_col = NULL,
  beat_time_col = NULL,
  group_cols = NULL,
  min_ibi = 300,
  max_ibi = 2000,
  duplicate_tolerance = 0,
  max_relative_change = NULL
)
```

## Arguments

- data:

  A data frame.

- ibi_col:

  Optional numeric inter-beat-interval column. If omitted, intervals are
  derived from `beat_time_col`.

- beat_time_col:

  Optional numeric beat-time column. Required when `ibi_col` is omitted.
  When supplied, rows are ordered by beat time within each group and
  duplicate-time checks are enabled.

- group_cols:

  Optional character vector of grouping columns, such as participant,
  session, trial, or condition.

- min_ibi:

  Minimum plausible interval, in the same units as the IBI column or
  beat-time column.

- max_ibi:

  Maximum plausible interval, in the same units as the IBI column or
  beat-time column.

- duplicate_tolerance:

  Maximum adjacent beat-time difference treated as a duplicate-time
  flag. Ignored when `beat_time_col` is `NULL`.

- max_relative_change:

  Optional relative-change threshold for flagging abrupt adjacent IBI
  changes. If `NULL`, this check is skipped.

## Value

A list with class `gazepoint_beat_audit`, containing beat-level flags,
group summaries, and parameters.
