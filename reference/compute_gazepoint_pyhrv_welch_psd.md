# Compute pyHRV-style Welch PSD

Compute pyHRV-style Welch PSD

## Usage

``` r
compute_gazepoint_pyhrv_welch_psd(
  nni_ms,
  time_s = NULL,
  resample_hz = 4,
  window_seconds = 256,
  overlap = 0.5
)
```

## Arguments

- nni_ms:

  Numeric NN intervals in milliseconds.

- time_s:

  Optional time vector in seconds.

- resample_hz:

  Resampling frequency.

- window_seconds:

  Welch window length.

- overlap:

  Window overlap proportion.

## Value

List with PSD and measures.
