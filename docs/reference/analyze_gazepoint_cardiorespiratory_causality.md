# Analyse cardiorespiratory Granger-style directionality

Computes dependency-light linear Granger-style directionality tests
between a respiration proxy and heart-rate or IBI/RR signal. This
estimates predictive directionality in a VAR-style model. It does not
prove physiological causality from observational data by itself.

## Usage

``` r
analyze_gazepoint_cardiorespiratory_causality(
  dat,
  respiration_col,
  cardiac_col,
  time_col = NULL,
  group_cols = NULL,
  lag_order = 3,
  min_rows = 30,
  standardise = TRUE
)
```

## Arguments

- dat:

  A data frame.

- respiration_col:

  Numeric respiration proxy column.

- cardiac_col:

  Numeric cardiac column, such as HR, IBI, or RR.

- time_col:

  Optional time column for ordering.

- group_cols:

  Optional grouping columns.

- lag_order:

  VAR lag order.

- min_rows:

  Minimum complete rows per group.

- standardise:

  Logical. If `TRUE`, z-standardise both series per group.

## Value

A list with `overview`, `causality_summary`, and `settings`.
