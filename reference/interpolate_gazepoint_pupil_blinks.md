# Interpolate Gazepoint pupil blink/dropout spans

Interpolates internal blink or dropout spans in pupil columns using
transparent, auditable rules. Leading/trailing gaps are not
interpolated.

## Usage

``` r
interpolate_gazepoint_pupil_blinks(
  data,
  pupil_cols = NULL,
  time_col = NULL,
  blink_col = NULL,
  max_gap_s = NULL,
  method = c("linear", "constant"),
  suffix = "_interp"
)
```

## Arguments

- data:

  Data frame containing pupil columns.

- pupil_cols:

  Pupil columns to interpolate. If omitted, common pupil columns are
  detected.

- time_col:

  Optional time column.

- blink_col:

  Optional logical/numeric blink mask column.

- max_gap_s:

  Optional maximum interpolated gap duration in seconds.

- method:

  Interpolation method passed to
  [`stats::approx()`](https://rdrr.io/r/stats/approxfun.html).

- suffix:

  Suffix for interpolated pupil columns.

## Value

Data frame with interpolated pupil columns and audit flags.
