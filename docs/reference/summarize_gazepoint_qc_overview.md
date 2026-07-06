# Summarize QC overview tables

Creates a compact QC overview table from row-level or session-level QC
data. The summary can include counts of flags, mean/minimum quality
index values, and simple descriptive summaries for selected metrics.

## Usage

``` r
summarize_gazepoint_qc_overview(
  data,
  group_cols = NULL,
  quality_index_col = NULL,
  flag_cols = NULL,
  metric_cols = NULL
)
```

## Arguments

- data:

  A data frame.

- group_cols:

  Optional grouping columns.

- quality_index_col:

  Optional numeric quality-index column.

- flag_cols:

  Optional logical flag columns. If `NULL`, logical columns containing
  `"flag"` in their names are used when available.

- metric_cols:

  Optional numeric metric columns to summarize.

## Value

A data frame with class `gazepoint_qc_overview`.
