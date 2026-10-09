# Standardize Gazepoint plot return contracts

US-spelling compatibility wrapper around
[`standardise_gazepoint_plot_contract()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/standardise_gazepoint_plot_contract.md).
The wrapper accepts either a single ggplot object or a list of ggplot
objects. For a list of plots, `plot_data`, `settings`,
`interpretation_notes`, and `plot_type` may be supplied either as single
values applied to all plots or as same-length lists/vectors applied
elementwise.

## Usage

``` r
standardize_gazepoint_plot_contracts(
  plot,
  plot_data = NULL,
  settings = list(),
  interpretation_notes = NULL,
  plot_type = NULL
)
```

## Arguments

- plot:

  A ggplot object, or a list of ggplot objects.

- plot_data:

  Optional data frame, or a list of data frames when `plot` is a list.

- settings:

  Optional settings list, or a list of settings lists when `plot` is a
  list.

- interpretation_notes:

  Optional character vector, or a list/character vector of notes when
  `plot` is a list.

- plot_type:

  Optional plot-type label, or a character vector/list of labels when
  `plot` is a list.

## Value

A standardized ggplot object, or a list of standardized ggplot objects.
