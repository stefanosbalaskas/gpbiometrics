# Detrend a Gazepoint signal

Applies a lightweight generic detrending step to any numeric Gazepoint
signal, either globally or within participant/trial groups. This is
useful for slow drift in channels such as EDA, pupil size, PPG baseline,
or temperature.

## Usage

``` r
detrend_gazepoint_signal(
  data,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  method = c("linear", "mean", "median", "loess", "none"),
  span = 0.3,
  preserve_mean = FALSE,
  suffix = "_detrended"
)
```

## Arguments

- data:

  Data frame or numeric vector.

- signal_col:

  Signal column for data-frame input.

- time_col:

  Optional time column. If omitted, sample index is used.

- group_cols:

  Optional grouping columns for within-group detrending.

- method:

  Detrending method: `"linear"`, `"mean"`, `"median"`, `"loess"`, or
  `"none"`.

- span:

  Span for LOESS detrending.

- preserve_mean:

  If TRUE, add the mean trend back after removing drift.

- suffix:

  Suffix for the detrended signal column.

## Value

Data frame with added trend and detrended columns.
