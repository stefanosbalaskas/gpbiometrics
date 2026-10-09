# Audit a Gazepoint export schema

Reports whether expected Gazepoint-style roles are present, missing, or
ambiguous, using the same alias dictionary as
[`standardize_gazepoint_column_names()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/standardize_gazepoint_column_names.md).

## Usage

``` r
audit_gazepoint_export_schema(
  data,
  expected_roles = NULL,
  dictionary = NULL,
  strict = FALSE
)
```

## Arguments

- data:

  Data frame or CSV/TSV path.

- expected_roles:

  Optional character vector of expected canonical roles.

- dictionary:

  Optional alias dictionary.

- strict:

  If TRUE, error when required roles are missing.

## Value

Data frame with one row per expected role.
