# Compute a heuristic QC quality index

Combines user-selected numeric QC metrics into a transparent row-level
heuristic quality index. Metrics are range-scaled by default and
combined using user-supplied directions and weights. The result is
intended for quality-control summaries only. It does not remove data and
does not make physiological, psychological, diagnostic, or clinical
claims.

## Usage

``` r
compute_gazepoint_quality_index(
  data,
  metric_cols,
  directions = NULL,
  weights = NULL,
  index_col = "quality_index",
  component_prefix = "quality_component_",
  overwrite = FALSE
)
```

## Arguments

- data:

  A data frame.

- metric_cols:

  Character vector of numeric QC metric columns.

- directions:

  Direction for each metric. Use `"higher"` when higher values indicate
  better quality and `"lower"` when lower values indicate better
  quality. May be unnamed, named by metric, or length one.

- weights:

  Optional non-negative numeric weights. May be unnamed, named by
  metric, or length one.

- index_col:

  Name of the output quality-index column.

- component_prefix:

  Prefix used for metric component-score columns.

- overwrite:

  Logical. If `FALSE`, existing output columns are not overwritten.

## Value

A data frame with class `gazepoint_quality_index`.
