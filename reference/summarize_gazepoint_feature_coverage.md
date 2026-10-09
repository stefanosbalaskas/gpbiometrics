# Summarize gpbiometrics feature coverage

Creates a descriptive feature-coverage table from exported function
names. Domains are assigned using transparent name patterns. The summary
is intended for release review and documentation planning only.

## Usage

``` r
summarize_gazepoint_feature_coverage(
  path = ".",
  exports = NULL,
  patterns = NULL
)
```

## Arguments

- path:

  Package root.

- exports:

  Optional character vector of exported functions. If `NULL`, exports
  are read from `NAMESPACE`.

- patterns:

  Optional named list of regular-expression patterns used to assign
  exported functions to domains.

## Value

A data frame with one row per domain.
