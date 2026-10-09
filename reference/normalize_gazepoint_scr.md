# Normalize Gazepoint SCR amplitudes

Normalizes SCR amplitudes using z-scores, percent of maximum, min-max
range, centered scores, log-z scores, or no transformation.

## Usage

``` r
normalize_gazepoint_scr(
  amplitudes,
  method = c("z", "percent_max", "range", "center", "log_z", "none"),
  amplitude_col = NULL,
  group_cols = NULL,
  output_col = "scr_amplitude_normalized",
  na.rm = TRUE
)
```

## Arguments

- amplitudes:

  Numeric vector or data frame.

- method:

  Normalization method: `"z"`, `"percent_max"`, `"range"`, `"center"`,
  `"log_z"`, or `"none"`.

- amplitude_col:

  Column to normalize when `amplitudes` is a data frame.

- group_cols:

  Optional grouping columns for subject-specific normalization.

- output_col:

  Name of normalized column for data-frame input.

- na.rm:

  If TRUE, ignore missing values when computing normalization constants.

## Value

Numeric vector for vector input, or data frame for data-frame input.

## Examples

``` r
normalize_gazepoint_scr(c(0.1, 0.2, 0.3), method = "percent_max")
#> [1]  33.33333  66.66667 100.00000
```
