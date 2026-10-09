# Compute Gazepoint pulse/PPG frequency-domain measures

Compute Gazepoint pulse/PPG frequency-domain measures

## Usage

``` r
compute_gazepoint_ppg_frequency_measures(
  peaks = NULL,
  rr_ms = NULL,
  rr_time_s = NULL,
  group_col = "group",
  method = c("welch", "fft", "periodogram"),
  resample_hz = 4,
  bands = list(lf = c(0.05, 0.15), hf = c(0.15, 0.5)),
  welch_window_seconds = 64,
  welch_overlap = 0.5
)
```

## Arguments

- peaks:

  Optional peak table.

- rr_ms:

  Optional RR/IBI intervals in milliseconds.

- rr_time_s:

  Optional interval timestamps.

- group_col:

  Group column when peaks are supplied.

- method:

  PSD method: fft, periodogram, or welch.

- resample_hz:

  RR interpolation frequency.

- bands:

  Named list of frequency bands.

- welch_window_seconds:

  Welch window length.

- welch_overlap:

  Welch overlap proportion.

## Value

Data frame of frequency-domain measures.
