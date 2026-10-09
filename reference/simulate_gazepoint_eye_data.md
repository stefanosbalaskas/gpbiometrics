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
head(dat)
#>   participant trial sample_id     time_s MSTIMER     BPOGX     BPOGY     FPOGX
#> 1         P01   T01         1 0.00000000       0 0.6477806 0.4054987 0.6477806
#> 2         P01   T01         2 0.01666667      17 0.6238787 0.4196097 0.6238787
#> 3         P01   T01         3 0.03333333      33 0.6739732 0.3976877 0.6739732
#> 4         P01   T01         4 0.05000000      50 0.6564252 0.4050446 0.6564252
#> 5         P01   T01         5 0.06666667      67 0.6568563 0.3984225 0.6568563
#> 6         P01   T01         6 0.08333333      83 0.6712567 0.3785737 0.6712567
#>       FPOGY      LPD      RPD LPV RPV fixation_id in_blink blink_id
#> 1 0.4054987 3.163688 3.163990   1   1           1    FALSE       NA
#> 2 0.4196097 3.120282 3.122715   1   1           1    FALSE       NA
#> 3 0.3976877 3.160074 3.186528   1   1           1    FALSE       NA
#> 4 0.4050446 3.203904 3.123088   1   1           1    FALSE       NA
#> 5 0.3984225 3.330903 3.304102   1   1           1    FALSE       NA
#> 6 0.3785737 3.148419 3.137793   1   1           1    FALSE       NA
#>   gaze_valid_simulated
#> 1                 TRUE
#> 2                 TRUE
#> 3                 TRUE
#> 4                 TRUE
#> 5                 TRUE
#> 6                 TRUE
```
