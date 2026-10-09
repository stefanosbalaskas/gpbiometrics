# Run a final real-data readiness gate for Gazepoint biometrics data

Provides conservative pass/warn/fail checks before using real Gazepoint
Biometrics exports for analysis or reporting. The function checks basic
row count, signal availability, missingness, time ordering, TTL
availability, and HRV/IBI caution status. It does not certify data
quality or infer emotional states.

## Usage

``` r
run_gazepoint_biometrics_real_data_readiness(
  data = NULL,
  workflow_result = NULL,
  min_rows = 100,
  min_active_signal_count = 1,
  max_missing_prop = 0.5,
  required_signal_cols = NULL,
  require_gsr_us_preferred = TRUE,
  require_ibi_for_hrv = FALSE,
  time_col = NULL,
  ttl_cols = NULL
)
```

## Arguments

- data:

  A biometric data frame. If `NULL`, the function tries to extract a
  data frame from `workflow_result`.

- workflow_result:

  Optional workflow/list object containing biometric data.

- min_rows:

  Minimum number of rows expected for a usable real-data check.

- min_active_signal_count:

  Minimum number of biometric signal columns with at least one
  non-missing/non-zero value.

- max_missing_prop:

  Maximum acceptable missing proportion for detected signal columns
  before a warning is raised.

- required_signal_cols:

  Optional signal columns that must be present.

- require_gsr_us_preferred:

  Logical. If `TRUE`, warns when `GSR_US` is absent but `GSR` is
  present.

- require_ibi_for_hrv:

  Logical. If `TRUE`, fails when HRV is present but IBI is absent. If
  `FALSE`, this condition is reported as a warning.

- time_col:

  Optional time column. If `NULL`, common time columns are detected
  automatically.

- ttl_cols:

  Optional TTL marker columns. If `NULL`, `ttl_marker` or `TTL0`-`TTL6`
  are detected automatically.

## Value

A list with `overview`, `checks`, `signal_summary`, and `settings`.
