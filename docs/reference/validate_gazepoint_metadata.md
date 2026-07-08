# Validate Gazepoint metadata and required columns

Performs transparent metadata checks for Gazepoint workflow data frames.
The function checks required columns, optional expected columns, missing
IDs, duplicate key rows, and time ordering within groups. It returns a
structured report rather than modifying the data.

## Usage

``` r
validate_gazepoint_metadata(
  data,
  required_cols = character(),
  expected_cols = character(),
  id_cols = NULL,
  time_col = NULL,
  unique_cols = NULL,
  allow_missing_ids = FALSE
)
```

## Arguments

- data:

  A data frame.

- required_cols:

  Character vector of required columns.

- expected_cols:

  Optional character vector of expected but non-fatal columns.

- id_cols:

  Optional character vector naming participant/session/trial
  identifiers.

- time_col:

  Optional time column used for ordering checks.

- unique_cols:

  Optional character vector defining a row-level key that should be
  unique.

- allow_missing_ids:

  Logical. If `FALSE`, missing values in `id_cols` are reported as
  problems.

## Value

A list containing status, problems, warnings, and a summary table. The
object has class `"gazepoint_metadata_validation"`.

## Examples

``` r
d <- data.frame(
  participant = c("P01", "P01"),
  time = c(1, 2),
  pupil_left = c(3.1, 3.2)
)
validate_gazepoint_metadata(
  d,
  required_cols = c("participant", "time"),
  id_cols = "participant",
  time_col = "time"
)
#> Gazepoint metadata validation: pass
#>  n_rows n_columns n_required_columns n_missing_required n_expected_columns
#>       2         3                  2                  0                  0
#>  n_missing_expected n_problems n_warnings
#>                   0          0          0
```
