# Smooth a Gazepoint biometric signal

Adds a simple centered moving-average smoothing column to a Gazepoint
Biometrics table. This is intentionally conservative and
dependency-free. It does not replace specialised biosignal preprocessing
libraries.

## Usage

``` r
smooth_gazepoint_biometrics(
  data,
  value_column,
  window = 5L,
  output_column = NULL,
  na_rm = TRUE
)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- value_column:

  Column to smooth.

- window:

  Number of samples in the moving window. Must be a positive odd
  integer.

- output_column:

  Name of the smoothed output column.

- na_rm:

  Should missing values be ignored within the moving window?

## Value

A data frame with the added smoothed column.
