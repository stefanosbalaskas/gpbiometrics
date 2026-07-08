# Summarise tonic and phasic GSR/EDA components

Creates a simple descriptive tonic/phasic decomposition of a GSR/EDA
signal. The tonic component is estimated with a rolling median, and the
phasic component is the observed signal minus the rolling-median tonic
estimate.

## Usage

``` r
summarise_gazepoint_gsr_tonic_phasic(
  data,
  gsr_col = NULL,
  group_cols = NULL,
  time_col = NULL,
  window_n = 15L,
  peak_threshold = NULL,
  output_prefix = "gsr"
)
```

## Arguments

- data:

  A data frame.

- gsr_col:

  Optional GSR/EDA column. If `NULL`, the function prefers `GSR_US`,
  then `GSR`, then other recognised GSR/EDA columns.

- group_cols:

  Optional grouping columns. Tonic/phasic values are computed separately
  within each group.

- time_col:

  Optional time column used to order rows within groups.

- window_n:

  Rolling-median window size in samples.

- peak_threshold:

  Optional phasic peak threshold. If `NULL`, a robust data-driven
  threshold is computed within each group as
  `median(phasic) + 2 * MAD(phasic)`.

- output_prefix:

  Prefix for generated columns.

## Value

A list with `data`, `summary`, and `settings`.

## Details

This is a lightweight descriptive helper, not a full
skin-conductance-response deconvolution model. It should be used for
quality checks, window summaries, and exploratory reporting unless a
study requires a specialised EDA model.

## Examples

``` r
df <- data.frame(
  CNT = 1:10,
  GSR_US = c(1, 1.1, 1.0, 1.2, 2.0, 1.3, 1.2, 1.1, 1.0, 1.1)
)
summarise_gazepoint_gsr_tonic_phasic(df, window_n = 3)
#> $data
#>    CNT GSR_US gsr_tonic gsr_phasic gsr_phasic_peak gsr_phasic_peak_threshold
#> 1    1    1.0      1.05      -0.05           FALSE                   0.14826
#> 2    2    1.1      1.00       0.10           FALSE                   0.14826
#> 3    3    1.0      1.10      -0.10           FALSE                   0.14826
#> 4    4    1.2      1.20       0.00           FALSE                   0.14826
#> 5    5    2.0      1.30       0.70            TRUE                   0.14826
#> 6    6    1.3      1.30       0.00           FALSE                   0.14826
#> 7    7    1.2      1.20       0.00           FALSE                   0.14826
#> 8    8    1.1      1.10       0.00           FALSE                   0.14826
#> 9    9    1.0      1.10      -0.10           FALSE                   0.14826
#> 10  10    1.1      1.05       0.05           FALSE                   0.14826
#>
#> $summary
#>   group n_rows source_column n_signal_finite mean_signal median_signal
#> 1   all     10        GSR_US              10         1.2           1.1
#>   mean_tonic median_tonic mean_phasic median_phasic max_phasic min_phasic
#> 1       1.14          1.1        0.06             0        0.7       -0.1
#>   positive_phasic_sum n_phasic_peaks peak_threshold
#> 1                0.85              1        0.14826
#>
#> $settings
#> $settings$gsr_col
#> [1] "GSR_US"
#>
#> $settings$group_cols
#> NULL
#>
#> $settings$time_col
#> NULL
#>
#> $settings$window_n
#> [1] 3
#>
#> $settings$peak_threshold
#> NULL
#>
#> $settings$output_prefix
#> [1] "gsr"
#>
#> $settings$tonic_col
#> [1] "gsr_tonic"
#>
#> $settings$phasic_col
#> [1] "gsr_phasic"
#>
#> $settings$peak_col
#> [1] "gsr_phasic_peak"
#>
#> $settings$threshold_col
#> [1] "gsr_phasic_peak_threshold"
#>
#> $settings$note
#> [1] "This is a descriptive rolling-median tonic/phasic decomposition, not a full EDA deconvolution model."
#>
#>
```
