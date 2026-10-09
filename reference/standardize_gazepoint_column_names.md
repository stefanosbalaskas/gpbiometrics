# Standardize common Gazepoint column names

Maps common Gazepoint-style export aliases to canonical names such as
`time_s`, `participant`, `trial`, `pupil_left`, `pupil_right`, `gaze_x`,
`gaze_y`, `GSR`, and `PPG`.

## Usage

``` r
standardize_gazepoint_column_names(
  data,
  dictionary = NULL,
  conflict = c("suffix", "error", "keep"),
  ignore_case = TRUE
)
```

## Arguments

- data:

  Data frame, or a named list of data frames.

- dictionary:

  Optional named list mapping canonical names to aliases.

- conflict:

  How to handle rename conflicts: `"suffix"`, `"error"`, or `"keep"`.

- ignore_case:

  If TRUE, match aliases case-insensitively.

## Value

Data frame, or list of data frames, with a
`gazepoint_column_standardization` attribute containing the rename
audit.
