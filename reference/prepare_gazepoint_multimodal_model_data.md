# Prepare Gazepoint multimodal model data

Creates a model-ready table from Gazepoint biometric window summaries
and, optionally, eye-tracking summaries produced by `gp3tools` or
another workflow. The function is intentionally conservative: it does
not fit a model, impute missing values, or remove rows automatically.

## Usage

``` r
prepare_gazepoint_multimodal_model_data(
  biometrics,
  eye_tracking = NULL,
  group_columns = NULL,
  biometric_is_summarised = FALSE,
  by = NULL,
  all = FALSE
)
```

## Arguments

- biometrics:

  A data frame containing row-level Gazepoint Biometrics data or an
  already summarised biometric window table.

- eye_tracking:

  Optional eye-tracking summary table to merge with the biometric
  summaries.

- group_columns:

  Columns defining the analysis unit, such as `c("USER", "MEDIA_ID")`.

- biometric_is_summarised:

  Logical. If `FALSE`, biometric window summaries are created using
  [`summarise_gazepoint_multimodal_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_multimodal_windows.md).
  If `TRUE`, `biometrics` is treated as already summarised.

- by:

  Optional merge keys. If `NULL`, `group_columns` are used.

- all:

  Should a full outer join be used when eye-tracking data are supplied?
  Defaults to `FALSE`, giving an inner join.

## Value

A data frame with class `"gazepoint_multimodal_model_data"` and a
`"model_data_summary"` attribute.
