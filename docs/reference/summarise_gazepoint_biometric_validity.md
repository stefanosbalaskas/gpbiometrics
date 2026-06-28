# Summarise validity and availability of Gazepoint biometric signals

Summarises missingness, finite numeric availability, variability, and
optional validity-flag columns for Gazepoint Biometrics data. The helper
is descriptive: it reports whether biometric signals appear available
and usable, but it does not infer emotion, valence, or HRV from
ambiguous raw columns. In particular, raw `HRV` columns are treated as
validity/vendor flags unless the user has independent documentation
proving otherwise.

## Usage

``` r
summarise_gazepoint_biometric_validity(
  data,
  signal_cols = NULL,
  validity_cols = NULL,
  group_cols = NULL,
  active_min_unique = 2L
)
```

## Arguments

- data:

  A data frame.

- signal_cols:

  Optional character vector of biometric signal columns to summarise. If
  `NULL`, common Gazepoint biometric signal columns are detected from
  the column names.

- validity_cols:

  Optional character vector of validity-flag columns to summarise. If
  `NULL`, common validity-like columns are detected, including `HRV`
  when present.

- group_cols:

  Optional character vector of grouping columns, such as participant,
  stimulus, trial, or condition columns.

- active_min_unique:

  Minimum number of unique finite values required for a numeric signal
  to be treated as active.

## Value

A list with `overview`, `signals`, `validity_flags`, `group_summary`,
and `settings`.

## Examples

``` r
df <- data.frame(
  USER = rep(c("P1", "P2"), each = 4),
  GSR = c(1, 2, NA, 4, 2, 2, 2, 2),
  HR = c(70, 71, 72, NA, 80, 81, 82, 83),
  HRV = c(1, 1, 0, 1, 1, 1, 1, 1)
)
summarise_gazepoint_biometric_validity(df, group_cols = "USER")
#> $overview
#>   n_rows n_columns signal_column_count active_signal_count
#> 1      8         4                   2                   2
#>   inactive_signal_count validity_flag_column_count group_column_count
#> 1                     0                          1                  1
#>                        status
#> 1 biometric_signals_available
#> 
#> $signals
#>   column signal_type n n_missing missing_rate n_non_missing n_finite
#> 1    GSR     gsr_eda 8         1        0.125             7        7
#> 2     HR  heart_rate 8         1        0.125             7        7
#>   finite_rate n_unique_finite      mean median        sd min max        status
#> 1       0.875               3  2.142857      2 0.8997354   1   4 active_signal
#> 2       0.875               7 77.000000     80 5.7154761  70  83 active_signal
#> 
#> $validity_flags
#>   column standard_name n n_missing missing_rate n_valid_like valid_like_rate
#> 1    HRV           HRV 8         0            0            7           0.875
#>   n_invalid_like invalid_like_rate
#> 1              1             0.125
#>                                        interpretation_note
#> 1 Treated as a validity/vendor flag, not as an HRV metric.
#> 
#> $group_summary
#>   group n_rows signal_column_count active_signal_count
#> 1    P1      4                   2                   2
#> 2    P2      4                   2                   1
#>                                      status
#> 1                signals_available_in_group
#> 2 some_signals_inactive_or_limited_in_group
#> 
#> $settings
#> $settings$signal_cols
#> [1] "GSR" "HR" 
#> 
#> $settings$validity_cols
#> [1] "HRV"
#> 
#> $settings$group_cols
#> [1] "USER"
#> 
#> $settings$active_min_unique
#> [1] 2
#> 
#> $settings$notes
#> [1] "GSR/EDA availability does not identify emotional valence."                                           
#> [2] "Heart-rate availability requires baseline/task context for interpretation."                          
#> [3] "Raw HRV columns are treated as validity/vendor flags unless independently documented as HRV metrics."
#> 
#> 
```
