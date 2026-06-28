# Create a gpbiometrics feature inventory

Creates a structured inventory of implemented gpbiometrics helper
functions. This is useful for reporting, readiness checks,
documentation, and package development audits.

## Usage

``` r
create_gazepoint_biometrics_feature_inventory(include_internal = FALSE)
```

## Arguments

- include_internal:

  Logical. If `TRUE`, also checks for non-exported internal helper names
  when they are included in the inventory.

## Value

A list with `overview`, `inventory`, `domain_summary`,
`missing_expected`, and `settings`.
