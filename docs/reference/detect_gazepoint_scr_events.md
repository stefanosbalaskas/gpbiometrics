# Detect SCR-like events in Gazepoint GSR/EDA data

Detects simple SCR-like peaks from a phasic EDA signal. If a phasic
column is not supplied, the function first creates a descriptive phasic
component using
[`decompose_gazepoint_eda()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/decompose_gazepoint_eda.md).
This helper is intended for exploratory quality control and descriptive
summaries, not as a replacement for specialised SCR detection pipelines.

## Usage

``` r
detect_gazepoint_scr_events(
  data,
  phasic_col = NULL,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  threshold = NULL,
  min_peak_distance = 10L,
  window_size = 31L
)
```

## Arguments

- data:

  A data frame.

- phasic_col:

  Optional phasic EDA column.

- signal_col:

  Optional raw/conductance EDA column used when `phasic_col` is not
  supplied.

- time_col:

  Optional time/order column.

- group_cols:

  Optional grouping columns.

- threshold:

  Optional numeric detection threshold. If `NULL`, a robust
  group-specific threshold is estimated as median plus three MADs,
  bounded below by zero.

- min_peak_distance:

  Minimum distance between retained peaks in samples.

- window_size:

  Rolling-median window size used if decomposition is needed.

## Value

A list with `overview`, `events`, `group_summary`, and `settings`.

## Examples

``` r
df <- data.frame(
  CNT = 1:20,
  GSR_US_PHASIC = c(rep(0, 5), 0.2, 0.8, 0.2, rep(0, 12))
)
detect_gazepoint_scr_events(df, phasic_col = "GSR_US_PHASIC", time_col = "CNT")
#> $overview
#>   n_rows group_count    phasic_col decomposition_used threshold
#> 1     20           1 GSR_US_PHASIC              FALSE        NA
#>   min_peak_distance n_events              status
#> 1                10        1 scr_events_detected
#>
#> $events
#>   event_id group row_index time peak_value threshold    phasic_col
#> 1        1   all         7    7        0.8 0.5540283 GSR_US_PHASIC
#>             detection_method
#> 1 local_peak_above_threshold
#>
#> $group_summary
#>   group n_samples threshold n_events event_rate_per_1000_samples
#> 1   all        20 0.5540283        1                          50
#>
#> $settings
#> $settings$phasic_col
#> [1] "GSR_US_PHASIC"
#>
#> $settings$signal_col
#> NULL
#>
#> $settings$time_col
#> [1] "CNT"
#>
#> $settings$group_cols
#> NULL
#>
#> $settings$threshold
#> NULL
#>
#> $settings$min_peak_distance
#> [1] 10
#>
#> $settings$window_size
#> [1] 31
#>
#> $settings$note
#> [1] "SCR events are simple SCR-like local peaks. Use specialised biosignal software for confirmatory SCR event detection."
#>
#>
#> attr(,"class")
#> [1] "gazepoint_scr_events" "list"
```
