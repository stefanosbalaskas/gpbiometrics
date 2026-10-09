# Compute engagement-dial summary indices

Summarizes a continuous engagement-dial signal, typically scaled from 0
to 100, into interpretable behavioral indices such as mean engagement,
percent time above threshold, volatility, and area under the curve.

## Usage

``` r
compute_gazepoint_engagement_index(
  dial,
  time = NULL,
  threshold = 50,
  group = NULL,
  return = c("data", "scalar")
)
```

## Arguments

- dial:

  Numeric engagement-dial values.

- time:

  Optional time vector.

- threshold:

  Engagement threshold.

- group:

  Optional grouping vector for grouped summaries.

- return:

  `"data"` for a one-row data frame per group, or `"scalar"` for percent
  time above threshold.

## Value

Data frame of engagement metrics or a scalar.

## Examples

``` r
compute_gazepoint_engagement_index(c(20, 60, 80), time = 1:3)
#>   group n_samples n_valid duration_s mean_engagement median_engagement
#> 1   all         3       3          2        53.33333                60
#>   sd_engagement min_engagement max_engagement percent_time_above_threshold
#> 1       30.5505             20             80                           50
#>   volatility auc_engagement
#> 1         30            110
```
