# Audit a smoke-test result for private information

Checks that a smoke-test result contains no private paths, source
filenames, participant-level identifier columns, or retained raw
workflow objects.

## Usage

``` r
audit_gazepoint_smoke_privacy(x, private_values = NULL)
```

## Arguments

- x:

  Object returned by
  [`run_gazepoint_real_data_smoke()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_real_data_smoke.md).

- private_values:

  Optional private path strings that must not occur in the object.

## Value

A data frame of privacy checks and pass/fail statuses.
