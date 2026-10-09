# Summarise Gazepoint heart-rate windows

Summarises Gazepoint heart-rate values within participant, trial,
stimulus, AOI, or other user-defined windows. `HRV` is treated as a
validity flag, not as a heart-rate-variability metric.

## Usage

``` r
summarise_gazepoint_hr_windows(
  data,
  group_columns = NULL,
  value_column = "HR",
  validity_column = "HRV",
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

  Heart-rate value column. Defaults to `"HR"`.

- validity_column:

  Heart-rate validity column. Defaults to `"HRV"`.

- exclude_zero:

  Should zero values be excluded from usable summaries?

## Value

A data frame with one row per window.
