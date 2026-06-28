# Extract respiration proxy using a CEEMDAN-style bridge

Extracts respiration-like components from PPG or ECG-derived respiratory
proxy signals. If `external_fun` is supplied, it is used as the CEEMDAN
backend. Otherwise, the function uses a dependency-light multiscale
decomposition fallback and labels the result accordingly.

## Usage

``` r
extract_gazepoint_respiration_ceemdan(
  dat,
  signal_col,
  time_col = "CNT",
  group_cols = NULL,
  sampling_rate = NULL,
  respiration_band = c(0.1, 0.6),
  scales = c(5, 15, 30, 60, 120),
  external_fun = NULL
)
```

## Arguments

- dat:

  A data frame.

- signal_col:

  Numeric PPG/ECG-derived signal column.

- time_col:

  Numeric time column.

- group_cols:

  Optional grouping columns.

- sampling_rate:

  Optional sampling rate in Hz.

- respiration_band:

  Frequency band in Hz used to select respiration-like components.

- scales:

  Moving-average scales used by the fallback decomposition.

- external_fun:

  Optional function with arguments `x`, `time`, and `sampling_rate`,
  returning either a numeric vector or a list/data frame of components.

## Value

A list with `overview`, `component_table`, `respiration_timeseries`,
`summary`, and `settings`.

## Details

This function does not claim to reproduce full CEEMDAN unless a
validated external CEEMDAN function is supplied.
