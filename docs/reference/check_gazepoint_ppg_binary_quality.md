# Check binary quality of Gazepoint pulse/PPG analysis results

Check binary quality of Gazepoint pulse/PPG analysis results

## Usage

``` r
check_gazepoint_ppg_binary_quality(
  measures = NULL,
  peaks = NULL,
  min_peaks = 5L,
  bpm_range = c(40, 180),
  max_missing_prop = 0.25
)
```

## Arguments

- measures:

  Optional measures table.

- peaks:

  Optional peaks table.

- min_peaks:

  Minimum accepted peaks.

- bpm_range:

  Plausible BPM range.

- max_missing_prop:

  Maximum missing proportion, if available.

## Value

Data frame with binary quality status.
