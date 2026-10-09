# Summarize a Gazepoint audit trail

Summarizes pass, warning, failure, not-checked, recorded, and other
status counts from a Gazepoint audit index. The summary is descriptive
only and is intended to support transparent reporting of audit outputs.

## Usage

``` r
summarize_gazepoint_audit_trail(audit_index, by = NULL)
```

## Arguments

- audit_index:

  A `gazepoint_audit_index` object, a data frame, or an object accepted
  by
  [`create_gazepoint_audit_index()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_audit_index.md).

- by:

  Optional character vector of grouping columns in `audit_index`, such
  as `"audit_id"`, `"source_table"`, or `"domain"`.

## Value

A data frame with class `gazepoint_audit_trail_summary`.
