# Summarise a Gazepoint analysis decision log

Summarise the number of recorded decisions by workflow stage, object
type, decision label, and function name.

## Usage

``` r
summarise_gazepoint_decision_log(log)
```

## Arguments

- log:

  A decision log created with
  [`create_gazepoint_analysis_decision_log()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_analysis_decision_log.md).

## Value

A list with class `"gazepoint_analysis_decision_log_summary"`.
