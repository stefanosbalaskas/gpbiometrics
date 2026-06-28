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
#> Error in compute_gazepoint_engagement_index(c(20, 60, 80), time = 1:3): could not find function "compute_gazepoint_engagement_index"
```
