# Prepare Gazepoint HRP/PPG waveform input for pyPPG

Prepares a Gazepoint heart-rate pulse waveform column, usually `HRP`, as
a lightweight input table for optional pyPPG workflows. This helper does
not call Python, does not require pyPPG, and does not derive HRV
features. It only prepares waveform values, timing information when
available, and conservative group-level summaries for interoperability
review.

## Usage

``` r
prepare_gazepoint_pyppg_input(
  data,
  ppg_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate = NULL,
  time_unit = c("auto", "ms", "seconds", "samples"),
  min_finite_prop = 0.5,
  output_dir = NULL,
  prefix = "gazepoint_pyppg"
)
```

## Arguments

- data:

  A Gazepoint biometric data frame or a list containing one.

- ppg_col:

  Optional HRP/PPG waveform column. If `NULL`, common Gazepoint HRP/PPG
  column names are detected.

- time_col:

  Optional time, timestamp, or sample-counter column.

- group_cols:

  Optional grouping columns.

- sampling_rate:

  Optional sampling rate in Hz. Useful when `time_col` is a sample
  counter such as `CNT`.

- time_unit:

  Unit of `time_col`: `"auto"`, `"ms"`, `"seconds"`, or `"samples"`.

- min_finite_prop:

  Minimum finite waveform proportion used for group readiness summaries.

- output_dir:

  Optional directory for CSV export. If `NULL`, no files are written.

- prefix:

  File prefix used when `output_dir` is supplied.

## Value

A list with `overview`, `waveform_table`, `group_summary`, `manifest`,
and `settings`.
