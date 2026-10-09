# Apply conservative rule-based IBI corrections

Applies a conservative correction action to beats flagged by
[`audit_gazepoint_beats()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_beats.md).
The default action masks flagged intervals by setting their corrected
IBI to `NA`. The local-median action replaces flagged intervals only
when an unflagged local or group median is available. Every change is
logged. The function does not add or remove beat rows and does not
compute or interpret HRV outcomes.

## Usage

``` r
correct_gazepoint_beats(
  audit,
  action = c("mask", "local_median"),
  corrected_col = "ibi_corrected",
  local_window = 5,
  overwrite = FALSE,
  ...
)
```

## Arguments

- audit:

  A `gazepoint_beat_audit` object, or a data frame that can be passed to
  [`audit_gazepoint_beats()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_beats.md).

- action:

  Correction action. One of `"mask"` or `"local_median"`.

- corrected_col:

  Name of the corrected IBI column to create.

- local_window:

  Number of rows on each side to inspect for local-median replacement
  when `action = "local_median"`.

- overwrite:

  Logical. If `TRUE`, overwrite an existing corrected column.

- ...:

  Arguments passed to
  [`audit_gazepoint_beats()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_beats.md)
  when `audit` is a data frame.

## Value

A list with class `gazepoint_beat_correction`, containing corrected beat
data, a correction log, a summary table, and parameters.
