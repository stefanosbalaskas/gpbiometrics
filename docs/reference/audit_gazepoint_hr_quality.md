# Audit Gazepoint heart-rate signal quality

Audits Gazepoint heart-rate values for missingness, inactive zero rows,
validity flags, plausible value ranges, sudden jumps, flatlining, and
usable sample coverage. `HRV` is treated as the heart-rate validity
flag, not as a heart-rate-variability metric.

## Usage

``` r
audit_gazepoint_hr_quality(
  data,
  value_column = "HR",
  validity_column = "HRV",
  min_value = 30,
  max_value = 220,
  jump_threshold = 25
)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- value_column:

  Heart-rate value column. Defaults to `"HR"`.

- validity_column:

  Heart-rate validity column. Defaults to `"HRV"`.

- min_value:

  Minimum plausible heart rate.

- max_value:

  Maximum plausible heart rate.

- jump_threshold:

  Threshold for detecting large sample-to-sample jumps.

## Value

A one-row data frame summarising signal quality.
