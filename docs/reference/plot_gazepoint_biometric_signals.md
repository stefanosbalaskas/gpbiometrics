# Plot Gazepoint biometric signal time series

Plots one or more Gazepoint biometric signals using base R graphics and
returns the plotted data and signal summary. The helper is intentionally
descriptive and does not infer emotional valence, cognition, or HRV from
raw biometric columns.

## Usage

``` r
plot_gazepoint_biometric_signals(
  data,
  signal_cols = NULL,
  time_col = NULL,
  group_col = NULL,
  max_points = 5000L,
  standardize = FALSE,
  type = c("line", "points", "both"),
  main = NULL,
  xlab = NULL,
  ylab = NULL,
  legend = TRUE,
  plot = TRUE,
  ...
)
```

## Arguments

- data:

  A data frame.

- signal_cols:

  Optional character vector of signal columns. If `NULL`, common
  Gazepoint biometric signal columns are detected.

- time_col:

  Optional time/order column for the x-axis. If `NULL`, row number is
  used.

- group_col:

  Optional grouping column recorded in the returned overview. The
  current plotting implementation overlays the selected rows rather than
  faceting by group.

- max_points:

  Maximum number of rows to plot. Large data are evenly downsampled for
  display only; returned summaries still describe the input signal
  columns.

- standardize:

  Logical. Should each signal be z-standardised before plotting? This is
  useful when signals are on different scales.

- type:

  Plot type: `"line"`, `"points"`, or `"both"`.

- main:

  Optional plot title.

- xlab:

  Optional x-axis label.

- ylab:

  Optional y-axis label.

- legend:

  Logical. Should a legend be drawn when more than one signal is
  plotted?

- plot:

  Logical. If `FALSE`, no plot is drawn and only the plot object is
  returned.

- ...:

  Additional arguments passed to
  [`matplot()`](https://rdrr.io/r/graphics/matplot.html).

## Value

A list with `overview`, `plot_data`, `signal_summary`, and `settings`.

## Examples

``` r
df <- data.frame(
  CNT = 1:5,
  GSR = c(1, 1.1, 1.2, 1.1, 1),
  HR = c(70, 71, 72, 71, 70)
)
plot_gazepoint_biometric_signals(df, time_col = "CNT", plot = FALSE)
#> $overview
#>   n_rows plotted_rows signal_column_count time_col group_col group_count
#> 1      5            5                   2      CNT      <NA>          NA
#>   standardize plot_created               status
#> 1       FALSE        FALSE signal_plot_prepared
#>
#> $plot_data
#>   .row_id .x GSR HR
#> 1       1  1 1.0 70
#> 2       2  2 1.1 71
#> 3       3  3 1.2 72
#> 4       4  4 1.1 71
#> 5       5  5 1.0 70
#>
#> $signal_summary
#>   column signal_type n n_missing missing_rate n_non_missing n_finite
#> 1    GSR     gsr_eda 5         0            0             5        5
#> 2     HR  heart_rate 5         0            0             5        5
#>   finite_rate n_unique_finite  mean median       sd min  max        status
#> 1           1               3  1.08    1.1 0.083666   1  1.2 active_signal
#> 2           1               3 70.80   71.0 0.836660  70 72.0 active_signal
#>
#> $settings
#> $settings$signal_cols
#> [1] "GSR" "HR"
#>
#> $settings$time_col
#> [1] "CNT"
#>
#> $settings$group_col
#> NULL
#>
#> $settings$max_points
#> [1] 5000
#>
#> $settings$standardize
#> [1] FALSE
#>
#> $settings$type
#> [1] "line"
#>
#> $settings$note
#> [1] "Signal plots describe biometric time-series patterns only; they do not establish emotional valence, cognition, or HRV."
#>
#>
#> attr(,"class")
#> [1] "gazepoint_biometric_signal_plot" "list"
```
