# Prepare Gazepoint EDA input for external cvxEDA-style workflows

Prepares a clean Gazepoint EDA/conductance time-series table that can be
exported for external cvxEDA-style workflows. This function does not run
a native cvxEDA solver and does not attempt to reproduce cvxEDA
internally.

## Usage

``` r
prepare_gazepoint_cvxeda_input(
  data,
  eda_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate = NULL,
  time_unit = c("auto", "ms", "seconds", "samples"),
  convert_resistance_to_us = FALSE,
  min_finite_prop = 0.5,
  output_dir = NULL,
  prefix = "gazepoint_cvxeda"
)
```

## Arguments

- data:

  A Gazepoint biometric data frame, or a list containing one.

- eda_col:

  Optional EDA/conductance column. If omitted, the function prefers
  `GSR_US` when available.

- time_col:

  Optional time/counter column.

- group_cols:

  Optional grouping columns.

- sampling_rate:

  Optional sampling rate in Hz, used when the time column is a sample
  counter.

- time_unit:

  Unit of `time_col`.

- convert_resistance_to_us:

  If `TRUE`, convert a selected resistance-like `GSR` column to
  microsiemens as `1,000,000 / GSR`. The default is `FALSE` because this
  conversion should be used only when the user has verified that `GSR`
  is resistance-like and `GSR_US` is unavailable.

- min_finite_prop:

  Minimum finite proportion required for a group to be labelled ready.

- output_dir:

  Optional folder where CSV files should be written.

- prefix:

  File prefix used when `output_dir` is supplied.

## Value

A list with `overview`, `signal_table`, `group_summary`, `manifest`, and
`settings`.
