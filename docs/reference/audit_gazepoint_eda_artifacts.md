# Audit Gazepoint EDA/GSR artifacts

Flags row-level artifacts in Gazepoint electrodermal activity signals,
preferring `GSR_US` conductance when available. The helper detects
abrupt jumps, abrupt slopes, flatline runs, zero runs, negative
conductance values, and optional out-of-range values. It is a
conservative preprocessing/QC helper and does not interpret EDA as
emotional valence.

## Usage

``` r
audit_gazepoint_eda_artifacts(
  data,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  prefer_gsr_us = TRUE,
  jump_threshold_sd = 6,
  slope_threshold_sd = 6,
  flat_run_length = 20,
  zero_run_length = 20,
  saturation_min = NULL,
  saturation_max = NULL,
  negative_allowed = NULL
)
```

## Arguments

- data:

  A data frame containing Gazepoint biometric rows.

- signal_col:

  Optional EDA/GSR signal column. If `NULL`, the function prefers
  `GSR_US` and then falls back to common Gazepoint EDA columns.

- time_col:

  Optional time/counter column. If `NULL`, common Gazepoint time columns
  are detected automatically.

- group_cols:

  Optional grouping columns. If `NULL`, available
  source/participant/media/trial-like columns are used.

- prefer_gsr_us:

  Logical. If `TRUE`, prefer `GSR_US` when `signal_col` is not supplied.

- jump_threshold_sd:

  Robust z threshold for absolute signal jumps.

- slope_threshold_sd:

  Robust z threshold for absolute signal slopes.

- flat_run_length:

  Minimum repeated-value run length flagged as flatline.

- zero_run_length:

  Minimum zero-value run length flagged as zero run.

- saturation_min:

  Optional lower bound for acceptable signal values.

- saturation_max:

  Optional upper bound for acceptable signal values.

- negative_allowed:

  Optional logical. If `NULL`, negative values are allowed for phasic
  component columns but not for conductance-like columns.

## Value

A list with `overview`, `row_flags`, `artifact_runs`, `group_summary`,
and `settings`.
