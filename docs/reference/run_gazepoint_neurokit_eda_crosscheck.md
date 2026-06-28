# Optionally run a NeuroKit2 EDA cross-check

Optionally calls Python/NeuroKit2 on prepared EDA input. By default,
`execute = FALSE`, so no external dependency is required.

## Usage

``` r
run_gazepoint_neurokit_eda_crosscheck(
  data,
  eda_col = "GSR_US",
  time_col = NULL,
  group_cols = NULL,
  sampling_rate = NULL,
  execute = FALSE,
  python = "python",
  output_dir = tempdir(),
  prefix = "gazepoint_neurokit_crosscheck",
  keep_files = FALSE
)
```

## Arguments

- data:

  A Gazepoint biometric data frame or `gazepoint_neurokit_eda_input`
  object.

- eda_col:

  EDA/GSR signal column, used when `data` is a data frame.

- time_col:

  Optional time/counter column.

- group_cols:

  Optional grouping columns.

- sampling_rate:

  Sampling rate in Hz required for NeuroKit2 execution.

- execute:

  Logical. If `FALSE`, only prepare input and return skipped status.

- python:

  Python executable.

- output_dir:

  Directory for temporary/input/output files.

- prefix:

  File prefix.

- keep_files:

  Logical. If `FALSE`, temporary files produced during execution may be
  removed.

## Value

A list with `overview`, `prepared_input`, `crosscheck_summary`,
`manifest`, and `settings`.
