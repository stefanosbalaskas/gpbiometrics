# Prepare Gazepoint data for gazeR

Converts long-form sample-level Gazepoint gaze and pupil data into a
conservative, audited table compatible with
[`gazer::make_gazer()`](https://rdrr.io/pkg/gazer/man/make_gazer.html).

## Usage

``` r
prepare_gazepoint_gazer_input(
  data,
  participant_col = NULL,
  trial_col = NULL,
  time_col = NULL,
  time_unit = c("auto", "seconds", "milliseconds", "samples"),
  sampling_rate_hz = NULL,
  rezero_time = FALSE,
  x_col = NULL,
  y_col = NULL,
  x_left_col = NULL,
  y_left_col = NULL,
  x_right_col = NULL,
  y_right_col = NULL,
  pupil_col = NULL,
  pupil_left_col = NULL,
  pupil_right_col = NULL,
  validity_col = NULL,
  validity_left_col = NULL,
  validity_right_col = NULL,
  valid_values = NULL,
  blink_col = NULL,
  blink_left_col = NULL,
  blink_right_col = NULL,
  invalid_coordinate_values = NULL,
  invalid_pupil_values = NULL,
  mask_invalid = FALSE,
  other_cols = NULL,
  sampling_tolerance = 0.05,
  irregular = c("error", "allow"),
  create_object = FALSE
)
```

## Arguments

- data:

  Sample-level Gazepoint data frame.

- participant_col:

  Participant identifier column. If `NULL`, common participant names are
  searched.

- trial_col:

  Trial identifier column. If `NULL`, common trial, media, and stimulus
  names are searched.

- time_col:

  Numeric time or sample-counter column. If `NULL`, common Gazepoint
  time columns are searched.

- time_unit:

  Source time unit: `"auto"`, `"seconds"`, `"milliseconds"`, or
  `"samples"`. Output time is expressed in milliseconds.

- sampling_rate_hz:

  Sampling rate required when time is represented by sample indices.

- rezero_time:

  Logical. Subtract the minimum time separately within each
  participant-trial group.

- x_col, y_col:

  Optional monocular or already-combined gaze-coordinate columns.

- x_left_col, y_left_col:

  Optional left-eye gaze-coordinate columns.

- x_right_col, y_right_col:

  Optional right-eye gaze-coordinate columns.

- pupil_col:

  Optional monocular, cyclopean, or previously combined pupil column.

- pupil_left_col, pupil_right_col:

  Optional left- and right-eye pupil columns.

- validity_col:

  Optional shared gaze/pupil validity column.

- validity_left_col, validity_right_col:

  Optional per-eye validity columns.

- valid_values:

  Optional explicit values treated as valid. Without this argument,
  positive numeric values, `TRUE`, and common textual valid labels are
  treated as valid.

- blink_col:

  Optional shared blink column.

- blink_left_col, blink_right_col:

  Optional per-eye blink columns.

- invalid_coordinate_values:

  Optional coordinate values to flag explicitly as invalid. Zero is not
  treated as invalid by default because it can be a valid screen-edge
  coordinate.

- invalid_pupil_values:

  Optional pupil values to flag explicitly as invalid, for example
  `c(-1, 0)`.

- mask_invalid:

  Logical. If `TRUE`, explicitly invalid values, failed validity
  samples, and blink samples are replaced by `NA` in the prepared gaze
  and pupil columns. Non-finite values are always represented as `NA`.

- other_cols:

  Optional item, condition, block, AOI, stimulus, or other metadata
  columns retained unchanged.

- sampling_tolerance:

  Maximum relative deviation from the median within-trial sampling
  interval.

- irregular:

  Handling of irregular within-trial sampling: `"error"` or `"allow"`.

- create_object:

  Logical. If `TRUE`, call `make_gazer()` from a locally installed gazeR
  package. gazeR is GitHub-hosted and is therefore not a declared
  gpbiometrics dependency.

## Value

An object of class `"gazepoint_gazer_input"` containing:

- `data`: plain gazeR-compatible long-form data;

- `object`: optional output from `make_gazer()`;

- `row_audit`: row-level availability and invalidity audit;

- `sampling`: participant-trial sampling audit;

- `manifest`: column mappings and preparation summary;

- `settings`: resolved preparation settings.

## Details

The standardized identifier columns are `subject`, `trial`, and `time`.
`time` is expressed in milliseconds.

Monocular or combined input uses the canonical columns `x`, `y`, and
`pupil`. Binocular input uses `x_left`, `y_left`, `pupil_left`,
`x_right`, `y_right`, and `pupil_right` as available. gazeR retains
multiple selected eye columns when constructing its compatibility table.

The helper does not assign AOIs, calculate track loss, detect or extend
blinks, interpolate data, smooth signals, downsample, upsample,
baseline-correct pupil size, or run inferential analyses.

## See also

[`assign_gazepoint_aoi()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/assign_gazepoint_aoi.md),
[`downsample_gazepoint_data()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/downsample_gazepoint_data.md),
[`detect_gazepoint_pupil_blinks()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_pupil_blinks.md),
[`clean_gazepoint_pupil_signal()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/clean_gazepoint_pupil_signal.md)

## Examples

``` r
gaze <- data.frame(
  participant = rep("P01", 4),
  trial = rep("T01", 4),
  time_s = c(0, 0.1, 0.2, 0.3),
  gaze_x = c(0.2, 0.4, 0.6, NA),
  gaze_y = c(0.5, 0.5, 0.5, NA),
  pupil_left = c(3.1, 3.2, 3.3, NA),
  pupil_right = c(3.0, 3.1, 3.2, NA)
)

prepared <- prepare_gazepoint_gazer_input(gaze)
prepared$data
#>   subject trial time   x   y pupil_left pupil_right
#> 1     P01   T01    0 0.2 0.5        3.1         3.0
#> 2     P01   T01  100 0.4 0.5        3.2         3.1
#> 3     P01   T01  200 0.6 0.5        3.3         3.2
#> 4     P01   T01  300  NA  NA         NA          NA
prepared$sampling
#>   subject trial group_id sample_count start_time_ms end_time_ms
#> 1     P01   T01 P01\rT01            4             0         300
#>   median_interval_ms effective_sampling_rate_hz repeated_timestamp_count
#> 1                100                         10                        0
#>   negative_time_step_count irregular_interval_count
#> 1                        0                        0
#>   maximum_relative_interval_error
#> 1                               0
```
