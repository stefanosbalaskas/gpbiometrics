# Plot Gazepoint time resets and time-order flags

Plots row-level time/counter progression and flags from
[`audit_gazepoint_time_resets()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_time_resets.md),
or computes them from a biometric data frame. The plot is intended for
synchronization and file-structure QC. It does not establish causal
timing or true physiological latency.

## Usage

``` r
plot_gazepoint_time_resets(
  data,
  time_col = NULL,
  group_cols = NULL,
  max_groups = 30,
  title = NULL
)
```

## Arguments

- data:

  A Gazepoint biometric data frame, or an
  [`audit_gazepoint_time_resets()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_time_resets.md)
  result.

- time_col:

  Optional time or counter column used when `data` is a raw data frame.

- group_cols:

  Optional grouping columns used when `data` is a raw data frame.

- max_groups:

  Maximum number of groups to display.

- title:

  Optional plot title.

## Value

A ggplot object with the package plot contract attached.
