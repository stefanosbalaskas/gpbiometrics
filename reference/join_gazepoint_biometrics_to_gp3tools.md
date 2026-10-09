# Join Gazepoint Biometrics data to gp3tools-style eye-tracking data

Compatibility wrapper for
[`join_gazepoint_biometrics_to_master()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/join_gazepoint_biometrics_to_master.md).
This alias is provided for users who work with a gp3tools master table
and want an explicit gp3tools-facing function name. The implementation
delegates to the canonical biometric-to-master join helper.

## Usage

``` r
join_gazepoint_biometrics_to_gp3tools(biometrics, gp3tools_master, ...)
```

## Arguments

- biometrics:

  A data frame containing Gazepoint Biometrics samples or summaries.

- gp3tools_master:

  A gp3tools-style master eye-tracking data frame.

- ...:

  Additional arguments passed to
  [`join_gazepoint_biometrics_to_master()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/join_gazepoint_biometrics_to_master.md),
  including the required `by` argument when the underlying join helper
  requires explicit join columns.

## Value

The output of
[`join_gazepoint_biometrics_to_master()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/join_gazepoint_biometrics_to_master.md).

## Examples

``` r
biometrics <- data.frame(USER = rep("P1", 3), CNT = 1:3, HR = c(70, 71, 72))
master <- data.frame(USER = rep("P1", 3), CNT = 1:3, AOI = c("A", "B", "A"))
join_gazepoint_biometrics_to_gp3tools(
  biometrics,
  master,
  by = c("USER", "CNT")
)
#>   USER CNT HR
#> 1   P1   1 70
#> 2   P1   2 71
#> 3   P1   3 72
```
