# Pseudonymize participant or record identifiers

Replaces selected identifier columns with deterministic sequential
codes. This function supports de-identification workflows, but it does
not by itself guarantee anonymity or regulatory compliance.

## Usage

``` r
anonymize_gazepoint_data(
  data,
  id_cols,
  prefix = "P",
  width = 3,
  keep_mapping = TRUE
)
```

## Arguments

- data:

  A data frame.

- id_cols:

  Character vector of identifier columns to replace.

- prefix:

  Prefix used in generated codes.

- width:

  Numeric width used for zero-padded codes.

- keep_mapping:

  Logical. If `TRUE`, store the mapping table as an attribute named
  `"id_mapping"`.

## Value

A data frame with class `gazepoint_anonymized_data`.
