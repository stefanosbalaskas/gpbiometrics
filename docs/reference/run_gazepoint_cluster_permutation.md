# Run a conservative cluster-based permutation test for Gazepoint time courses

Runs a narrow within-subject, two-condition, one-dimensional
cluster-based permutation test on participant-level Gazepoint-derived
time courses.

## Usage

``` r
run_gazepoint_cluster_permutation(
  data,
  outcome_col = "value",
  time_col = "time",
  condition_col = "condition",
  participant_col = "participant",
  design = "within",
  condition_a = NULL,
  condition_b = NULL,
  n_permutations = 1000,
  cluster_forming_alpha = 0.05,
  cluster_alpha = 0.05,
  tail = c("two.sided", "positive", "negative"),
  seed = NULL,
  time_bin_width = NULL,
  aggregation = c("mean", "median")
)
```

## Arguments

- data:

  A data frame, preferably returned by
  [`prepare_gazepoint_timecourse_test_data()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_timecourse_test_data.md).

- outcome_col:

  Name of the numeric outcome column.

- time_col:

  Name of the numeric time column.

- condition_col:

  Name of the condition column.

- participant_col:

  Name of the participant identifier column.

- design:

  Currently only `"within"` is supported.

- condition_a:

  Optional first condition level. The tested difference is
  `condition_a - condition_b`.

- condition_b:

  Optional second condition level.

- n_permutations:

  Number of sign-flip permutations.

- cluster_forming_alpha:

  Per-time-point alpha used only to form clusters.

- cluster_alpha:

  Cluster-level alpha used for the `significant` flag.

- tail:

  Test tail. Currently `"two.sided"`, `"positive"`, or `"negative"`.

- seed:

  Optional random seed.

- time_bin_width:

  Optional time-bin width passed to
  [`prepare_gazepoint_timecourse_test_data()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_timecourse_test_data.md)
  when the input has not already been prepared.

- aggregation:

  Aggregation rule passed to
  [`prepare_gazepoint_timecourse_test_data()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_timecourse_test_data.md)
  when needed.

## Value

An object of class `gazepoint_cluster_permutation`.

## Details

The function computes a paired t-statistic at each time point using
participant-level condition differences, forms temporal clusters from
adjacent suprathreshold time points, uses summed absolute t-statistics
as cluster mass, and compares observed cluster masses with a sign-flip
permutation null distribution.

## Caution

This helper tests the global null of no condition difference anywhere in
the tested time range. A significant cluster indicates evidence against
that global null under the permutation scheme. It does not establish the
precise onset, offset, latency, or physiological timing of an effect.
Avoid wording such as "the effect starts at X ms". Prefer conservative
wording such as "the cluster-based permutation test indicated a
condition difference in the tested time course".
