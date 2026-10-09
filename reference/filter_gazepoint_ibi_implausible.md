# Filter implausible Gazepoint IBI values

Flags and optionally cleans implausible inter-beat interval values. The
helper is conservative and does not remove rows; instead, it returns
row-level flags and a cleaned IBI column with implausible values set to
`NA`.

## Usage

``` r
filter_gazepoint_ibi_implausible(
  data,
  ibi_col = "IBI",
  time_col = NULL,
  group_cols = NULL,
  validity_col = NULL,
  unit = c("auto", "ms", "seconds"),
  min_ibi_ms = 300,
  max_ibi_ms = 2000,
  max_change_ms = 400,
  max_change_prop = 0.3,
  output_col = "IBI_clean_ms"
)
```

## Arguments

- data:

  A Gazepoint biometric data frame.

- ibi_col:

  IBI/RR interval column.

- time_col:

  Optional time/counter column.

- group_cols:

  Optional grouping columns.

- validity_col:

  Optional validity column.

- unit:

  Unit of the IBI column: `"auto"`, `"ms"`, or `"seconds"`.

- min_ibi_ms:

  Minimum plausible IBI in milliseconds.

- max_ibi_ms:

  Maximum plausible IBI in milliseconds.

- max_change_ms:

  Maximum plausible absolute adjacent IBI change within group, in
  milliseconds.

- max_change_prop:

  Maximum plausible proportional adjacent IBI change within group.

- output_col:

  Name of the cleaned IBI output column.

## Value

A list with `overview`, `data`, `row_flags`, `group_summary`, and
`settings`.
