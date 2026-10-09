# Extract frequency-domain EDA spectral power

Computes power spectral density summaries for an EDA signal, including
spectral power in the EDASymp-inspired 0.045–0.25 Hz band. This is a
descriptive spectral feature and should not be interpreted as direct
stress, emotion, valence, cognition, trust, preference, or diagnosis.

## Usage

``` r
extract_gazepoint_eda_spectral_power(
  dat,
  eda_col = "GSR_US",
  time_col = NULL,
  group_cols = NULL,
  sampling_rate = NULL,
  band = c(0.045, 0.25),
  min_samples = 32,
  detrend = TRUE
)
```

## Arguments

- dat:

  A data frame containing EDA data.

- eda_col:

  EDA/conductance column.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- sampling_rate:

  Optional sampling rate in Hz. Required if `time_col` does not allow
  sampling-rate estimation.

- band:

  Numeric vector of length two defining the frequency band in Hz.

- min_samples:

  Minimum finite samples per group.

- detrend:

  Logical. If `TRUE`, remove a linear trend before spectral analysis.

## Value

A list with `overview`, `spectral_summary`, `settings`, and
interpretation text.
