# Create a Gazepoint preregistration checklist

Creates a structured checklist for preregistration and
reviewer-readiness documentation. The checklist is descriptive only: it
helps users document design, preprocessing, QC, exclusions, outcomes,
and reporting decisions. It does not judge scientific validity, remove
data, or make biometric, psychological, diagnostic, or clinical claims.

## Usage

``` r
create_gazepoint_preregistration_checklist(
  study_id = NULL,
  include_optional = TRUE,
  custom_items = NULL
)
```

## Arguments

- study_id:

  Optional study identifier added to the checklist.

- include_optional:

  Logical. If `TRUE`, optional auditability items such as sensitivity
  analyses, data dictionaries, and manifests are included.

- custom_items:

  Optional data frame of additional checklist items. It may contain
  columns `domain`, `item_id`, `item`, `required`, `evidence_key`, and
  `required_fields`.

## Value

A data frame with class `gazepoint_preregistration_checklist`.
