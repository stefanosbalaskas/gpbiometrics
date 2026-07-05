# Summarize signal-quality indicators

Summarizes signal-quality rows by user-selected columns. The result is a
reporting table and does not imply automatic exclusion or
interpretation.

## Usage

``` r
summarize_gazepoint_signal_quality(quality, by = "signal")
```

## Arguments

- quality:

  A data frame returned by
  [`compute_gazepoint_signal_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/compute_gazepoint_signal_quality.md)
  or
  [`classify_gazepoint_signal_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/classify_gazepoint_signal_quality.md).

- by:

  Character vector of grouping columns. Defaults to `"signal"`.

## Value

A data frame.
