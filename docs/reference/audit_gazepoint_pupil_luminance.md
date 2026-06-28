# Audit pupil-luminance confounding

Computes correlations between pupil size and luminance/brightness and
flags groups where the absolute association exceeds a threshold.

## Usage

``` r
audit_gazepoint_pupil_luminance(
  data,
  pupil_col = NULL,
  luminance_col = NULL,
  group_cols = NULL,
  threshold = 0.3,
  method = c("pearson", "spearman")
)
```

## Arguments

- data:

  Data frame containing pupil and luminance columns.

- pupil_col:

  Pupil column.

- luminance_col:

  Luminance/brightness column.

- group_cols:

  Optional grouping columns.

- threshold:

  Absolute correlation threshold for flagging.

- method:

  Correlation method.

## Value

Data frame with correlation and flag columns.
