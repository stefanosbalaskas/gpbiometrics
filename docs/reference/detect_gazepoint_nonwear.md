# Detect long signal-dropout intervals

Flags long missing, zero, constant, or low-variance runs in selected
signal columns. The function is intended for quality control and audit
reporting only. It does not remove samples and does not make
physiological, psychological, diagnostic, or clinical claims.

## Usage

``` r
detect_gazepoint_nonwear(
  data,
  signal_cols,
  group_cols = NULL,
  time_col = NULL,
  min_run_length = 10,
  zero_tolerance = 0,
  constant_tolerance = 0,
  low_variance_threshold = NULL,
  detect_missing = TRUE,
  detect_zero = TRUE,
  detect_constant = TRUE,
  detect_low_variance = TRUE
)
```

## Arguments

- data:

  A data frame.

- signal_cols:

  Character vector of numeric signal columns to inspect.

- group_cols:

  Optional character vector of grouping columns, such as participant,
  trial, session, or condition.

- time_col:

  Optional numeric time column used to report interval start and end
  times.

- min_run_length:

  Minimum number of consecutive samples required for a run to be
  reported.

- zero_tolerance:

  Absolute tolerance used when detecting zero-valued runs.

- constant_tolerance:

  Absolute adjacent-difference tolerance used when detecting constant
  runs.

- low_variance_threshold:

  Optional standard-deviation threshold for low-variance windows. If
  `NULL`, low-variance detection is skipped.

- detect_missing:

  Logical. If `TRUE`, detect non-finite runs.

- detect_zero:

  Logical. If `TRUE`, detect near-zero runs.

- detect_constant:

  Logical. If `TRUE`, detect constant runs.

- detect_low_variance:

  Logical. If `TRUE`, detect low-variance windows when
  `low_variance_threshold` is supplied.

## Value

A list with class `gazepoint_nonwear_detection`, containing interval and
summary tables.
