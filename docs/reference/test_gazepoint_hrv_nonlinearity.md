# Test HRV nonlinearity using surrogate data

Tests whether a nonlinear HRV statistic differs from surrogate RR/IBI
sequences. This is a screening tool for evidence inconsistent with a
simple linear stochastic null process. It does not prove deterministic
chaos or diagnose any condition.

## Usage

``` r
test_gazepoint_hrv_nonlinearity(
  dat,
  ibi_col = "IBI",
  group_cols = NULL,
  metric = c("sample_entropy", "approximate_entropy", "sd1_sd2_ratio"),
  n_surrogates = 99,
  surrogate_method = c("phase_randomized", "shuffle"),
  m = 2,
  r_multiplier = 0.2,
  statistic_fun = NULL,
  seed = NULL
)
```

## Arguments

- dat:

  A data frame containing IBI/RR intervals.

- ibi_col:

  Numeric IBI/RR interval column.

- group_cols:

  Optional grouping columns.

- metric:

  Nonlinear statistic to test.

- n_surrogates:

  Number of surrogate series per group.

- surrogate_method:

  `"phase_randomized"` or `"shuffle"`.

- m:

  Embedding dimension for entropy metrics.

- r_multiplier:

  Tolerance multiplier for entropy metrics.

- statistic_fun:

  Optional custom statistic function accepting numeric x.

- seed:

  Optional random seed.

## Value

A list with `overview`, `results`, `surrogate_statistics`, and
`settings`.
