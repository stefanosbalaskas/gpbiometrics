# Build a multimodal physiology validation ladder

Build a multimodal physiology validation ladder

## Usage

``` r
physiology_validation_ladder(
  acquisition_qc = "not_assessed",
  analytical_qc = "not_assessed",
  construct_check = "not_assessed",
  within_person = "not_assessed",
  held_out_person = "not_assessed",
  claim = "descriptive"
)
```

## Arguments

- acquisition_qc, analytical_qc, construct_check, within_person,
  held_out_person:

  Stage statuses: `pass`, `warning`, `fail`, or `not_assessed`.

- claim:

  Claim type. `generalizable` requires held-out-person evidence.

## Value

A structured validation result.
