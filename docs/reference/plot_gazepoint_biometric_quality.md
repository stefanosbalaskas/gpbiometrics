# Plot Gazepoint biometric quality indicators

Plots and summarises biometric quality indicators such as dropout flags,
validity flags, missingness flags, and quality/audit flags. When no
explicit quality columns are available, the function can derive
missingness indicators from detected biometric signal columns.

## Usage

``` r
plot_gazepoint_biometric_quality(
  data,
  quality_cols = NULL,
  signal_cols = NULL,
  time_col = NULL,
  group_col = NULL,
  dropout_prefix = "biometric_dropout",
  max_points = 5000L,
  main = NULL,
  plot = TRUE,
  ...
)
```

## Arguments

- data:

  A data frame.

- quality_cols:

  Optional quality/flag columns. If `NULL`, likely quality columns are
  detected from names and types.

- signal_cols:

  Optional signal columns used to derive missingness flags when no
  quality columns are detected.

- time_col:

  Optional time/order column recorded in the returned settings.

- group_col:

  Optional grouping column for group-level quality summaries.

- dropout_prefix:

  Prefix used by dropout columns created by
  [`flag_gazepoint_biometric_dropouts()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/flag_gazepoint_biometric_dropouts.md).

- max_points:

  Maximum number of rows used for row-level returned plot data.

- main:

  Optional plot title.

- plot:

  Logical. If `FALSE`, no plot is drawn.

- ...:

  Additional arguments passed to
  [`barplot()`](https://rdrr.io/r/graphics/barplot.html).

## Value

A list with `overview`, `quality_summary`, `group_summary`, `plot_data`,
and `settings`.

## Examples

``` r
df <- data.frame(
  CNT = 1:5,
  GSR = c(1, NA, 1.2, 1.1, NA),
  HR_valid = c(1, 1, 0, 1, 1)
)
plot_gazepoint_biometric_quality(df, signal_cols = "GSR", plot = FALSE)
#> $overview
#>   n_rows plotted_rows quality_column_count group_col group_count
#> 1      5            5                    1      <NA>          NA
#>   derived_from_signals plot_created                status
#> 1                FALSE        FALSE quality_flags_present
#> 
#> $quality_summary
#>     column n n_flagged flag_rate n_missing missing_rate         source
#> 1 HR_valid 5         1       0.2         0            0 quality_column
#> 
#> $group_summary
#> [1] group     column    n         n_flagged flag_rate source   
#> <0 rows> (or 0-length row.names)
#> 
#> $plot_data
#>   .row_id HR_valid
#> 1       1        1
#> 2       2        1
#> 3       3        0
#> 4       4        1
#> 5       5        1
#> 
#> $settings
#> $settings$quality_cols
#> [1] "HR_valid"
#> 
#> $settings$signal_cols
#> [1] "GSR"
#> 
#> $settings$time_col
#> NULL
#> 
#> $settings$group_col
#> NULL
#> 
#> $settings$dropout_prefix
#> [1] "biometric_dropout"
#> 
#> $settings$max_points
#> [1] 5000
#> 
#> $settings$derived_from_signals
#> [1] FALSE
#> 
#> $settings$note
#> [1] "Quality plots summarise availability, validity, dropout, or missingness indicators; they are not physiological interpretations."
#> 
#> 
#> attr(,"class")
#> [1] "gazepoint_biometric_quality_plot" "list"                            
```
