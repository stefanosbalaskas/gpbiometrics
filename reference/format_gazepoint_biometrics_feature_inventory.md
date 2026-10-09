# Format the gpbiometrics feature inventory for users

Adds user-facing labels and interpretation metadata to the package
feature inventory. This helper is intentionally non-breaking: it does
not replace the core inventory object returned by
[`create_gazepoint_biometrics_feature_inventory()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_feature_inventory.md).

## Usage

``` r
format_gazepoint_biometrics_feature_inventory(
  inventory = NULL,
  include_internal = FALSE,
  sort = TRUE
)
```

## Arguments

- inventory:

  Optional inventory object returned by
  [`create_gazepoint_biometrics_feature_inventory()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_feature_inventory.md).
  If `NULL`, a fresh inventory is created.

- include_internal:

  Logical. Passed to
  [`create_gazepoint_biometrics_feature_inventory()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_feature_inventory.md)
  when `inventory = NULL`.

- sort:

  Logical. If `TRUE`, sort by domain, user level, and function name.

## Value

A data frame with polished user-facing inventory columns.
