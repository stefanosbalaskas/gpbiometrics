# Detect Gazepoint biometric time columns

Detects likely timing and counter columns in Gazepoint Biometrics
exports. The function reports candidate timing columns rather than
assuming that any single time variable is always present or always
measured in the same unit.

## Usage

``` r
detect_gazepoint_time_columns(data)
```

## Arguments

- data:

  A data frame or a character vector of column names.

## Value

A data frame with one row per detected time-related column.

## Examples

``` r
detect_gazepoint_time_columns(c("CNT", "TIME_MS", "GSR", "HR"))
#>    column standard_name           role    unit_hint confidence
#> 1     CNT           CNT sample_counter      samples       1.00
#> 2 TIME_MS       TIME_MS      timestamp milliseconds       0.95
#>                                                reason
#> 1                   Recognised sample counter column.
#> 2 Recognised time column with milliseconds-like name.
```
