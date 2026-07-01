# Simulate two-condition time-course data for cluster-permutation examples

Creates participant-level synthetic time-course data with an optional
effect window. The function is intended for examples, tests, teaching,
and documentation.

## Usage

``` r
simulate_gazepoint_cluster_timecourse_data(
  n_subjects = 12L,
  n_time = 60L,
  conditions = c("A", "B"),
  effect_start = 25,
  effect_end = 38,
  effect_size = 0.6,
  noise_sd = 0.4,
  subject_sd = 0.25,
  time_start = 1,
  time_step = 1,
  effect_condition = "B",
  seed = NULL
)
```

## Arguments

- n_subjects:

  Number of participants.

- n_time:

  Number of time bins.

- conditions:

  Character vector of two condition labels.

- effect_start:

  First time value included in the effect window.

- effect_end:

  Last time value included in the effect window.

- effect_size:

  Additive effect size inside the effect window.

- noise_sd:

  Standard deviation of observation-level noise.

- subject_sd:

  Standard deviation of participant-level random intercepts.

- time_start:

  First time value.

- time_step:

  Step between time bins.

- effect_condition:

  Condition receiving the additive effect.

- seed:

  Optional random seed.

## Value

A data frame with columns `subject`, `condition`, `time`, `value`, and
`true_effect`.
