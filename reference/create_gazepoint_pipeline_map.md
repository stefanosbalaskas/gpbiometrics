# Create a Gazepoint pipeline map

Creates a lightweight tabular representation of a Gazepoint analysis
pipeline. The output contains workflow nodes and directed edges that can
be audited or exported as DOT/Graphviz text. This function is intended
for documentation, reporting, and reproducibility only.

## Usage

``` r
create_gazepoint_pipeline_map(
  steps = NULL,
  edges = NULL,
  pipeline_id = NULL,
  include_default = TRUE
)
```

## Arguments

- steps:

  Optional data frame of pipeline steps. Required column: `step_id`.
  Optional columns include `label`, `domain`, `description`,
  `expected_order`, `required`, `status`, and `notes`. If `NULL`, a
  conservative default workflow is used.

- edges:

  Optional data frame of directed edges with columns `from` and `to`.
  Optional columns include `edge_type`, `description`, and `required`.
  If `NULL`, sequential edges are created from the step order.

- pipeline_id:

  Optional pipeline identifier.

- include_default:

  Logical. If `TRUE` and `steps = NULL`, the default Gazepoint pipeline
  steps are used.

## Value

A list with class `gazepoint_pipeline_map`.
