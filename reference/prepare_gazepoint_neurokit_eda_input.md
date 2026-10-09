# Prepare Gazepoint EDA input for NeuroKit2-style workflows

Prepares EDA/GSR signal tables for optional external NeuroKit2
processing. This helper does not require Python or NeuroKit2.

## Usage

``` r
prepare_gazepoint_neurokit_eda_input(
  data,
  eda_col = "GSR_US",
  time_col = NULL,
  group_cols = NULL,
  sampling_rate = NULL,
  output_dir = NULL,
  prefix = "gazepoint_neurokit_eda"
)
```

## Arguments

- data:

  A Gazepoint biometric data frame.

- eda_col:

  EDA/GSR signal column.

- time_col:

  Optional time/counter column.

- group_cols:

  Optional grouping columns.

- sampling_rate:

  Optional sampling rate in Hz.

- output_dir:

  Optional directory where per-group CSV files are written.

- prefix:

  File prefix used when `output_dir` is supplied.

## Value

A list with `overview`, `eda_table`, `group_summary`, `manifest`, and
`settings`.
