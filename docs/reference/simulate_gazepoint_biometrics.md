# Simulate Gazepoint-style biometric signals

Generates synthetic Gazepoint-style EDA, PPG, HR, IBI, and TTL-like
signals with known ground-truth events. This is intended for teaching,
examples, unit tests, and model-validation workflows. It does not
generate real participant physiology.

## Usage

``` r
simulate_gazepoint_biometrics(
  n_seconds = 120,
  sampling_rate = 60,
  participant_id = "sim_p1",
  scr_onsets = NULL,
  scr_rate_per_min = 4,
  pulse_rate_bpm = 72,
  respiration_rate_bpm = 15,
  eda_noise_sd = 0.01,
  ppg_noise_sd = 0.02,
  include_ttl = TRUE,
  seed = NULL
)
```

## Arguments

- n_seconds:

  Duration in seconds.

- sampling_rate:

  Sampling rate in Hz.

- participant_id:

  Participant identifier.

- scr_onsets:

  Optional SCR onset times in seconds.

- scr_rate_per_min:

  Expected SCR events per minute when `scr_onsets` is `NULL`.

- pulse_rate_bpm:

  Mean pulse rate.

- respiration_rate_bpm:

  Respiration-modulation rate.

- eda_noise_sd:

  EDA noise SD.

- ppg_noise_sd:

  PPG noise SD.

- include_ttl:

  Logical. If `TRUE`, adds TTL0 pulses at SCR onsets.

- seed:

  Optional random seed.

## Value

A list with `overview`, `data`, `ground_truth`, and `settings`.
