# Run blockwise online design optimization decision support

Provides a safe, dependency-light decision-support/simulation helper for
online design optimization. The function recommends the next condition
by combining expected model-discrimination utility with optional
exploration and balancing penalties.

## Usage

``` r
run_gazepoint_online_design_optimization(
  candidate_table,
  condition_col = "condition",
  utility_col = "expected_utility",
  block_col = NULL,
  cost_col = NULL,
  previous_assignments = NULL,
  exploration_weight = 0.1,
  balance_weight = 0.1,
  maximise = TRUE
)
```

## Arguments

- candidate_table:

  A data frame containing candidate conditions.

- condition_col:

  Candidate condition column.

- utility_col:

  Expected utility/model-discrimination column.

- block_col:

  Optional block column.

- cost_col:

  Optional cost or burden column subtracted from utility.

- previous_assignments:

  Optional previous condition assignments.

- exploration_weight:

  Weight for favouring under-sampled conditions.

- balance_weight:

  Weight for penalising over-sampled conditions.

- maximise:

  Logical. If `TRUE`, select highest score.

## Value

A list with `overview`, `ranked_candidates`, `recommendation`,
`assignment_summary`, and `settings`.

## Details

This function does not control stimulus presentation software and should
not be used as autonomous real-time experiment control without separate
ethical, preregistration, and software-integration review.
