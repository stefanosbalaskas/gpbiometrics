# Calculate respiration-informed RSA proxy features

Calculates dependency-light RSA proxy summaries from IBI/RR intervals
and, optionally, PPG-derived respiration features from
[`extract_gazepoint_pdr_signals()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/extract_gazepoint_pdr_signals.md).
This provides peak-to-trough and Porges-Bohrer-inspired band-power proxy
summaries. These outputs should be interpreted as respiration-informed
HRV/RSA features, not direct clinical vagal-tone estimates.

## Usage

``` r
calculate_gazepoint_rsa(
  dat,
  ibi_col = "IBI",
  time_col = "CNT",
  group_cols = NULL,
  pdr = NULL,
  resp_rate_hz = NULL,
  respiration_band = c(0.12, 0.4),
  resample_rate = 4
)
```

## Arguments

- dat:

  A data frame containing IBI/RR data.

- ibi_col:

  IBI/RR interval column.

- time_col:

  Time column for the IBI/RR observations.

- group_cols:

  Optional grouping columns.

- pdr:

  Optional output from
  [`extract_gazepoint_pdr_signals()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/extract_gazepoint_pdr_signals.md).

- resp_rate_hz:

  Optional fixed respiration rate in Hz.

- respiration_band:

  Default respiration/HF band when no PDR rate is available.

- resample_rate:

  Resampling rate for spectral RSA proxy calculation.

## Value

A list with `overview`, `rsa_summary`, and `settings`.
