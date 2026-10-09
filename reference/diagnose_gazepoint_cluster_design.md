# Diagnose whether a design is suitable for cluster-permutation analysis

Performs high-level checks on the data structure and design assumptions
used by the current cluster-permutation prototype.

## Usage

``` r
diagnose_gazepoint_cluster_design(
  data,
  subject,
  condition,
  time,
  value = NULL,
  design = c("within", "between"),
  min_subjects = 10L
)
```

## Arguments

- data:

  A data frame.

- subject:

  Participant identifier column.

- condition:

  Condition column.

- time:

  Time-bin column.

- value:

  Optional numeric outcome column.

- design:

  Design to diagnose. The current runner is designed for within-subject
  two-condition time-course data.

- min_subjects:

  Minimum recommended number of participants.

## Value

An object of class `gazepoint_cluster_design_diagnostic`.
