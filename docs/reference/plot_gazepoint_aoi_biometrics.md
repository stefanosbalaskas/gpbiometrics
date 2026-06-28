# Plot AOI-linked biometric summaries

Plots AOI-biometric summary values as a ggplot object.

## Usage

``` r
plot_gazepoint_aoi_biometrics(
  x,
  value_col = "mean_value",
  aoi_col = "aoi_label",
  signal_col = "signal",
  group_col = NULL,
  plot_type = c("boxplot", "point", "line"),
  title = NULL
)
```

## Arguments

- x:

  A `gazepoint_aoi_biometrics_summary`,
  `gazepoint_aoi_biometrics_model_data`, or data frame.

- value_col:

  Value column to plot.

- aoi_col:

  AOI label column.

- signal_col:

  Signal label column.

- group_col:

  Optional grouping column.

- plot_type:

  `"boxplot"`, `"point"`, or `"line"`.

- title:

  Optional plot title.

## Value

A ggplot object with plot data stored in attributes.
