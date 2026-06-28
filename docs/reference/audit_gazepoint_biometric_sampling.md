# Audit Gazepoint biometric sampling and timing

Audits timing or row-order information in Gazepoint Biometrics exports.
The function checks monotonicity, duplicate timestamps, nonpositive
intervals, and estimated sampling rate when the selected time column has
a real time unit. If only `CNT` is available, the function can still
check ordering but does not estimate a sampling rate unless `time_unit`
is explicitly meaningful.

## Usage

``` r
audit_gazepoint_biometric_sampling(
  data,
  group_columns = NULL,
  time_column = NULL,
  time_unit = c("seconds", "milliseconds", "microseconds", "samples"),
  expected_rate_hz = 60,
  tolerance_hz = 5
)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- group_columns:

  Optional grouping columns within which timing should be audited, such
  as `c("source_participant", "MEDIA_ID")`.

- time_column:

  Optional time/order column. If `NULL`, the function uses the first
  available column among `TIME`, `TIME_TICK`, and `CNT`.

- time_unit:

  Unit of the selected time column. Use `"seconds"`, `"milliseconds"`,
  `"microseconds"`, or `"samples"`. When `"samples"` is used,
  sampling-rate estimates are returned as `NA`.

- expected_rate_hz:

  Optional expected sampling rate in Hz.

- tolerance_hz:

  Acceptable absolute deviation from `expected_rate_hz`.

## Value

A data frame with one row per group.
