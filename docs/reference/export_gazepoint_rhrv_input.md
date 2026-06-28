# Export Gazepoint IBI data for RHRV-style workflows

Prepares cleaned inter-beat interval data for external HRV workflows.
The helper writes simple beat tables with cumulative beat time and
IBI/RR interval columns. It does not use the Gazepoint `HRV` column.

## Usage

``` r
export_gazepoint_rhrv_input(
  data,
  ibi_col = "IBI_clean_ms",
  group_cols = NULL,
  unit = c("auto", "ms", "seconds"),
  collapse_repeated_intervals = TRUE,
  repeated_tolerance_ms = 1e-08,
  min_ibi_ms = 300,
  max_ibi_ms = 2000,
  output_dir = NULL,
  prefix = "gazepoint_rhrv"
)
```

## Arguments

- data:

  A Gazepoint biometric data frame or `gazepoint_ibi_filter` object.

- ibi_col:

  IBI/RR interval column.

- group_cols:

  Optional grouping columns.

- unit:

  Unit of the IBI column: `"auto"`, `"ms"`, or `"seconds"`.

- collapse_repeated_intervals:

  Logical. If `TRUE`, consecutive repeated IBI values are collapsed
  before export.

- repeated_tolerance_ms:

  Numeric tolerance used when identifying repeated consecutive IBI
  values.

- min_ibi_ms:

  Minimum plausible IBI in milliseconds retained for export.

- max_ibi_ms:

  Maximum plausible IBI in milliseconds retained for export.

- output_dir:

  Optional directory where per-group CSV files are written.

- prefix:

  File prefix used when `output_dir` is supplied.

## Value

A list with `overview`, `beat_table`, `group_summary`, `manifest`, and
`settings`.
