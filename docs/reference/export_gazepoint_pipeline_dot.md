# Export a Gazepoint pipeline map as DOT text

Converts a Gazepoint pipeline map to a lightweight DOT/Graphviz
character string. The DOT text can be copied into external
graph-rendering tools. This function does not require Graphviz,
DiagrammeR, or any rendering dependency.

## Usage

``` r
export_gazepoint_pipeline_dot(
  pipeline,
  file = NULL,
  graph_name = "gazepoint_pipeline",
  rankdir = "LR",
  include_descriptions = FALSE
)
```

## Arguments

- pipeline:

  A `gazepoint_pipeline_map` object or a data frame of pipeline steps.

- file:

  Optional file path. If supplied, the DOT text is written to disk.

- graph_name:

  DOT graph name.

- rankdir:

  Graph direction. Common values are `"LR"` and `"TB"`.

- include_descriptions:

  Logical. If `TRUE`, node descriptions are included in DOT labels.

## Value

A single character string containing DOT text.
