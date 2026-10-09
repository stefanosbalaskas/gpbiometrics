# Prepare Gazepoint EDA data for PsPM DCM workflows

Prepares Gazepoint EDA data and event metadata for downstream PsPM
dynamic causal modelling workflows. This function does not run PsPM or
invert a DCM model in R. It creates structured input tables and notes
for MATLAB/PsPM.

## Usage

``` r
prepare_gazepoint_pspm_dcm_input(
  dat,
  eda_col = "GSR_US",
  time_col = "CNT",
  event_onset_col = NULL,
  event_duration_col = NULL,
  event_name_col = NULL,
  participant_col = NULL,
  session_col = NULL,
  sampling_rate = NULL,
  output_dir = NULL,
  prefix = "gazepoint_pspm_dcm"
)
```

## Arguments

- dat:

  A data frame containing EDA data.

- eda_col:

  Numeric EDA/conductance column.

- time_col:

  Numeric time column.

- event_onset_col:

  Optional event onset column.

- event_duration_col:

  Optional event duration column.

- event_name_col:

  Optional event name/condition column.

- participant_col:

  Optional participant column.

- session_col:

  Optional session column.

- sampling_rate:

  Optional sampling rate in Hz.

- output_dir:

  Optional directory for CSV export.

- prefix:

  File prefix when `output_dir` is supplied.

## Value

A list with `overview`, `signal_table`, `event_table`, `pspm_notes`,
`written_files`, and `settings`.
