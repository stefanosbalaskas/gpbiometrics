# Scale a Gazepoint pulse/PPG signal

Scale a Gazepoint pulse/PPG signal

## Usage

``` r
scale_gazepoint_ppg_signal(
  x,
  method = c("zscore", "minmax", "robust", "center", "none"),
  range = c(0, 1)
)
```

## Arguments

- x:

  Numeric signal.

- method:

  Scaling method: zscore, minmax, robust, center, or none.

- range:

  Output range for minmax scaling.

## Value

Scaled numeric vector.
