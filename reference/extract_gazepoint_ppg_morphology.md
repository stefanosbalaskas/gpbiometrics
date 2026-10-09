# Extract simple PPG pulse morphology metrics

Extracts peak-centered pulse morphology metrics from a PPG/BVP signal,
including rise time, decay time, half-amplitude width, pulse amplitude,
and a simple post-peak notch proxy.

## Usage

``` r
extract_gazepoint_ppg_morphology(
  data,
  time_col = NULL,
  ppg_col = NULL,
  peaks = NULL,
  min_peak_distance_s = 0.3
)
```

## Arguments

- data:

  PPG data frame.

- time_col:

  Time column.

- ppg_col:

  PPG/BVP signal column.

- peaks:

  Optional peak indices or peak times.

- min_peak_distance_s:

  Minimum distance between automatically detected peaks.

## Value

Data frame with one row per pulse peak.
