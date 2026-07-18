# Validate Gazepoint gaze data

Consolidates coordinate, validity, missingness, timestamp, sampling, and
large-gap checks for sample-level Gazepoint gaze data.

## Usage

``` r
validate_gazepoint_gaze(
  data,
  time_col = NULL,
  x_col = NULL,
  y_col = NULL,
  validity_cols = NULL,
  group_cols = NULL,
  coordinate_system = c("auto", "normalized", "pixels", "degrees"),
  screen_width_px = NULL,
  screen_height_px = NULL,
  time_unit = c("auto", "seconds", "milliseconds", "samples"),
  sampling_rate_hz = NULL,
  expected_sampling_rate_hz = NULL,
  sampling_tolerance = 0.2,
  missing_threshold = 0.2,
  gap_multiplier = 3
)
```

## Arguments

- data:

  A sample-level data frame.

- time_col:

  Time column. If `NULL`, a likely column is inferred.

- x_col:

  Horizontal gaze-coordinate column.

- y_col:

  Vertical gaze-coordinate column.

- validity_cols:

  Optional validity columns. Logical values and positive numeric values
  are treated as valid.

- group_cols:

  Optional grouping columns, such as participant and trial.

- coordinate_system:

  Coordinate system: `"auto"`, `"normalized"`, `"pixels"`, or
  `"degrees"`.

- screen_width_px, screen_height_px:

  Screen dimensions required for bounded pixel-coordinate checks.

- time_unit:

  Time unit: `"auto"`, `"seconds"`, `"milliseconds"`, or `"samples"`.

- sampling_rate_hz:

  Sampling rate required for sample-index time.

- expected_sampling_rate_hz:

  Optional expected sampling rate.

- sampling_tolerance:

  Relative tolerance around the expected sampling interval.

- missing_threshold:

  Maximum acceptable missing-gaze proportion.

- gap_multiplier:

  A gap is flagged when it exceeds this multiple of the expected or
  median interval.

## Value

A `"gazepoint_gaze_validation"` object containing row-level flags, group
summaries, checks, an overall summary, and resolved settings.
