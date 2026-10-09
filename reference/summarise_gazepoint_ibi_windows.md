# Summarise IBI/RR windows

Computes descriptive IBI/RR interval and simple HRV-style window
summaries from genuine inter-beat interval data. The function does not
use raw `HRV` columns as HRV metrics. It calculates metrics such as mean
IBI, mean instantaneous heart rate, SDNN, RMSSD, pNN20, and pNN50 only
from valid IBI/RR intervals.

## Usage

``` r
summarise_gazepoint_ibi_windows(
  data,
  ibi_col = NULL,
  group_cols = NULL,
  time_col = NULL,
  unit = c("auto", "milliseconds", "seconds"),
  min_ibi_ms = 300,
  max_ibi_ms = 2000,
  max_jump_ms = 500,
  exclude_large_jumps = TRUE,
  min_valid_ibi = 2L
)
```

## Arguments

- data:

  A data frame.

- ibi_col:

  Optional IBI/RR interval column. If `NULL`, the function detects
  recognised IBI/RR-style column names.

- group_cols:

  Optional grouping columns defining windows, such as participant,
  trial, stimulus, condition, or window labels.

- time_col:

  Optional time/order column used to order IBI values before
  successive-difference metrics are computed.

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

- exclude_large_jumps:

  Logical. Should intervals flagged as large jumps be excluded from the
  window summaries?

- min_valid_ibi:

  Minimum valid IBI count required for a window to be marked as
  sufficient.

## Value

A list with `overview`, `windows`, `samples`, and `settings`.

## Examples

``` r
df <- data.frame(
  USER = rep(c("P1", "P2"), each = 4),
  IBI = c(800, 810, 790, 805, 900, 910, 905, 920)
)
summarise_gazepoint_ibi_windows(df, group_cols = "USER")
#> $overview
#>   n_rows ibi_column         unit window_count sufficient_window_count
#> 1      8        IBI milliseconds            2                       2
#>   insufficient_window_count exclude_large_jumps min_valid_ibi
#> 1                         0                TRUE             2
#>                   status
#> 1 ibi_windows_summarised
#> 
#> $windows
#>   group n_rows n_ibi n_valid_ibi valid_ibi_rate n_excluded_for_quality
#> 1    P1      4     4           4              1                      0
#> 2    P2      4     4           4              1                      0
#>   duration_s mean_ibi_ms median_ibi_ms min_ibi_ms max_ibi_ms mean_hr_bpm
#> 1      3.205      801.25         802.5        790        810    74.88940
#> 2      3.635      908.75         907.5        900        920    66.02912
#>   median_hr_bpm min_hr_bpm max_hr_bpm  sdnn_ms rmssd_ms pnn20 pnn50
#> 1      74.76708   74.07407   75.94937 8.539126 15.54563     0     0
#> 2      66.11620   65.21739   66.66667 8.539126 10.80123     0     0
#>                  status
#> 1 sufficient_ibi_window
#> 2 sufficient_ibi_window
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
#>      status analysis_valid_ibi
#> 1 valid_ibi               TRUE
#> 2 valid_ibi               TRUE
#> 3 valid_ibi               TRUE
#> 4 valid_ibi               TRUE
#> 5 valid_ibi               TRUE
#> 6 valid_ibi               TRUE
#> 7 valid_ibi               TRUE
#> 8 valid_ibi               TRUE
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
#> $settings$exclude_large_jumps
#> [1] TRUE
#> 
#> $settings$min_valid_ibi
#> [1] 2
#> 
#> $settings$note
#> [1] "Window summaries are derived from genuine IBI/RR intervals only. They are not calculated from raw HRV validity/vendor columns."
#> 
#> 
```
