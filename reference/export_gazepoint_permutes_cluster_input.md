# Export time-course data for permutes cluster workflows

Prepares conservative long-format participant-level time-course data and
metadata for external analysis in packages such as `permutes`.

## Usage

``` r
export_gazepoint_permutes_cluster_input(
  data,
  outcome_col,
  time_col,
  condition_col,
  participant_col,
  path = NULL,
  prefix = "gazepoint_permutes_cluster",
  overwrite = FALSE,
  aggregate = TRUE
)
```

## Arguments

- data:

  A data frame.

- outcome_col:

  Numeric outcome column.

- time_col:

  Time-bin column.

- condition_col:

  Condition column.

- participant_col:

  Participant identifier column.

- path:

  Optional output directory.

- prefix:

  File-name prefix.

- overwrite:

  Should existing files be overwritten?

- aggregate:

  Should repeated participant-condition-time cells be averaged?

## Value

A list containing long data and metadata, or a file table if `path` is
supplied.
