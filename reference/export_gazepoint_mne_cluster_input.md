# Export time-course data for MNE cluster-permutation workflows

Prepares participant-level condition differences in a wide matrix format
commonly used by MNE-style one-sample cluster-permutation workflows.

## Usage

``` r
export_gazepoint_mne_cluster_input(
  data,
  outcome_col,
  time_col,
  condition_col,
  participant_col,
  condition_a = NULL,
  condition_b = NULL,
  path = NULL,
  prefix = "gazepoint_mne_cluster",
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

- condition_a:

  Reference condition. If `NULL`, the first sorted condition is used.

- condition_b:

  Comparison condition. If `NULL`, the second sorted condition is used.

- path:

  Optional output directory. If `NULL`, files are not written.

- prefix:

  File-name prefix used when `path` is supplied.

- overwrite:

  Should existing files be overwritten?

- aggregate:

  Should repeated participant-condition-time cells be averaged?

## Value

A list containing long data, a wide difference matrix, and metadata,
invisibly if files are written.
