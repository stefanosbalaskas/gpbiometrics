# Clean Gazepoint pupil data

Compatibility helper for users searching for a short pupil-cleaning
function. By default it applies transparent blink/dropout interpolation
using
[`interpolate_gazepoint_pupil_blinks()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/interpolate_gazepoint_pupil_blinks.md).
Set `prefer_existing = TRUE` to delegate to
[`clean_gazepoint_pupil_signal()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/clean_gazepoint_pupil_signal.md)
when compatible with the supplied arguments.

## Usage

``` r
clean_gazepoint_pupil(
  data,
  pupil_cols = NULL,
  time_col = NULL,
  blink_col = NULL,
  max_gap_s = NULL,
  method = c("linear", "constant"),
  suffix = "_clean",
  prefer_existing = FALSE,
  ...
)
```

## Arguments

- data:

  Data frame containing pupil columns.

- pupil_cols:

  Pupil columns to clean. If omitted, common pupil columns are detected.

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

  Suffix for cleaned pupil columns.

- prefer_existing:

  If TRUE, first try
  [`clean_gazepoint_pupil_signal()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/clean_gazepoint_pupil_signal.md).

- ...:

  Additional arguments passed to the preferred existing cleaner when
  `prefer_existing = TRUE`.

## Value

Data frame with cleaned pupil columns and interpolation flags.
