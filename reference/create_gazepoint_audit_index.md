# Create a Gazepoint audit index

Normalizes one or more Gazepoint audit/check objects into a single
tabular index. The function is designed for reproducibility and
reporting: it records object identifiers, source tables, checks, items,
statuses, messages, and optional paths. It does not modify data and does
not make scientific or clinical interpretations.

## Usage

``` r
create_gazepoint_audit_index(
  audits,
  audit_ids = NULL,
  include_summary_rows = FALSE
)
```

## Arguments

- audits:

  A single audit object, a data frame, or a named/unnamed list of audit
  objects. Recognized list elements include `checks`, `item_results`,
  `results`, `issues`, `flags`, `problems`, and `summary`.

- audit_ids:

  Optional character vector of audit identifiers. If omitted, names from
  `audits` are used where available.

- include_summary_rows:

  Logical. If `TRUE`, summary rows are added when a supplied audit
  object contains a `summary` data frame. If `FALSE`, summary rows are
  added only when no detailed audit table is available.

## Value

A data frame with class `gazepoint_audit_index`.
