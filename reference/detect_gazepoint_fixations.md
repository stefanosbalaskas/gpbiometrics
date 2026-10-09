# Detect fixations and saccades in Gazepoint gaze samples

Applies a transparent velocity-threshold classification to raw Gazepoint
gaze coordinates. Samples are classified as fixation, saccade,
unclassified, or invalid, after which fixation- and saccade-level event
tables are derived.

## Usage

``` r
detect_gazepoint_fixations(
  data,
  time_col = NULL,
  x_col = NULL,
  y_col = NULL,
  group_cols = NULL,
  valid_col = NULL,
  valid_values = c(1, TRUE),
  time_unit = c("seconds", "milliseconds", "microseconds", "samples"),
  sampling_rate_hz = NULL,
  coordinate_unit = c("native", "normalized", "pixels", "degrees"),
  velocity_threshold,
  min_fixation_duration_ms = 100,
  min_saccade_duration_ms = 10,
  max_gap_ms = 100,
  velocity_col = "gaze_velocity",
  class_col = "gaze_class",
  event_id_col = "gaze_event_id",
  overwrite = FALSE
)
```

## Arguments

- data:

  A data frame containing sample-level gaze coordinates.

- time_col:

  Numeric time column. If `NULL`, common Gazepoint time-column names are
  searched.

- x_col:

  Numeric horizontal gaze-coordinate column. If `NULL`, common Gazepoint
  names such as `BPOGX`, `gaze_x`, and `FPOGX` are searched.

- y_col:

  Numeric vertical gaze-coordinate column. If `NULL`, common Gazepoint
  names such as `BPOGY`, `gaze_y`, and `FPOGY` are searched.

- group_cols:

  Optional participant, trial, session, or file columns. Detection is
  performed independently within each group.

- valid_col:

  Optional gaze-validity column.

- valid_values:

  Values in `valid_col` treated as valid.

- time_unit:

  Unit of `time_col`: `"seconds"`, `"milliseconds"`, `"microseconds"`,
  or `"samples"`.

- sampling_rate_hz:

  Sampling rate required when `time_unit = "samples"`.

- coordinate_unit:

  Descriptive unit of the gaze coordinates: `"native"`, `"normalized"`,
  `"pixels"`, or `"degrees"`. Coordinates are not transformed
  automatically.

- velocity_threshold:

  Positive velocity threshold expressed in coordinate units per second.
  Samples above this threshold are classified as saccadic.

- min_fixation_duration_ms:

  Minimum fixation duration in milliseconds. Shorter fixation runs are
  labelled `"unclassified"`.

- min_saccade_duration_ms:

  Minimum saccade duration in milliseconds. Shorter saccade runs are
  labelled `"unclassified"`.

- max_gap_ms:

  Maximum permitted time difference between adjacent samples. Larger
  gaps split events. Set to `NULL` to disable this check.

- velocity_col:

  Name of the generated sample-velocity column.

- class_col:

  Name of the generated sample-classification column.

- event_id_col:

  Name of the generated sample event-ID column.

- overwrite:

  Logical. If `FALSE`, existing generated columns are protected.

## Value

An object of class `"gazepoint_gaze_events"` containing:

- `samples`: original rows with velocity, class, and event ID;

- `fixations`: fixation-level timing, location, and dispersion
  summaries;

- `saccades`: saccade-level timing, amplitude, direction, and velocity;

- `summary`: group-level sample and event counts;

- `settings`: complete detector settings.

## Details

This is an I-VT-style detector rather than an exact reproduction of a
specific vendor or external-toolbox implementation. The velocity
threshold must match the supplied coordinate unit and should be
justified, reported, and sensitivity-checked for the recording design.

## References

Salvucci, D. D., and Goldberg, J. H. (2000). Identifying fixations and
saccades in eye-tracking protocols. Proceedings of the Eye Tracking
Research and Applications Symposium.

## See also

[`detect_gazepoint_saccades()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_saccades.md),
[`plot_gazepoint_saccade_main_sequence()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_saccade_main_sequence.md),
[`summarize_gazepoint_fixations()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarize_gazepoint_fixations.md)

## Examples

``` r
gaze <- data.frame(
  time_s = seq(0, 0.9, by = 0.1),
  gaze_x = c(0, 0.01, 0.02, 0.03, 1, 1.01, 1.02, 1.03, 1.04, 1.05),
  gaze_y = 0
)

events <- detect_gazepoint_fixations(
  gaze,
  time_col = "time_s",
  x_col = "gaze_x",
  y_col = "gaze_y",
  velocity_threshold = 2,
  min_fixation_duration_ms = 100,
  min_saccade_duration_ms = 50
)

events$fixations
#>   segment_id fixation_id gaze_event_id start_row end_row start_time end_time
#> 1   all_rows           1             1         1       3        0.0      0.2
#> 2   all_rows           2             3         6      10        0.5      0.9
#>   duration_ms n_samples mean_x mean_y median_x median_y range_x range_y
#> 1         200         3   0.01      0     0.01        0    0.02       0
#> 2         400         5   1.03      0     1.03        0    0.04       0
#>   dispersion
#> 1       0.02
#> 2       0.04
events$saccades
#>   segment_id saccade_id gaze_event_id start_row end_row start_time end_time
#> 1   all_rows          1             2         4       5        0.3      0.4
#>   duration_ms n_samples start_x start_y end_x end_y delta_x delta_y amplitude
#> 1         100         2    0.03       0     1     0    0.97       0      0.97
#>   direction_deg mean_velocity peak_velocity
#> 1             0           4.9           9.7
```
