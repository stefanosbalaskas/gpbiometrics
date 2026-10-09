# Run automated exploratory statistics for Gazepoint feature tables

Runs simple exploratory group comparisons for numeric feature columns.
The function selects one-way ANOVA when all groups pass Shapiro-Wilk
checks and Kruskal-Wallis otherwise. It also performs pairwise post-hoc
tests with multiplicity correction.

## Usage

``` r
run_gazepoint_automated_statistics(
  dat,
  outcome_cols,
  group_col,
  alpha = 0.05,
  p_adjust_method = "holm",
  normality_alpha = 0.05,
  min_group_n = 3
)
```

## Arguments

- dat:

  A data frame.

- outcome_cols:

  Numeric outcome columns.

- group_col:

  Grouping/condition column.

- alpha:

  Significance level.

- p_adjust_method:

  P-value adjustment method.

- normality_alpha:

  Alpha used for Shapiro-Wilk normality screening.

- min_group_n:

  Minimum observations per group.

## Value

A list with `overview`, `test_table`, `posthoc_table`,
`normality_table`, and `settings`.

## Details

This is an exploratory reporting helper. It is not a substitute for a
preregistered statistical model or expert review of study design.
