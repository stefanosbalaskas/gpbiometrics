# Simulate Gazepoint-style gaze and pupil data

Generates synthetic Gazepoint-like eye-tracking data with time stamps,
gaze coordinates, fixation identifiers, pupil diameter, validity
columns, and random blink intervals. The output is intended for
teaching, examples, testing, smoke tests, and vignette demonstrations;
it is not a physiological ground-truth simulator.

## Usage

``` r
simulate_gazepoint_eye_data(params = list())
```

## Arguments

- params:

  Named list of simulation parameters. Supported entries include `n`,
  `duration_s`, `sampling_rate_hz`, `seed`, `participant_id`,
  `trial_id`, `screen_bounds`, `n_fixations`, `fixation_mean_s`,
  `fixation_sd_s`, `gaze_noise_sd`, `saccade_samples`, `pupil_mean`,
  `pupil_sd`, `pupil_drift_sd`, `blink_rate_per_min`,
  `blink_duration_mean_s`, `blink_duration_sd_s`,
  `include_invalid_gaze`, and `invalid_gaze_prop`.

## Value

A data frame with Gazepoint-style columns, including `time_s`,
`MSTIMER`, `BPOGX`, `BPOGY`, `FPOGX`, `FPOGY`, `LPD`, `RPD`, `LPV`,
`RPV`, `fixation_id`, `in_blink`, `blink_id`, `participant`, and
`trial`.

## Examples

``` r
dat <- simulate_gazepoint_eye_data(list(n = 120, seed = 1))
#> Error in simulate_gazepoint_eye_data(list(n = 120, seed = 1)): could not find function "simulate_gazepoint_eye_data"
head(dat)
#> Error: object 'dat' not found
```
