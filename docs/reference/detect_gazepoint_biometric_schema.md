# Detect the schema of Gazepoint biometric data

Detects likely biometric, timing, marker, and identifying columns in a
Gazepoint Biometrics export. The function is deliberately descriptive.
It reports what appears to be present and active, but it does not infer
emotion, valence, or HRV from ambiguous raw columns.

## Usage

``` r
detect_gazepoint_biometric_schema(data)
```

## Arguments

- data:

  A data frame.

## Value

A list with `overview`, `columns`, `time_columns`, `timebase`,
`name_map`, and `notes`.

## Examples

``` r
df <- data.frame(
  CNT = 1:5,
  TIME = seq(0, by = 1 / 60, length.out = 5),
  GSR = c(100, 101, 102, 101, 100),
  HR = c(70, 71, 72, 71, 70),
  HRV = c(1, 1, 1, 1, 1)
)
detect_gazepoint_biometric_schema(df)
#> $overview
#>   n_rows n_columns time_column_count has_counter has_gsr_eda
#> 1      5         5                 2        TRUE        TRUE
#>   has_gsr_conductance has_gsr_resistance has_heart_rate has_hrv_flag has_ibi
#> 1               FALSE              FALSE           TRUE         TRUE   FALSE
#>   has_engagement_dial has_ttl_marker active_gsr_eda active_heart_rate
#> 1               FALSE          FALSE           TRUE              TRUE
#>   active_ibi active_engagement_dial active_ttl_marker active_signal_count
#> 1      FALSE                  FALSE             FALSE                   2
#>                      status
#> 1 biometric_schema_detected
#> 
#> $columns
#>   column standard_name             signal_group present active n_non_missing
#> 1    CNT           CNT                   timing    TRUE   TRUE             5
#> 2   TIME          TIME                   timing    TRUE   TRUE             5
#> 3    GSR           GSR                  gsr_eda    TRUE   TRUE             5
#> 4     HR            HR               heart_rate    TRUE   TRUE             5
#> 5    HRV           HRV heart_rate_validity_flag    TRUE   TRUE             5
#>   n_unique_non_missing
#> 1                    5
#> 2                    5
#> 3                    3
#> 4                    3
#> 5                    1
#>                                                                             interpretation_note
#> 1                                                                                          <NA>
#> 2                                                                                          <NA>
#> 3                GSR/EDA unit interpretation depends on export documentation and column naming.
#> 4                                                                                          <NA>
#> 5 Treat as a validity/vendor flag unless documentation proves this column contains HRV metrics.
#> 
#> $time_columns
#>   column standard_name           role unit_hint confidence
#> 1    CNT           CNT sample_counter   samples       1.00
#> 2   TIME          TIME      timestamp   seconds       0.95
#>                                           reason
#> 1              Recognised sample counter column.
#> 2 Recognised time column with seconds-like name.
#> 
#> $timebase
#> $timebase$overview
#>   n_rows primary_time_column primary_time_role    unit median_interval
#> 1      5                TIME         timestamp seconds      0.01666667
#>   sampling_rate_hz counter_column n_valid_intervals            status
#> 1               60            CNT                 4 timebase_detected
#> 
#> $timebase$time_columns
#>   column standard_name           role unit_hint confidence
#> 1    CNT           CNT sample_counter   samples       1.00
#> 2   TIME          TIME      timestamp   seconds       0.95
#>                                           reason
#> 1              Recognised sample counter column.
#> 2 Recognised time column with seconds-like name.
#> 
#> $timebase$interval_summary
#>      unit n_intervals n_valid_intervals n_zero_or_negative_intervals
#> 1 seconds           4                 4                            0
#>   min_interval median_interval mean_interval max_interval
#> 1   0.01666667      0.01666667    0.01666667   0.01666667
#> 
#> $timebase$warnings
#> character(0)
#> 
#> 
#> $name_map
#>   original_name standard_name changed
#> 1           CNT           CNT   FALSE
#> 2          TIME          TIME   FALSE
#> 3           GSR           GSR   FALSE
#> 4            HR            HR   FALSE
#> 5           HRV           HRV   FALSE
#> 
#> $notes
#> [1] "Treat raw HRV columns as validity or vendor flags unless documentation proves they contain HRV metrics." 
#> [2] "IBI-derived HRV summaries should be computed only from genuine IBI/RR interval columns."                 
#> [3] "GSR/EDA units should not be overclaimed unless the export column or study documentation identifies them."
#> 
```
