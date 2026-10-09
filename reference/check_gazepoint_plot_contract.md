# Check a Gazepoint plot return contract

Checks whether an object follows the package's plotting return
convention.

## Usage

``` r
check_gazepoint_plot_contract(
  plot,
  require_plot_data = TRUE,
  require_settings = TRUE
)
```

## Arguments

- plot:

  A plot object.

- require_plot_data:

  Logical. If `TRUE`, `plot_data` must be present.

- require_settings:

  Logical. If `TRUE`, `settings` must be present.

## Value

A list with `overview`, `checks`, `plot_data`, and `settings`.
