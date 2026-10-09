# Compute pyHRV-style PSD waterfall over segments

Compute pyHRV-style PSD waterfall over segments

## Usage

``` r
compute_gazepoint_pyhrv_psd_waterfall(
  nni_ms,
  segment_seconds = 300,
  method = c("welch", "lomb", "ar"),
  plot = FALSE
)
```

## Arguments

- nni_ms:

  Numeric NN intervals in milliseconds.

- segment_seconds:

  Segment length.

- method:

  Frequency method.

- plot:

  If TRUE, draw a heatmap-style waterfall.

## Value

List with PSD grid and segment measures.
