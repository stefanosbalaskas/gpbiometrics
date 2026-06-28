# Audit Gazepoint biometric signal activity

Screens biometric signal columns for missingness, all-zero channels,
constant values, low variation, and active signal presence within
groups. This helper is designed to identify inactive files or channels
before event-level EDA, HR, IBI, or multimodal analysis.

## Usage

``` r
audit_gazepoint_signal_activity(
  data,
  signal_cols = NULL,
  group_cols = NULL,
  zero_is_inactive = TRUE,
  min_unique_nonzero = 2,
  missing_as_inactive = TRUE
)
```

## Arguments

- data:

  A data frame containing Gazepoint biometric rows.

- signal_cols:

  Optional signal columns. If `NULL`, common Gazepoint biometric columns
  are detected automatically.

- group_cols:

  Optional grouping columns. If `NULL`, available source, participant,
  media, or trial columns are used.

- zero_is_inactive:

  Logical. If `TRUE`, all-zero signals are labelled as inactive.

- min_unique_nonzero:

  Minimum number of distinct non-zero finite values required for an
  `"active"` status.

- missing_as_inactive:

  Logical. If `TRUE`, all-missing signals are labelled as
  insufficient/inactive.

## Value

A list with `overview`, `signal_by_group`, `inactive_groups`,
`inactive_signals`, and `settings`.
