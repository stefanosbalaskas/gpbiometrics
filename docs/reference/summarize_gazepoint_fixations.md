# Summarize Gazepoint fixation metrics

Computes fixation-level summary metrics by participant, trial, AOI, or
any user-specified grouping columns.

## Usage

``` r
summarize_gazepoint_fixations(
  fixDF,
  duration_col = NULL,
  x_col = NULL,
  y_col = NULL,
  participant_col = NULL,
  trial_col = NULL,
  aoi_col = NULL,
  group_cols = NULL,
  duration_unit = c("auto", "seconds", "milliseconds")
)
```

## Arguments

- fixDF:

  Fixation data frame.

- duration_col:

  Fixation duration column. If NULL, common Gazepoint names such as
  `FPOGD` are detected automatically.

- x_col:

  Fixation x-coordinate column.

- y_col:

  Fixation y-coordinate column.

- participant_col:

  Optional participant column.

- trial_col:

  Optional trial column.

- aoi_col:

  Optional AOI column.

- group_cols:

  Optional grouping columns. Overrides detected participant, trial, and
  AOI columns.

- duration_unit:

  `"auto"`, `"seconds"`, or `"milliseconds"`.

## Value

Data frame with fixation count, duration, and dispersion metrics.

## Examples

``` r
fix <- data.frame(trial = "T1", AOI = c("A", "A"), FPOGD = c(.2, .3),
                  FPOGX = c(.1, .2), FPOGY = c(.3, .4))
summarize_gazepoint_fixations(fix)
#> Error in summarize_gazepoint_fixations(fix): could not find function "summarize_gazepoint_fixations"
```
