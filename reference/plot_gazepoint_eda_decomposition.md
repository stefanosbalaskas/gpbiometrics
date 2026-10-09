# Plot Gazepoint EDA decomposition channels

Plots available EDA/GSR decomposition channels, typically `GSR_US`,
`GSR_US_TONIC`, and `GSR_US_PHASIC`, as a ggplot object.

## Usage

``` r
plot_gazepoint_eda_decomposition(
  data,
  time_col = NULL,
  signal_cols = NULL,
  group_cols = NULL,
  standardise = FALSE,
  max_points = 5000,
  title = NULL
)
```

## Arguments

- data:

  A Gazepoint biometric data frame or list containing a data frame.

- time_col:

  Optional time/counter column.

- signal_cols:

  Optional signal columns to plot.

- group_cols:

  Optional grouping columns used for facets.

- standardise:

  Logical. If `TRUE`, standardise each signal to z-scores.

- max_points:

  Maximum number of rows retained after simple downsampling.

- title:

  Optional plot title.

## Value

A ggplot object with plot data stored in attributes.
