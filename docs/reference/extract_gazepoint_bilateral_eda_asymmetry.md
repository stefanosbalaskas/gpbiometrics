# Extract bilateral EDA asymmetry features

Computes left-right electrodermal activity asymmetry descriptors from
two simultaneously recorded EDA channels. The function returns row-level
asymmetry time series and group-level summaries.

## Usage

``` r
extract_gazepoint_bilateral_eda_asymmetry(
  dat,
  left_col,
  right_col,
  time_col = NULL,
  group_cols = NULL,
  output_prefix = "beda"
)
```

## Arguments

- dat:

  A data frame.

- left_col:

  Numeric left-side EDA column.

- right_col:

  Numeric right-side EDA column.

- time_col:

  Optional numeric time column for ordering and gradient calculation.

- group_cols:

  Optional grouping columns.

- output_prefix:

  Prefix used for row-level output columns.

## Value

A list with `overview`, `asymmetry_timeseries`, `summary`, and
`settings`.

## Details

These descriptors quantify bilateral EDA differences only. They do not
infer hemisphere activation, amygdala activity, psychopathology,
emotion, stress, cognition, health status, or diagnosis.
