# Analyse endosomatic skin-potential recordings

Computes skin-potential level and skin-potential response descriptors
from a voltage-like skin-potential column. This is for endosomatic
skin-potential recordings, not standard exosomatic skin conductance.

## Usage

``` r
analyze_gazepoint_skin_potential(
  dat,
  sp_col,
  time_col,
  group_cols = NULL,
  response_direction = c("both", "positive", "negative"),
  response_threshold = NULL,
  min_response_distance_s = 1
)
```

## Arguments

- dat:

  A data frame.

- sp_col:

  Numeric skin-potential column, usually in millivolts.

- time_col:

  Numeric time column.

- group_cols:

  Optional grouping columns.

- response_direction:

  `"both"`, `"positive"`, or `"negative"`.

- response_threshold:

  Optional absolute threshold for response detection. If `NULL`, a
  MAD-based derivative threshold is used.

- min_response_distance_s:

  Minimum distance between detected responses.

## Value

A list with `overview`, `level_summary`, `response_table`, `timeseries`,
and `settings`.
