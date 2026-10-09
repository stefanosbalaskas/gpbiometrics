# Model heartbeats as a dependency-light point process

Creates beat-time, interbeat interval, and inverse-Gaussian-style
summary tables from IBI/RR intervals. This is a compact point-process
model-preparation helper, not a full adaptive Bayesian heartbeat filter.

## Usage

``` r
model_gazepoint_hr_point_process(
  dat,
  ibi_col = "IBI",
  time_col = NULL,
  beat_time_col = NULL,
  group_cols = NULL,
  ibi_units = c("auto", "seconds", "milliseconds")
)
```

## Arguments

- dat:

  A data frame.

- ibi_col:

  Numeric IBI/RR interval column.

- time_col:

  Optional time column.

- beat_time_col:

  Optional explicit beat-time column.

- group_cols:

  Optional grouping columns.

- ibi_units:

  `"auto"`, `"seconds"`, or `"milliseconds"`.

## Value

A list with `overview`, `beat_table`, `interval_table`,
`process_summary`, and `settings`.
