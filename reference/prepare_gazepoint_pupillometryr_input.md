# Prepare Gazepoint pupil data for PupillometryR

Converts sample-level Gazepoint pupil data into a conservative, audited
long-form table compatible with
[`PupillometryR::make_pupillometryr_data()`](https://rdrr.io/pkg/PupillometryR/man/make_pupillometryr_data.html).

## Usage

``` r
prepare_gazepoint_pupillometryr_input(
  data,
  participant_col = NULL,
  trial_col = NULL,
  time_col = NULL,
  condition_col = NULL,
  pupil_left_col = NULL,
  pupil_right_col = NULL,
  pupil_col = NULL,
  time_unit = c("auto", "seconds", "milliseconds", "samples"),
  sampling_rate_hz = NULL,
  rezero_time = FALSE,
  invalid_pupil_values = NULL,
  validity_cols = NULL,
  valid_values = NULL,
  blink_cols = NULL,
  mask_invalid = FALSE,
  create_mean_pupil = TRUE,
  other_cols = NULL,
  sampling_tolerance = 0.05,
  irregular = c("error", "allow"),
  create_object = FALSE
)
```

## Arguments

- data:

  Sample-level Gazepoint pupil data frame.

- participant_col:

  Participant identifier column. If `NULL`, common Gazepoint participant
  names are searched.

- trial_col:

  Trial identifier column. If `NULL`, common trial, media, and stimulus
  names are searched.

- time_col:

  Numeric time or sample-counter column. If `NULL`, common Gazepoint
  time columns are searched.

- condition_col:

  Experimental-condition column. If `NULL`, common condition names are
  searched.

- pupil_left_col:

  Optional left-pupil column.

- pupil_right_col:

  Optional right-pupil column.

- pupil_col:

  Optional single, cyclopean, or previously averaged pupil column.
  Supply either `pupil_col` or left/right columns, not both.

- time_unit:

  Source time unit: `"auto"`, `"seconds"`, `"milliseconds"`, or
  `"samples"`. The prepared `Time` column is expressed in milliseconds.

- sampling_rate_hz:

  Sampling rate required when time is represented by sample indices.

- rezero_time:

  Logical. Subtract the first time separately within each
  participant-trial group.

- invalid_pupil_values:

  Optional pupil values to flag explicitly as invalid, for example
  `c(-1, 0)`.

- validity_cols:

  Optional pupil-validity columns. Supply one column to apply it to all
  pupil channels or one column per pupil channel.

- valid_values:

  Optional explicit values treated as valid in `validity_cols`. Without
  this argument, positive numeric values, `TRUE`, and common textual
  valid labels are treated as valid.

- blink_cols:

  Optional blink columns. Supply one column to apply it to all pupil
  channels or one column per pupil channel.

- mask_invalid:

  Logical. When `TRUE`, samples flagged by explicit invalid values,
  failed validity, or blink columns are replaced with `NA` in the
  prepared pupil columns. Non-finite pupil values are always represented
  as `NA`.

- create_mean_pupil:

  Logical. Create `Pupil_Mean` when both left and right pupil columns
  are available.

- other_cols:

  Optional additional condition, item, stimulus, block, or metadata
  columns retained unchanged.

- sampling_tolerance:

  Maximum relative deviation from the median within-trial sampling
  interval.

- irregular:

  Handling of irregular sampling: `"error"` or `"allow"`.

- create_object:

  Logical. If `TRUE`, construct an actual PupillometryR object. The
  optional PupillometryR package must then be installed.

## Value

An object of class `"gazepoint_pupillometryr_input"` containing:

- `data`: plain PupillometryR-compatible long-form data;

- `object`: optional PupillometryR object;

- `row_audit`: row-level pupil availability and flag audit;

- `sampling`: participant-trial sampling audit;

- `manifest`: column mappings and preparation summary;

- `settings`: resolved preparation settings.

## Details

The standardized compatibility columns are `Subject`, `Trial`, `Time`,
and `Condition`. `Time` is expressed in milliseconds. Pupil columns are
named `Pupil_Left`, `Pupil_Right`, `Pupil`, and, when requested and
available, `Pupil_Mean`.

The helper does not detect blinks, interpolate gaps, filter pupil
signals, remove trials, baseline-correct pupil size, or run inferential
analyses. Existing blink and validity columns are preserved as audit
information and are used for masking only when `mask_invalid = TRUE`.

## See also

[`detect_gazepoint_pupil_blinks()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_pupil_blinks.md),
[`clean_gazepoint_pupil_signal()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/clean_gazepoint_pupil_signal.md),
[`baseline_correct_gazepoint_pupil()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/baseline_correct_gazepoint_pupil.md)

## Examples

``` r
pupil <- data.frame(
  participant = rep("P01", 4),
  trial = rep("T01", 4),
  condition = rep("target", 4),
  time_s = c(0, 0.1, 0.2, 0.3),
  pupil_left = c(3.1, 3.2, NA, 3.3),
  pupil_right = c(3.0, 3.1, NA, 3.2)
)

prepared <- prepare_gazepoint_pupillometryr_input(pupil)
prepared$data
#>   Subject Trial Time Condition Pupil_Left Pupil_Right Pupil_Mean Valid_Left
#> 1     P01   T01    0    target        3.1         3.0       3.05       TRUE
#> 2     P01   T01  100    target        3.2         3.1       3.15       TRUE
#> 3     P01   T01  200    target         NA          NA         NA       TRUE
#> 4     P01   T01  300    target        3.3         3.2       3.25       TRUE
#>   Valid_Right Blink_Left Blink_Right
#> 1        TRUE      FALSE       FALSE
#> 2        TRUE      FALSE       FALSE
#> 3        TRUE      FALSE       FALSE
#> 4        TRUE      FALSE       FALSE
prepared$sampling
#>   Subject Trial Condition group_id sample_count start_time_ms end_time_ms
#> 1     P01   T01    target P01\rT01            4             0         300
#>   median_interval_ms effective_sampling_rate_hz repeated_timestamp_count
#> 1                100                         10                        0
#>   negative_time_step_count irregular_interval_count
#> 1                        0                        0
#>   maximum_relative_interval_error
#> 1                               0
```
