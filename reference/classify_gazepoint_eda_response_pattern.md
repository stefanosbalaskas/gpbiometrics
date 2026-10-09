# Classify descriptive Gazepoint EDA response patterns

Classifies descriptive EDA response patterns from an EDA/SCR feature
column. The labels are intended for quality-control and descriptive
reporting only. They do not infer emotion, valence, stress, trust,
preference, cognition, or diagnosis.

## Usage

``` r
classify_gazepoint_eda_response_pattern(
  data,
  response_col = NULL,
  group_cols = NULL,
  summary_function = c("max_abs", "mean_abs", "median_abs"),
  no_response_threshold = 0.01,
  low_response_threshold = 0.05,
  moderate_response_threshold = 0.2
)
```

## Arguments

- data:

  A data frame containing EDA/SCR values.

- response_col:

  Optional response feature column. If omitted, the helper searches for
  common SCR/EDA response columns and then `GSR_US_PHASIC` or `GSR_US`.

- group_cols:

  Optional grouping columns.

- summary_function:

  Summary used within each group.

- no_response_threshold:

  Absolute response threshold for `no_detectable_response`.

- low_response_threshold:

  Upper threshold for `low_response`.

- moderate_response_threshold:

  Upper threshold for `moderate_response`.

## Value

A list with `overview`, `classifications`, and `settings`.
