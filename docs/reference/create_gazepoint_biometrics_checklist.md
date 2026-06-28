# Create a Gazepoint Biometrics reporting checklist

Creates a compact reporting checklist for Gazepoint Biometrics exports.
The checklist summarises detected biometric channels, validation issues,
signal quality, missingness, available workflow domains, and
interpretation cautions. It is intended to support transparent
manuscript reporting and reviewer-facing methods documentation.

## Usage

``` r
create_gazepoint_biometrics_checklist(data, require_active_signal = TRUE)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- require_active_signal:

  Logical. Should inactive biometric channels be flagged in the
  validation output?

## Value

A list with `overview`, `channels`, `quality`, `missingness`,
`validation_issues`, `workflow_capabilities`, `feature_inventory`,
`reporting_guidance`, and `interpretation_cautions`.
