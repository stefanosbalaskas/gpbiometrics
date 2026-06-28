# Plot breathing-rate spectrum from Gazepoint RR/IBI intervals

Plot breathing-rate spectrum from Gazepoint RR/IBI intervals

## Usage

``` r
plot_gazepoint_ppg_breathing(
  rr_ms,
  rr_time_s = NULL,
  resample_hz = 4,
  breathing_band = c(0.1, 0.5)
)
```

## Arguments

- rr_ms:

  RR/IBI intervals in milliseconds.

- rr_time_s:

  Optional interval timestamps.

- resample_hz:

  RR interpolation frequency.

- breathing_band:

  Breathing frequency band.

## Value

Invisibly returns breathing-rate object.
