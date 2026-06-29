# Bootstrap condition comparisons for Gazepoint-derived outcomes

Compares two conditions using a transparent percentile bootstrap. The
helper is intended for trial-level, participant-level, or event-locked
summaries produced by `gpbiometrics`. When `participant_col` is
supplied, observations are first averaged at the
participant-by-condition level to reduce pseudo-replication. When
`paired = TRUE`, only participants with both conditions are retained and
resampled as paired units.

## Usage

``` r
compare_gazepoint_conditions_bootstrap(
  data,
  outcome_col,
  condition_col,
  participant_col = NULL,
  condition_levels = NULL,
  paired = FALSE,
  by_cols = NULL,
  statistic = c("mean_difference", "median_difference", "standardized_mean_difference"),
  n_boot = 2000,
  conf_level = 0.95,
  seed = NULL,
  na_rm = TRUE
)
```

## Arguments

- data:

  Data frame containing the outcome and condition columns.

- outcome_col:

  Numeric outcome column.

- condition_col:

  Two-level condition column.

- participant_col:

  Optional participant/unit identifier. If supplied, the bootstrap uses
  participant-by-condition means.

- condition_levels:

  Optional two-element character vector defining the reference and
  target condition. The estimate is
  `condition_levels[2] - condition_levels[1]`.

- paired:

  If TRUE, perform a paired participant-level bootstrap. Requires
  `participant_col`.

- by_cols:

  Optional columns used to run separate comparisons by subgroup.

- statistic:

  Statistic to bootstrap: `"mean_difference"`, `"median_difference"`, or
  `"standardized_mean_difference"`.

- n_boot:

  Number of bootstrap resamples.

- conf_level:

  Confidence level for percentile intervals.

- seed:

  Optional random seed.

- na_rm:

  If TRUE, remove rows with missing/non-finite outcomes or missing
  condition labels.

## Value

Object of class `gazepoint_bootstrap_condition_comparison`, stored as a
data frame. Bootstrap samples are stored in the `bootstrap_samples`
attribute.
