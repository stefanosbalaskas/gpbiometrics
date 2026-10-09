# Assess Gazepoint HRP waveform quality

Computes descriptive quality-control summaries for a Gazepoint HRP/PPG
waveform column. The output is intended for waveform availability,
missingness, flatness, and timing-gap review. It does not infer
diagnosis, emotion, valence, cognition, preference, or true
physiological state.

## Usage

``` r
assess_gazepoint_hrp_waveform_quality(
  data,
  hrp_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate = NULL,
  time_unit = c("auto", "ms", "seconds", "samples"),
  min_rows = 20,
  min_finite_prop = 0.8,
  max_flat_prop = 0.95,
  flat_tolerance = 1e-08,
  max_gap_multiplier = 3
)
```

## Arguments

- data:

  A Gazepoint biometric data frame or a list containing one.

- hrp_col:

  Optional HRP/PPG waveform column. If `NULL`, common column names are
  detected.

- time_col:

  Optional time, timestamp, or sample-counter column.

- group_cols:

  Optional grouping columns.

- sampling_rate:

  Optional sampling rate in Hz.

- time_unit:

  Unit of `time_col`: `"auto"`, `"ms"`, `"seconds"`, or `"samples"`.

- min_rows:

  Minimum rows required per group.

- min_finite_prop:

  Minimum finite waveform proportion required per group.

- max_flat_prop:

  Maximum allowed proportion of near-zero consecutive differences among
  finite waveform values.

- flat_tolerance:

  Absolute difference threshold used to identify near-flat consecutive
  waveform changes.

- max_gap_multiplier:

  Time gaps larger than this multiple of the median positive time step
  are flagged.

## Value

A list with `overview`, `group_quality`, `row_flags`, and `settings`.
