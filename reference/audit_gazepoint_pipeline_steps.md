# Audit Gazepoint pipeline steps

Checks a pipeline map for missing expected steps, duplicate step
identifiers, edge references to missing nodes, and simple ordering
violations. The audit is descriptive and does not evaluate whether a
scientific analysis is valid.

## Usage

``` r
audit_gazepoint_pipeline_steps(
  pipeline,
  expected_steps = NULL,
  required_order = NULL,
  allow_extra = TRUE
)
```

## Arguments

- pipeline:

  A `gazepoint_pipeline_map` object or a data frame of pipeline steps.

- expected_steps:

  Optional character vector of step identifiers expected in the
  pipeline. If `NULL`, required steps in the pipeline map are used.

- required_order:

  Optional character vector describing the expected order of selected
  steps. If `NULL`, the order implied by `expected_order` is used when
  available.

- allow_extra:

  Logical. If `FALSE`, steps not listed in `expected_steps` are reported
  as warnings.

## Value

A list with class `gazepoint_pipeline_audit`.
