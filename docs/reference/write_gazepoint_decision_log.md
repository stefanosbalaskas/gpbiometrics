# Write a Gazepoint analysis decision log to disk

Write a decision log to CSV, optionally with a compact text summary.

## Usage

``` r
write_gazepoint_decision_log(log, path, summary_path = NULL, overwrite = FALSE)
```

## Arguments

- log:

  A decision log created with
  [`create_gazepoint_analysis_decision_log()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_analysis_decision_log.md).

- path:

  Output CSV file path.

- summary_path:

  Optional output path for a text summary. If `NULL`, only the CSV file
  is written.

- overwrite:

  Logical. If `FALSE`, existing files are not overwritten.

## Value

A data frame listing written files.
