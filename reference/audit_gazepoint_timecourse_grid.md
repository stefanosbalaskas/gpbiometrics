# Audit the participant-condition-time grid for cluster-permutation analysis

Checks whether a time-course data set has a complete participant by
condition by time grid. This is intended as a safety diagnostic before
calling
[`run_gazepoint_cluster_permutation()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_cluster_permutation.md).

## Usage

``` r
audit_gazepoint_timecourse_grid(
  data,
  subject,
  condition,
  time,
  value = NULL,
  max_report_cells = 1000L
)
```

## Arguments

- data:

  A data frame.

- subject:

  Participant identifier column, supplied as a bare column name or a
  single string.

- condition:

  Condition column, supplied as a bare column name or a single string.

- time:

  Time-bin column, supplied as a bare column name or a single string.

- value:

  Optional numeric outcome column used to count missing outcome values.

- max_report_cells:

  Maximum number of missing or duplicate cells stored in the returned
  object.

## Value

An object of class `gazepoint_timecourse_grid_audit`.
