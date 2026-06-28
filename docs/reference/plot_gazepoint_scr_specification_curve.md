# Plot an SCR specification curve

Plots a specification-curve style display from the output of
[`run_gazepoint_scr_multiverse()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_scr_multiverse.md)
or from a compatible data frame.

## Usage

``` r
plot_gazepoint_scr_specification_curve(
  x,
  estimate_col = NULL,
  specification_col = "specification_id",
  add_zero_line = TRUE,
  main = "SCR specification curve"
)
```

## Arguments

- x:

  Output from
  [`run_gazepoint_scr_multiverse()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_scr_multiverse.md)
  or a data frame.

- estimate_col:

  Column to rank and plot. Defaults to `"mean_response_amplitude"` when
  available, otherwise `"response_rate"`.

- specification_col:

  Specification identifier column.

- add_zero_line:

  Logical. If `TRUE`, draw a horizontal zero line.

- main:

  Plot title.

## Value

Invisibly returns a list with plot data and settings.
