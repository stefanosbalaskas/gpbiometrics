# Summarise time-domain HRV features from Gazepoint IBI/RR intervals

Computes conservative time-domain HRV-style features from genuine
interbeat interval or RR interval columns. The raw Gazepoint `HRV`
column is not used as an HRV metric because it is treated as a
validity/vendor flag unless independently documented otherwise.

## Usage

``` r
summarise_gazepoint_hrv_features(
  data,
  ibi_col = NULL,
  group_cols = NULL,
  time_col = NULL,
  ibi_unit = c("auto", "seconds", "milliseconds"),
  min_ibi_ms = 300,
  max_ibi_ms = 2000,
  min_valid_ibi = 3L
)
```

## Arguments

- data:

  A data frame.

- ibi_col:

  Optional IBI/RR interval column. If `NULL`, a likely IBI/RR column is
  detected. The raw `HRV` column is never selected automatically.

- group_cols:

  Optional grouping columns, such as participant, stimulus, trial, or
  window.

- time_col:

  Optional time/order column used to order IBI values within each group
  before calculating successive-difference features.

- ibi_unit:

  Unit of the IBI/RR column. Use `"auto"`, `"seconds"`, or
  `"milliseconds"`.

- min_ibi_ms:

  Minimum plausible IBI in milliseconds.

- max_ibi_ms:

  Maximum plausible IBI in milliseconds.

- min_valid_ibi:

  Minimum number of valid IBI values required before a group is marked
  as having computed HRV features.

## Value

A list with `overview`, `features`, and `settings`.

## Details

The helper computes descriptive features including mean IBI, mean heart
rate derived from IBI, SDNN, RMSSD, and pNN50. It does not compute
frequency-domain HRV and does not replace specialised ECG/PPG HRV
software.

## Examples

``` r
df <- data.frame(
  participant = "P1",
  IBI = c(0.9, 1.0, 1.1, 1.0, 0.95)
)
summarise_gazepoint_hrv_features(df, group_cols = "participant")
#> $overview
#>   n_rows ibi_col group_count feature_rows groups_with_computed_features
#> 1      5     IBI           1            1                             1
#>   groups_with_insufficient_ibi total_valid_ibi                 status
#> 1                            0               5 hrv_features_available
#> 
#> $features
#>   group n_total_ibi n_missing_ibi n_out_of_range_ibi n_valid_ibi valid_ibi_rate
#> 1    P1           5             0                  0           5              1
#>   unit_detected mean_ibi_ms median_ibi_ms  sdnn_ms rmssd_ms pnn50_percent
#> 1       seconds         990          1000 74.16198 90.13878            75
#>   mean_hr_bpm_from_ibi min_ibi_ms max_ibi_ms                status
#> 1             60.60606        900       1100 hrv_features_computed
#> 
#> $settings
#> $settings$ibi_col
#> [1] "IBI"
#> 
#> $settings$group_cols
#> [1] "participant"
#> 
#> $settings$time_col
#> NULL
#> 
#> $settings$ibi_unit
#> [1] "auto"
#> 
#> $settings$min_ibi_ms
#> [1] 300
#> 
#> $settings$max_ibi_ms
#> [1] 2000
#> 
#> $settings$min_valid_ibi
#> [1] 3
#> 
#> $settings$note
#> [1] "Time-domain HRV features are derived from IBI/RR intervals only. The raw Gazepoint HRV column is treated as a validity/vendor flag."
#> 
#> 
#> attr(,"class")
#> [1] "gazepoint_hrv_features" "list"                  
```
