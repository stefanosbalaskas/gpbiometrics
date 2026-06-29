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
#>   trial AOI n_fixations total_duration_s mean_duration_s median_duration_s
#> 1    T1   A           2              0.5            0.25              0.25
#>   sd_duration_s min_duration_s max_duration_s x_dispersion y_dispersion
#> 1    0.07071068            0.2            0.3          0.1          0.1
#>   spatial_dispersion bbox_area
#> 1                0.2      0.01
```
