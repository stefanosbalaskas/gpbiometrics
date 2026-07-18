# Detect saccades in Gazepoint gaze samples

Convenience wrapper around
[`detect_gazepoint_fixations()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_fixations.md)
that returns only the saccade-level event table. Detector settings and
group summaries are retained as attributes.

## Usage

``` r
detect_gazepoint_saccades(...)
```

## Arguments

- ...:

  Additional arguments passed to
  [`detect_gazepoint_fixations()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_fixations.md).

## Value

A data frame with class `"gazepoint_detected_saccades"` containing
saccade timing, amplitude, direction, and velocity measures.

## Examples

``` r
gaze <- data.frame(
  time_s = seq(0, 0.9, by = 0.1),
  gaze_x = c(0, 0.01, 0.02, 0.03, 1, 1.01, 1.02, 1.03, 1.04, 1.05),
  gaze_y = 0
)

detect_gazepoint_saccades(
  gaze,
  time_col = "time_s",
  x_col = "gaze_x",
  y_col = "gaze_y",
  velocity_threshold = 2,
  min_saccade_duration_ms = 50
)
#>   segment_id saccade_id gaze_event_id start_row end_row start_time end_time
#> 1   all_rows          1             2         4       5        0.3      0.4
#>   duration_ms n_samples start_x start_y end_x end_y delta_x delta_y amplitude
#> 1         100         2    0.03       0     1     0    0.97       0      0.97
#>   direction_deg mean_velocity peak_velocity
#> 1             0           4.9           9.7
```
