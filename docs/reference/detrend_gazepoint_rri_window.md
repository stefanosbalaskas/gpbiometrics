# Detrend RRI/IBI intervals in windows

Detrend RRI/IBI intervals in windows

## Usage

``` r
detrend_gazepoint_rri_window(
  rri_ms,
  time_s = NULL,
  window_seconds = 60,
  method = c("median", "mean", "linear")
)
```

## Arguments

- rri_ms:

  Numeric RRI/IBI intervals in milliseconds.

- time_s:

  Optional time vector.

- window_seconds:

  Window length for local trend.

- method:

  mean, median, or linear.

## Value

Data frame with original, trend, and detrended RRI.
