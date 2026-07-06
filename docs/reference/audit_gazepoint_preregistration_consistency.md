# Audit preregistration checklist consistency

Checks whether a preregistration checklist has corresponding evidence
objects and whether those evidence objects contain expected fields. The
audit is a documentation-readiness check only; it does not judge study
quality or perform automatic exclusion.

## Usage

``` r
audit_gazepoint_preregistration_consistency(
  checklist = NULL,
  evidence = list(),
  require_required_fields = TRUE
)
```

## Arguments

- checklist:

  A checklist produced by
  [`create_gazepoint_preregistration_checklist()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_preregistration_checklist.md),
  or `NULL` to use the default checklist.

- evidence:

  A named list of evidence objects. Each checklist row uses
  `evidence_key` to look up an object in this list. Evidence objects can
  be data frames, named lists, character vectors, logical values, or
  other non-empty objects.

- require_required_fields:

  Logical. If `TRUE`, listed `required_fields` must be present in
  data-frame or named-list evidence.

## Value

A list with class `gazepoint_preregistration_audit`.
