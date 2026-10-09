# Summarise Gazepoint GSR/EDA windows

Summarises Gazepoint GSR/EDA values within participant, trial, stimulus,
AOI, or other user-defined windows. When available, `GSR_US` is used by
default because it represents skin conductance in microsiemens in
Gazepoint exports.

## Usage

``` r
summarise_gazepoint_gsr_windows(
  data,
  group_columns = NULL,
  value_column = NULL,
  validity_column = "GSRV",
  exclude_zero = TRUE
)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- group_columns:

  Optional grouping columns defining windows, such as
  `c("USER", "MEDIA_ID")`.

- value_column:

  Optional GSR/EDA value column. If `NULL`, `GSR_US` is used when
  present, otherwise `GSR`.

- validity_column:

  Optional validity column. Defaults to `"GSRV"`.

- exclude_zero:

  Should zero values be excluded from usable summaries?

## Value

A data frame with one row per window.
