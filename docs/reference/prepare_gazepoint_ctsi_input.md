# Prepare Gazepoint EDA data for CTSI sparse deconvolution workflows

Prepares signal, event, and configuration tables for downstream
continuous-time system identification (CTSI) sparse EDA deconvolution
workflows. This function does not implement the full Amin-Faghih CTSI
solver in R. It creates reproducible input objects and optional CSV
files for external CTSI implementations.

## Usage

``` r
prepare_gazepoint_ctsi_input(
  dat,
  eda_col = "GSR_US",
  time_col = "CNT",
  group_cols = NULL,
  event_onset_col = NULL,
  event_name_col = NULL,
  sampling_rate = NULL,
  tau0_range = c(2, 4),
  tau1_range = c(0.5, 1),
  sparsity_grid = c(0.001, 0.01, 0.1, 1),
  output_dir = NULL,
  prefix = "gazepoint_ctsi"
)
```

## Arguments

- dat:

  A data frame containing EDA data.

- eda_col:

  Numeric EDA/conductance column.

- time_col:

  Numeric time column.

- group_cols:

  Optional grouping columns, such as participant/session.

- event_onset_col:

  Optional event onset column.

- event_name_col:

  Optional event/condition column.

- sampling_rate:

  Optional sampling rate in Hz.

- tau0_range:

  Candidate slow time-constant range.

- tau1_range:

  Candidate fast time-constant range.

- sparsity_grid:

  Candidate sparsity penalties.

- output_dir:

  Optional directory for CSV export.

- prefix:

  Output file prefix.

## Value

A list with `overview`, `signal_table`, `event_table`, `ctsi_config`,
`ctsi_notes`, `written_files`, and `settings`.
