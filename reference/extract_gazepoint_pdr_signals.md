# Extract PPG-derived respiration proxy signals

Extracts dependency-light PPG-derived respiration proxy features from a
Gazepoint pulse/PPG waveform. The function estimates
respiration-modulated pulse features such as respiratory-induced
intensity variability (RIIV), pulse amplitude variability (PAV), pulse
width variability (PWV), and pulse-rate variability (PRV).

## Usage

``` r
extract_gazepoint_pdr_signals(
  dat,
  ppg_col = "HRP",
  time_col = "CNT",
  group_cols = NULL,
  sampling_rate = NULL,
  min_peak_distance_s = 0.3,
  smooth_window = 5,
  respiration_band = c(0.1, 0.6),
  pdr_resample_rate = 4
)
```

## Arguments

- dat:

  A data frame containing a PPG/pulse waveform.

- ppg_col:

  Numeric PPG/pulse waveform column, often `HRP`.

- time_col:

  Numeric time column.

- group_cols:

  Optional grouping columns.

- sampling_rate:

  Optional sampling rate in Hz. If `NULL`, estimated from `time_col`.

- min_peak_distance_s:

  Minimum plausible distance between pulse peaks.

- smooth_window:

  Number of samples used for simple moving-average smoothing before peak
  detection.

- respiration_band:

  Expected respiration-frequency band in Hz.

- pdr_resample_rate:

  Resampling rate used for spectral estimation of PDR proxy signals.

## Value

A list with `overview`, `pulse_features`, `pdr_timeseries`,
`pdr_summary`, and `settings`.

## Details

These are proxy respiratory features. They should not be treated as a
replacement for a respiration belt or clinical respiratory measurement.
