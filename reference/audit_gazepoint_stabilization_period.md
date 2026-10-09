# Audit or trim the EDA electrode stabilization period

Flags or removes the initial stabilization period in each
recording/group. This is intended to prevent early skin-electrode drift
from being treated as a stable physiological baseline.

## Usage

``` r
audit_gazepoint_stabilization_period(
  dat,
  time_col = "CNT",
  group_cols = NULL,
  stabilization_minutes = 10,
  action = c("flag", "trim"),
  output_col = "in_stabilization_period",
  time_units = c("auto", "seconds", "milliseconds")
)
```

## Arguments

- dat:

  A data frame.

- time_col:

  Numeric time column.

- group_cols:

  Optional grouping columns.

- stabilization_minutes:

  Stabilization duration to flag or trim.

- action:

  `"flag"` or `"trim"`.

- output_col:

  Output logical flag column.

- time_units:

  `"auto"`, `"seconds"`, or `"milliseconds"`.

## Value

A data frame with stabilization-period attributes.
