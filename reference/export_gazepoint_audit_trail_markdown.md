# Export a Gazepoint audit trail as Markdown

Creates a plain Markdown audit-trail summary from a Gazepoint audit
index. The output can be copied into supplementary materials, review
responses, or project documentation. No rendering dependency is
required.

## Usage

``` r
export_gazepoint_audit_trail_markdown(
  audit_index,
  summary = NULL,
  title = "Gazepoint audit trail",
  include_details = TRUE,
  max_details = 50,
  file = NULL
)
```

## Arguments

- audit_index:

  A `gazepoint_audit_index` object, a data frame, or an object accepted
  by
  [`create_gazepoint_audit_index()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_audit_index.md).

- summary:

  Optional summary table. If `NULL`, the summary is created with
  [`summarize_gazepoint_audit_trail()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarize_gazepoint_audit_trail.md).

- title:

  Markdown title.

- include_details:

  Logical. If `TRUE`, detail rows are included.

- max_details:

  Maximum number of detail rows to include.

- file:

  Optional file path. If supplied, the Markdown text is written to disk.

## Value

A single character string containing Markdown text.
