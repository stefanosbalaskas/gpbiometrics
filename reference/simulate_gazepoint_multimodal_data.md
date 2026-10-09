# Simulate a small multimodal Gazepoint-style dataset

Generates deterministic synthetic biometric, pupil/gaze, event, AOI, and
fixation tables for tests, examples, and smoke-test workflows. The
output is for software demonstration only and should not be treated as
physiological validation data.

## Usage

``` r
simulate_gazepoint_multimodal_data(
  n = NULL,
  duration_s = 20,
  sampling_rate_hz = 50,
  seed = 1,
  participant = "P01",
  n_trials = 4
)
```

## Arguments

- n:

  Number of samples.

- duration_s:

  Recording duration in seconds.

- sampling_rate_hz:

  Sampling rate in Hz. If supplied, overrides `n`.

- seed:

  Optional random seed.

- participant:

  Participant identifier.

- n_trials:

  Number of trial/event periods.

## Value

Named list with `biometrics`, `eye`, `events`, `fixations`, and
`metadata`.
