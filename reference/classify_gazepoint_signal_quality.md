# Classify signal-quality rows using transparent threshold rules

Applies user-visible threshold rules to a signal-quality table. The
function adds review labels and failing-rule descriptions. It does not
remove data.

## Usage

``` r
classify_gazepoint_signal_quality(quality, rules = NULL)
```

## Arguments

- quality:

  A data frame returned by
  [`compute_gazepoint_signal_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/compute_gazepoint_signal_quality.md).

- rules:

  Optional named list of threshold rules. Missing rules use the
  conservative defaults. Set a rule to `NULL` to remove it.

## Value

A data frame with class `gazepoint_signal_quality_classification`.
