# Standardise a Gazepoint plot return contract

Adds consistent attributes to a ggplot object so plotting helpers can be
tested and reused in automated reports.

## Usage

``` r
standardise_gazepoint_plot_contract(
  plot,
  plot_data = NULL,
  settings = list(),
  interpretation_notes = NULL,
  plot_type = NULL
)
```

## Arguments

- plot:

  A ggplot object.

- plot_data:

  Optional data frame used to create the plot.

- settings:

  Optional list of plot settings.

- interpretation_notes:

  Optional character vector of interpretation notes.

- plot_type:

  Optional short plot-type label.

## Value

A ggplot object with standardized attributes.
