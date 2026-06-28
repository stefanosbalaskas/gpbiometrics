# Audit distributional drift across sessions or ordered blocks

Compares signal distributions across sessions/blocks using
baseline-vs-current differences, Kolmogorov-Smirnov tests, and
Population Stability Index (PSI).

## Usage

``` r
audit_gazepoint_distributional_drift(
  dat,
  signal_cols,
  session_col = "session",
  participant_col = NULL,
  reference_session = NULL,
  bins = 10,
  psi_warn = 0.1,
  psi_fail = 0.25
)
```

## Arguments

- dat:

  A data frame containing longitudinal biometric data.

- signal_cols:

  Numeric signal columns to audit.

- session_col:

  Session/block/timepoint column.

- participant_col:

  Optional participant column.

- reference_session:

  Optional reference session. If `NULL`, the first ordered session is
  used within each participant/global group.

- bins:

  Number of bins for PSI.

- psi_warn:

  PSI threshold for warning.

- psi_fail:

  PSI threshold for failure.

## Value

A list with `overview`, `drift_summary`, and `settings`.
