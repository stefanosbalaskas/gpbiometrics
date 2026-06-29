# Validate a Gazepoint-format data frame

Lightweight format validator for Gazepoint-style biometric exports. This
wrapper checks required and optional columns and, when available,
attaches schema and audit outputs from existing package helpers.

## Usage

``` r
validate_gazepoint_format(
  data,
  required_cols = NULL,
  optional_cols = NULL,
  expected_modalities = NULL,
  standardize = FALSE,
  strict = FALSE,
  ...
)
```

## Arguments

- data:

  Data frame to validate.

- required_cols:

  Required column names.

- optional_cols:

  Optional column names to report as present or absent.

- expected_modalities:

  Optional expected modalities passed to
  [`audit_gazepoint_biometrics_file()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_biometrics_file.md)
  when available.

- standardize:

  If TRUE, standardize column names before validation.

- strict:

  If TRUE, audit warnings make the returned `valid` field FALSE.

- ...:

  Reserved for future extensions.

## Value

Object of class `gazepoint_format_validation`.
