# Flag biometric dropouts and flatline periods

Flags missing-value runs and sustained flatline runs in Gazepoint
biometric signal columns. Missing dropouts are defined as consecutive
missing or non-finite numeric samples. Flatline dropouts are defined as
consecutive finite numeric samples that remain unchanged within a
tolerance.

## Usage

``` r
flag_gazepoint_biometric_dropouts(
  data,
  signal_cols = NULL,
  group_cols = NULL,
  time_col = NULL,
  min_missing_run = 5L,
  min_flatline_run = 10L,
  constant_tolerance = 0,
  prefix = "biometric_dropout"
)
```

## Arguments

- data:

  A data frame.

- signal_cols:

  Optional character vector of biometric signal columns. If `NULL`,
  common Gazepoint biometric signal columns are detected.

- group_cols:

  Optional grouping columns. Runs are computed separately within each
  group.

- time_col:

  Optional time column used to order rows within each group before run
  detection. If `NULL`, the current row order is used.

- min_missing_run:

  Minimum consecutive missing/non-finite samples required to flag a
  missing dropout.

- min_flatline_run:

  Minimum consecutive unchanged finite samples required to flag a
  flatline dropout.

- constant_tolerance:

  Numeric tolerance used when detecting unchanged values for flatline
  runs.

- prefix:

  Prefix for generated dropout columns.

## Value

The input data frame with added logical dropout columns. The attributes
`dropout_summary` and `dropout_settings` contain structured summaries.

## Details

The function adds row-level flags and stores a dropout summary in the
returned data frame attributes. It does not remove rows.

## Examples

``` r
df <- data.frame(
  CNT = 1:8,
  GSR = c(1, NA, NA, NA, 2, 2, 2, 3),
  HR = c(70, 71, 72, 73, 74, 75, 76, 77)
)
flag_gazepoint_biometric_dropouts(df, min_missing_run = 3, min_flatline_run = 3)
#>   CNT GSR HR biometric_dropout_GSR_missing biometric_dropout_GSR_flatline
#> 1   1   1 70                         FALSE                          FALSE
#> 2   2  NA 71                          TRUE                          FALSE
#> 3   3  NA 72                          TRUE                          FALSE
#> 4   4  NA 73                          TRUE                          FALSE
#> 5   5   2 74                         FALSE                           TRUE
#> 6   6   2 75                         FALSE                           TRUE
#> 7   7   2 76                         FALSE                           TRUE
#> 8   8   3 77                         FALSE                          FALSE
#>   biometric_dropout_GSR_any biometric_dropout_HR_missing
#> 1                     FALSE                        FALSE
#> 2                      TRUE                        FALSE
#> 3                      TRUE                        FALSE
#> 4                      TRUE                        FALSE
#> 5                      TRUE                        FALSE
#> 6                      TRUE                        FALSE
#> 7                      TRUE                        FALSE
#> 8                     FALSE                        FALSE
#>   biometric_dropout_HR_flatline biometric_dropout_HR_any biometric_dropout_any
#> 1                         FALSE                    FALSE                 FALSE
#> 2                         FALSE                    FALSE                  TRUE
#> 3                         FALSE                    FALSE                  TRUE
#> 4                         FALSE                    FALSE                  TRUE
#> 5                         FALSE                    FALSE                  TRUE
#> 6                         FALSE                    FALSE                  TRUE
#> 7                         FALSE                    FALSE                  TRUE
#> 8                         FALSE                    FALSE                 FALSE
```
