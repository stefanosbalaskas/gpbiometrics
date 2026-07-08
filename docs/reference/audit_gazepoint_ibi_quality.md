# Audit IBI/RR interval quality

Audits inter-beat interval (IBI) or RR-interval values in Gazepoint
Biometrics-style exports. This helper deliberately does not use raw
`HRV` columns as HRV metrics. HRV-style summaries should be derived only
from genuine IBI/RR interval columns.

## Usage

``` r
audit_gazepoint_ibi_quality(
  data,
  ibi_col = NULL,
  group_cols = NULL,
  time_col = NULL,
  unit = c("auto", "milliseconds", "seconds"),
  min_ibi_ms = 300,
  max_ibi_ms = 2000,
  max_jump_ms = 500
)
```

## Arguments

- data:

  A data frame.

- ibi_col:

  Optional IBI/RR interval column. If `NULL`, the function detects
  recognised IBI/RR-style column names.

- group_cols:

  Optional grouping columns, such as participant, trial, stimulus,
  condition, or window labels.

- time_col:

  Optional time/order column used to order samples before
  successive-difference checks.

- unit:

  Unit of the IBI values. `"auto"` treats median values below 10 as
  seconds and larger values as milliseconds.

- min_ibi_ms:

  Minimum plausible IBI in milliseconds.

- max_ibi_ms:

  Maximum plausible IBI in milliseconds.

- max_jump_ms:

  Maximum plausible absolute change between successive IBI values within
  a group.

## Value

A list with `overview`, `samples`, `group_summary`, and `settings`.

## Examples

``` r
df <- data.frame(
  USER = rep(c("P1", "P2"), each = 4),
  IBI = c(800, 810, 790, 805, 900, 910, 905, 920)
)
audit_gazepoint_ibi_quality(df, group_cols = "USER")
#> $overview
#>   n_rows ibi_column         unit group_column_count n_missing_ibi
#> 1      8        IBI milliseconds                  1             0
#>   n_nonfinite_ibi n_nonpositive_ibi n_below_min_ibi n_above_max_ibi
#> 1               0                 0               0               0
#>   n_large_jump_ibi n_valid_ibi valid_ibi_rate n_quality_flagged
#> 1                0           8              1                 0
#>   quality_flag_rate         status
#> 1                 0 ibi_quality_ok
#>
#> $samples
#>   row_id group ibi_raw ibi_ms missing_ibi nonfinite_ibi nonpositive_ibi
#> 1      1    P1     800    800       FALSE         FALSE           FALSE
#> 2      2    P1     810    810       FALSE         FALSE           FALSE
#> 3      3    P1     790    790       FALSE         FALSE           FALSE
#> 4      4    P1     805    805       FALSE         FALSE           FALSE
#> 5      5    P2     900    900       FALSE         FALSE           FALSE
#> 6      6    P2     910    910       FALSE         FALSE           FALSE
#> 7      7    P2     905    905       FALSE         FALSE           FALSE
#> 8      8    P2     920    920       FALSE         FALSE           FALSE
#>   below_min_ibi above_max_ibi large_jump_ibi valid_ibi any_quality_flag
#> 1         FALSE         FALSE          FALSE      TRUE            FALSE
#> 2         FALSE         FALSE          FALSE      TRUE            FALSE
#> 3         FALSE         FALSE          FALSE      TRUE            FALSE
#> 4         FALSE         FALSE          FALSE      TRUE            FALSE
#> 5         FALSE         FALSE          FALSE      TRUE            FALSE
#> 6         FALSE         FALSE          FALSE      TRUE            FALSE
#> 7         FALSE         FALSE          FALSE      TRUE            FALSE
#> 8         FALSE         FALSE          FALSE      TRUE            FALSE
#>      status
#> 1 valid_ibi
#> 2 valid_ibi
#> 3 valid_ibi
#> 4 valid_ibi
#> 5 valid_ibi
#> 6 valid_ibi
#> 7 valid_ibi
#> 8 valid_ibi
#>
#> $group_summary
#>   group n_rows n_valid_ibi valid_ibi_rate n_quality_flagged quality_flag_rate
#> 1    P1      4           4              1                 0                 0
#> 2    P2      4           4              1                 0                 0
#>   mean_ibi_ms median_ibi_ms mean_hr_bpm  sdnn_ms rmssd_ms pnn50         status
#> 1      801.25         802.5    74.88940 8.539126 15.54563     0 sufficient_ibi
#> 2      908.75         907.5    66.02912 8.539126 10.80123     0 sufficient_ibi
#>
#> $settings
#> $settings$ibi_col
#> [1] "IBI"
#>
#> $settings$group_cols
#> [1] "USER"
#>
#> $settings$time_col
#> NULL
#>
#> $settings$unit
#> [1] "auto"
#>
#> $settings$resolved_unit
#> [1] "milliseconds"
#>
#> $settings$min_ibi_ms
#> [1] 300
#>
#> $settings$max_ibi_ms
#> [1] 2000
#>
#> $settings$max_jump_ms
#> [1] 500
#>
#> $settings$note
#> [1] "IBI quality and HRV-style summaries are based only on the selected IBI/RR interval column, not on raw HRV validity/vendor columns."
#>
#>
```
