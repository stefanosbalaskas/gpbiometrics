# Detect the likely timebase of Gazepoint biometric data

Inspects timing and counter columns and returns a conservative summary
of the likely primary timebase. Sampling rate is estimated only when
numeric timing information is available and intervals are positive.

## Usage

``` r
detect_gazepoint_biometric_timebase(data, time_col = NULL, counter_col = NULL)
```

## Arguments

- data:

  A data frame.

- time_col:

  Optional explicit timing column.

- counter_col:

  Optional explicit counter column.

## Value

A list with `overview`, `time_columns`, `interval_summary`, and
`warnings`.

## Examples

``` r
df <- data.frame(CNT = 1:5, TIME = seq(0, by = 1 / 60, length.out = 5))
detect_gazepoint_biometric_timebase(df)
#> $overview
#>   n_rows primary_time_column primary_time_role    unit median_interval
#> 1      5                TIME         timestamp seconds      0.01666667
#>   sampling_rate_hz counter_column n_valid_intervals            status
#> 1               60            CNT                 4 timebase_detected
#> 
#> $time_columns
#>   column standard_name           role unit_hint confidence
#> 1    CNT           CNT sample_counter   samples       1.00
#> 2   TIME          TIME      timestamp   seconds       0.95
#>                                           reason
#> 1              Recognised sample counter column.
#> 2 Recognised time column with seconds-like name.
#> 
#> $interval_summary
#>      unit n_intervals n_valid_intervals n_zero_or_negative_intervals
#> 1 seconds           4                 4                            0
#>   min_interval median_interval mean_interval max_interval
#> 1   0.01666667      0.01666667    0.01666667   0.01666667
#> 
#> $warnings
#> character(0)
#> 
```
