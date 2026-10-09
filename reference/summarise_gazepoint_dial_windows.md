# Summarise Gazepoint engagement-dial windows

Compatibility wrapper for
[`summarise_gazepoint_engagement_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_engagement_windows.md).
This helper uses the term "dial" for users who refer to Gazepoint
engagement-dial or self-reported engagement streams, while delegating
the calculation to the canonical engagement-window summariser.

## Usage

``` r
summarise_gazepoint_dial_windows(data, ..., dial_col = NULL)
```

## Arguments

- data:

  A data frame containing Gazepoint Biometrics engagement/dial data.

- ...:

  Additional arguments passed to
  [`summarise_gazepoint_engagement_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_engagement_windows.md).

- dial_col:

  Optional dial/engagement column. When supplied, it is mapped to the
  corresponding value-column argument of the underlying helper.

## Value

The output of
[`summarise_gazepoint_engagement_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_engagement_windows.md).

## Examples

``` r
df <- data.frame(
  USER = rep(c("P1", "P2"), each = 3),
  DIAL = c(40, 45, 50, 55, 60, 65)
)
summarise_gazepoint_dial_windows(df)
#>   window          signal value_column validity_column n_rows usable_rows
#> 1    all engagement_dial         DIAL            <NA>      6           6
#>   usable_pct missing_rows zero_rows mean_value median_value sd_value min_value
#> 1        100            0         0       52.5         52.5 9.354143        40
#>   max_value first_value last_value change_value
#> 1        65          40         65           25
```
