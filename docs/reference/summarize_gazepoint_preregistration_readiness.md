# Summarize preregistration readiness

Summarizes checklist or audit results into compact readiness counts and
proportions. The summary is intended for reporting and
reviewer-readiness documentation.

## Usage

``` r
summarize_gazepoint_preregistration_readiness(audit, by = NULL)
```

## Arguments

- audit:

  A `gazepoint_preregistration_audit` object or an item-level audit data
  frame.

- by:

  Optional grouping column, such as `"domain"`.

## Value

A data frame with class `gazepoint_preregistration_readiness`.
