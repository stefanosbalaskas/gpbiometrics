# Plot Gazepoint biometric signal activity

Plots signal-activity summaries produced by
[`audit_gazepoint_signal_activity()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_signal_activity.md),
or computes them from a biometric data frame. The plot is intended for
quality-control review of signal availability, missingness, zero
activity, and basic activity status. It does not infer emotion, valence,
cognition, preference, trust, or physiological diagnosis.

## Usage

``` r
plot_gazepoint_signal_activity(
  data,
  signal_cols = NULL,
  group_cols = NULL,
  metric = c("active_signal", "nonzero_prop", "missing_prop", "n_unique_finite"),
  max_groups = 30,
  title = NULL
)
```

## Arguments

- data:

  A Gazepoint biometric data frame, or an
  [`audit_gazepoint_signal_activity()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_signal_activity.md)
  result.

- signal_cols:

  Optional signal columns used when `data` is a raw data frame.

- group_cols:

  Optional grouping columns used when `data` is a raw data frame.

- metric:

  Summary metric to plot.

- max_groups:

  Maximum number of groups to display.

- title:

  Optional plot title.

## Value

A ggplot object with the package plot contract attached.
