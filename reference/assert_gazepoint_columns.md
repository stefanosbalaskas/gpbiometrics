# Assert that required Gazepoint columns are present

Validates expected columns and either throws an error, raises a warning,
or returns a summary table.

## Usage

``` r
assert_gazepoint_columns(
  data,
  required,
  optional = character(),
  mode = c("error", "warning", "summary"),
  ignore_case = TRUE
)
```

## Arguments

- data:

  Data frame.

- required:

  Character vector of required columns.

- optional:

  Character vector of optional columns.

- mode:

  `"error"`, `"warning"`, or `"summary"`.

- ignore_case:

  If TRUE, match columns case-insensitively.

## Value

Invisibly TRUE for passing checks, or a summary data frame when
`mode = "summary"`.
