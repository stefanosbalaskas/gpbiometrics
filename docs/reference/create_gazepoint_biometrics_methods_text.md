# Create Gazepoint Biometrics methods text

Creates a compact draft methods paragraph describing Gazepoint
Biometrics data processing. The text is intentionally cautious and
avoids making emotional or cognitive claims from physiological or
eye-tracking measures alone.

## Usage

``` r
create_gazepoint_biometrics_methods_text(
  checklist = NULL,
  data = NULL,
  include_cautions = TRUE
)
```

## Arguments

- checklist:

  A checklist produced by
  [`create_gazepoint_biometrics_checklist()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_checklist.md).
  If `NULL`, `data` must be supplied.

- data:

  Optional data frame or path to a Gazepoint CSV export used to create
  the checklist when `checklist = NULL`.

- include_cautions:

  Logical. Should interpretation cautions be appended?

## Value

A character string containing draft methods text.
