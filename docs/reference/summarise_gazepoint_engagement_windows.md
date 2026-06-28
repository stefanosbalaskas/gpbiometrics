# Summarise Gazepoint engagement-dial windows

Summarises Gazepoint engagement-dial values within participant, trial,
stimulus, AOI, or other user-defined windows.

## Usage

``` r
summarise_gazepoint_engagement_windows(
  data,
  group_columns = NULL,
  value_column = "DIAL",
  validity_column = "DIALV",
  exclude_zero = FALSE
)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- group_columns:

  Optional grouping columns defining windows, such as
  `c("USER", "MEDIA_ID")`.

- value_column:

  Engagement-dial value column. Defaults to `"DIAL"`.

- validity_column:

  Engagement-dial validity column. Defaults to `"DIALV"`.

- exclude_zero:

  Should zero values be excluded from usable summaries?

## Value

A data frame with one row per window.
