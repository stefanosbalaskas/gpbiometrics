# Create a gpbiometrics release checklist

Creates a conservative release checklist. If an audit table is supplied,
each checklist item is linked to the current audit status. The checklist
is meant to support human review before tagging or submission.

## Usage

``` r
create_gazepoint_release_checklist(audit = NULL, include_optional = TRUE)
```

## Arguments

- audit:

  Optional audit data frame or `gazepoint_release_readiness_audit`
  object.

- include_optional:

  Logical. If `TRUE`, optional release-polish items are included.

## Value

A data frame with release checklist items.
