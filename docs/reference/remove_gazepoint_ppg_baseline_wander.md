# Remove baseline wander from Gazepoint pulse/PPG data

Remove baseline wander from Gazepoint pulse/PPG data

## Usage

``` r
remove_gazepoint_ppg_baseline_wander(
  x,
  sampling_rate_hz,
  method = c("median", "mean"),
  window_seconds = 2
)
```

## Arguments

- x:

  Numeric signal.

- sampling_rate_hz:

  Sampling rate in Hz.

- method:

  Baseline method: median or mean.

- window_seconds:

  Baseline window length.

## Value

Baseline-corrected numeric signal.
