# Audit Gazepoint GSR/EDA signal quality

Audits Gazepoint GSR/EDA columns for missingness, inactive zero rows,
validity flags, plausible value ranges, flatlining, and usable sample
coverage. When available, `GSR_US` is used by default because it
represents skin conductance in microsiemens in Gazepoint exports.

## Usage

``` r
audit_gazepoint_gsr_quality(
  data,
  value_column = NULL,
  validity_column = "GSRV",
  min_value = 0,
  max_value = 100,
  jump_threshold = NULL
)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- value_column:

  Optional GSR/EDA value column. If `NULL`, `GSR_US` is used when
  present, otherwise `GSR`.

- validity_column:

  Optional validity column. Defaults to `"GSRV"`.

- min_value:

  Minimum plausible value.

- max_value:

  Maximum plausible value.

- jump_threshold:

  Optional threshold for detecting large sample-to-sample jumps.

## Value

A one-row data frame summarising signal quality.
