# Optimise subject-specific cvxEDA slow time constant

Performs a dependency-light grid search over the slow Bateman
impulse-response time constant used in cvxEDA-style EDA decomposition
workflows. The default fast time constant is fixed at 0.7 seconds and
the slow time constant is searched between 2 and 4 seconds. This
function does not run the original cvxEDA optimisation; it provides a
subject-specific tau-selection bridge for downstream cvxEDA-style
workflows.

## Usage

``` r
optimize_gazepoint_cvxeda_tau(
  dat,
  eda_col = "GSR_US",
  time_col = "CNT",
  group_cols = NULL,
  tau0_grid = seq(2, 4, by = 0.25),
  tau1 = 0.7,
  sampling_rate = NULL,
  ridge_lambda = 0.01,
  max_irf_seconds = 20
)
```

## Arguments

- dat:

  A data frame containing EDA data.

- eda_col:

  Numeric EDA/conductance column.

- time_col:

  Numeric time column.

- group_cols:

  Optional grouping columns, usually participant/session.

- tau0_grid:

  Candidate slow time constants.

- tau1:

  Fixed fast time constant.

- sampling_rate:

  Optional sampling rate in Hz. If `NULL`, estimated from `time_col`.

- ridge_lambda:

  Small ridge penalty used in frequency-domain deconvolution.

- max_irf_seconds:

  Maximum impulse-response duration.

## Value

A list with `overview`, `best_tau`, `optimization_table`, and
`settings`.
