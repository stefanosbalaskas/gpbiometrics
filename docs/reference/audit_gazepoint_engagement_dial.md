# Audit Gazepoint engagement-dial signal quality

Audits Gazepoint engagement-dial values for missingness, inactive rows,
validity flags, plausible range, flatlining, and usable sample coverage.

## Usage

``` r
audit_gazepoint_engagement_dial(
  data,
  value_column = "DIAL",
  validity_column = "DIALV",
  min_value = 0,
  max_value = 1,
  jump_threshold = NULL
)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- value_column:

  Engagement-dial value column. Defaults to `"DIAL"`.

- validity_column:

  Engagement-dial validity column. Defaults to `"DIALV"`.

- min_value:

  Minimum plausible dial value.

- max_value:

  Maximum plausible dial value.

- jump_threshold:

  Optional threshold for detecting large sample-to-sample jumps.

## Value

A one-row data frame summarising signal quality.
