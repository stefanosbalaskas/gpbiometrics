# Audit a Gazepoint biometrics file before analysis

Provides a single front-door preflight audit for a Gazepoint-style
biometric export. The audit standardizes column names when requested,
reports likely modality availability, schema status, timestamp
irregularity, missingness, duplicate rows, and reviewer-facing warnings.

## Usage

``` r
audit_gazepoint_biometrics_file(
  path = NULL,
  data = NULL,
  expected_modalities = c("time", "eda", "ppg", "hr", "ibi", "pupil", "gaze", "events"),
  time_col = NULL,
  standardize = TRUE,
  include_data = FALSE,
  long_gap_s = NULL
)

# S3 method for class 'gazepoint_biometrics_audit'
print(x, ...)

# S3 method for class 'gazepoint_biometrics_audit'
summary(object, ...)
```

## Arguments

- path:

  Optional CSV/TSV file path.

- data:

  Optional data frame. If supplied, it is used instead of `path`.

- expected_modalities:

  Modalities expected in the export.

- time_col:

  Optional time column. If omitted, a common Gazepoint time column is
  guessed after optional standardization.

- standardize:

  If TRUE, apply
  [`standardize_gazepoint_column_names()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/standardize_gazepoint_column_names.md)
  before auditing.

- include_data:

  If TRUE, include the standardized data in the returned audit object.

- long_gap_s:

  Optional missing-gap threshold passed to
  [`summarize_gazepoint_missingness()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarize_gazepoint_missingness.md).

- x:

  Object of class `gazepoint_biometrics_audit` for the print method.

- ...:

  Additional arguments currently ignored.

- object:

  Object of class `gazepoint_biometrics_audit` for the summary method.

## Value

An object of class `gazepoint_biometrics_audit`.
