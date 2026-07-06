# Inject simple synthetic artifacts into signal columns

Adds transparent, rule-based synthetic artifacts to selected numeric
signal columns. The function is intended for testing QC pipelines and
does not interpret the physiological meaning of any signal.

## Usage

``` r
simulate_gazepoint_artifact(
  data,
  signal_cols,
  artifact = c("missing_run", "flatline", "spike"),
  n_artifacts = 1,
  artifact_length = 5,
  magnitude = NULL,
  seed = NULL,
  suffix = "_artifact",
  overwrite = FALSE
)
```

## Arguments

- data:

  A data frame.

- signal_cols:

  Character vector of numeric signal columns.

- artifact:

  Character vector of artifact types. Supported values are
  `"missing_run"`, `"flatline"`, `"spike"`, `"noise"`, and `"drift"`.

- n_artifacts:

  Number of artifacts of each requested type to add per signal column.

- artifact_length:

  Number of rows affected by each inserted artifact.

- magnitude:

  Optional numeric artifact magnitude. If `NULL`, a conservative value
  is derived from the signal standard deviation.

- seed:

  Optional random seed for reproducible artifact placement.

- suffix:

  Suffix used for new artifact-injected columns when
  `overwrite = FALSE`.

- overwrite:

  Logical. If `TRUE`, modify the original signal columns. If `FALSE`,
  create new columns.

## Value

A list with class `gazepoint_artifact_simulation`, containing the
modified data, an artifact log, and the parameters used.
