# Summarize signal-dropout detections

Aggregates the summary table returned by
[`detect_gazepoint_nonwear()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_nonwear.md).
The result is intended for QC reporting and does not imply automatic
exclusion.

## Usage

``` r
summarize_gazepoint_nonwear(nonwear, by = "signal")
```

## Arguments

- nonwear:

  A `gazepoint_nonwear_detection` object or a compatible summary data
  frame.

- by:

  Character vector of columns used for aggregation.

## Value

A data frame.
