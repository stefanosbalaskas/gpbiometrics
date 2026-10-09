# Extract time-varying spectral EDA features

Computes a dependency-light approximation of TVSymp-style time-varying
spectral EDA power using sliding-window spectral analysis. The default
band is 0.08–0.24 Hz, following the TVSymp literature. This function
does not claim exact VFCDM reproduction.

## Usage

``` r
extract_gazepoint_eda_tvsymp(
  dat,
  eda_col = "GSR_US",
  time_col = "CNT",
  group_cols = NULL,
  sampling_rate = NULL,
  band = c(0.08, 0.24),
  window_seconds = 60,
  step_seconds = 5,
  min_valid_fraction = 0.7,
  normalise = TRUE
)
```

## Arguments

- dat:

  A data frame containing EDA data.

- eda_col:

  Numeric EDA/conductance column.

- time_col:

  Numeric time column.

- group_cols:

  Optional grouping columns.

- sampling_rate:

  Optional sampling rate in Hz. If `NULL`, estimated from `time_col`.

- band:

  Frequency band in Hz used for TVSymp-style power.

- window_seconds:

  Sliding-window length in seconds.

- step_seconds:

  Sliding-window step in seconds.

- min_valid_fraction:

  Minimum valid fraction per window.

- normalise:

  Logical. If `TRUE`, compute EDASympn-style relative band power
  normalised by total positive-frequency power.

## Value

A list with `overview`, `tvsymp_timeseries`, `summary`, and `settings`.
