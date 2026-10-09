# Plot Gazepoint pulse/PPG peak detection results

Plot Gazepoint pulse/PPG peak detection results

## Usage

``` r
plot_gazepoint_ppg_peak_detection(
  detection,
  group = NULL,
  accepted_only = FALSE
)
```

## Arguments

- detection:

  Detection object returned by detect_gazepoint_ppg_peaks().

- group:

  Optional group to plot.

- accepted_only:

  Whether to show only accepted peaks.

## Value

Invisibly returns the plotted data.
