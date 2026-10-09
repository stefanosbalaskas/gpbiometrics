# Check Gazepoint biometric columns

Checks whether a data frame contains known Gazepoint Biometrics columns.
This function does not assume that the channels are active. It only
checks whether the expected columns are present.

## Usage

``` r
check_gazepoint_biometric_columns(data)
```

## Arguments

- data:

  A data frame imported from a Gazepoint export.

## Value

A data frame describing expected columns, their signal family,
interpretation, and whether they are present.
