# Plot signal-quality diagnostics

Creates a lightweight ggplot diagnostic for signal-quality metrics or
labels. The plot is intended for quality control and audit reporting
only.

## Usage

``` r
plot_gazepoint_signal_quality(
  quality,
  metric = "prop_missing",
  x = NULL,
  colour = NULL,
  facet = NULL
)
```

## Arguments

- quality:

  A data frame returned by
  [`compute_gazepoint_signal_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/compute_gazepoint_signal_quality.md)
  or
  [`classify_gazepoint_signal_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/classify_gazepoint_signal_quality.md).

- metric:

  Metric to plot. Use `"quality_label"` for label counts.

- x:

  Optional x-axis column. If omitted, the function uses the first
  available column among participant, participant_id, trial, trial_id,
  segment, segment_id, session, or signal.

- colour:

  Optional colour/grouping column.

- facet:

  Optional faceting column. Defaults to `"signal"` when available.

## Value

A ggplot object.
