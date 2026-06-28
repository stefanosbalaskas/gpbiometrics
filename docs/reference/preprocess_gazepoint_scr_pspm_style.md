# Preprocess Gazepoint SCR/GSR data PsPM-style

Preprocess Gazepoint SCR/GSR data PsPM-style

## Usage

``` r
preprocess_gazepoint_scr_pspm_style(
  data,
  signal_col = NULL,
  time_col = NULL,
  sampling_rate_hz = NULL,
  range = c(0, 50),
  slope_limit_per_s = 10,
  clipping_tolerance = 1e-05,
  clipping_seconds = 0.5,
  min_valid_island_seconds = 1,
  artifact_epoch_seconds = 0.25,
  smoothing_seconds = 0.25
)
```

## Arguments

- data:

  Gazepoint data frame or numeric SCR/GSR signal.

- signal_col:

  SCR/GSR column.

- time_col:

  Time column.

- sampling_rate_hz:

  Sampling rate for numeric input or missing time.

- range:

  Valid signal range.

- slope_limit_per_s:

  Maximum absolute slope per second.

- clipping_tolerance:

  Difference threshold for flat clipping detection.

- clipping_seconds:

  Minimum flat-run duration.

- min_valid_island_seconds:

  Minimum valid island length.

- artifact_epoch_seconds:

  Seconds to expand around detected artefacts.

- smoothing_seconds:

  Smoothing window after artefact correction.

## Value

List with processed signal, artifact table, summary, and settings.
