# Extract heartbeat candidates from Gazepoint pulse using k-means

Uses k-means clustering on the raw pulse waveform to classify likely
heartbeat regions and then selects local extrema as beat candidates.
This is a Gazepoint Biometrics-oriented fallback for difficult pulse
waveforms, not an ECG-equivalent R-peak detector.

## Usage

``` r
extract_gazepoint_beats_kmeans(
  dat,
  pulse_col = "HRP",
  time_col = "CNT",
  group_cols = NULL,
  k = 2,
  peak_polarity = c("positive", "negative"),
  min_distance_s = 0.3,
  sampling_rate = NULL,
  seed = NULL
)
```

## Arguments

- dat:

  A data frame.

- pulse_col:

  Numeric pulse/PPG column.

- time_col:

  Numeric time column.

- group_cols:

  Optional grouping columns.

- k:

  Number of k-means clusters.

- peak_polarity:

  `"positive"` or `"negative"`.

- min_distance_s:

  Minimum time between selected beats.

- sampling_rate:

  Optional sampling rate in Hz.

- seed:

  Optional random seed.

## Value

A list with `overview`, `beat_table`, `interval_table`, `timeseries`,
and `settings`.
