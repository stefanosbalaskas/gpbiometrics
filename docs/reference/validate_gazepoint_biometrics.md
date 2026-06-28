# Validate a Gazepoint Biometrics export

Performs a conservative validation of a Gazepoint Biometrics table or
CSV file. The function checks whether known biometric columns are
present, whether biometric channels appear active, whether common
time/synchronisation columns are available, and whether obvious
structural issues are present.

## Usage

``` r
validate_gazepoint_biometrics(data, require_active_signal = FALSE)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- require_active_signal:

  Logical. If `TRUE`, validation reports a warning when no active
  GSR/EDA, heart-rate, or engagement-dial channel is detected.

## Value

A list with `overview`, `columns`, `active_channels`, and `issues`. The
returned object has class `"gazepoint_biometrics_validation"`.
