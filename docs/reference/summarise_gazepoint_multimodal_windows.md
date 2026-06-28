# Summarise Gazepoint multimodal biometric windows

Creates a combined window-level summary table for GSR/EDA, heart rate,
and engagement dial. The output is suitable for later merging with
eye-tracking summaries from `gp3tools`.

## Usage

``` r
summarise_gazepoint_multimodal_windows(
  data,
  group_columns = NULL,
  exclude_zero = TRUE
)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- group_columns:

  Optional grouping columns defining windows, such as
  `c("USER", "MEDIA_ID")`.

- exclude_zero:

  Should zero values be excluded from GSR and heart-rate summaries?

## Value

A data frame with one row per window and prefixed biometric summary
columns.
