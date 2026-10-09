# Create a Gazepoint sidecar metadata template

Creates a simple tabular template for dataset, export, device, timing,
and processing metadata. The output can be written by the user as
CSV/TSV/JSON outside this function. This function does not perform full
BIDS conversion.

## Usage

``` r
create_gazepoint_sidecar_template(
  dataset_id = NULL,
  export_type = NULL,
  include_optional = TRUE,
  custom_fields = NULL
)
```

## Arguments

- dataset_id:

  Optional dataset identifier.

- export_type:

  Optional export type label, such as `"all_gaze"`, `"fixations"`,
  `"biometrics"`, or `"summary"`.

- include_optional:

  Logical. If `TRUE`, optional auditability fields are included.

- custom_fields:

  Optional data frame with columns `field`, `description`, `required`,
  `value`, and `notes`.

## Value

A data frame with class `gazepoint_sidecar_template`.
