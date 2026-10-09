# Plot a Poincare plot from Gazepoint pulse/PPG peaks or RR intervals

Plot a Poincare plot from Gazepoint pulse/PPG peaks or RR intervals

## Usage

``` r
plot_gazepoint_ppg_poincare(peaks = NULL, rr_ms = NULL, group_col = "group")
```

## Arguments

- peaks:

  Optional peak table.

- rr_ms:

  Optional RR/IBI intervals in milliseconds.

- group_col:

  Group column when peaks are supplied.

## Value

Invisibly returns plotting data and Poincare summaries.
