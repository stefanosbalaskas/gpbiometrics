# Fuse respiration proxies using a Kalman filter

Fuses two respiration proxy streams, such as PPG-derived respiration and
ECG-derived respiration, using a transparent one-dimensional Kalman
filter. This is a linear Kalman fusion helper. It is not an extended
Kalman filter unless the user supplies nonlinear state/measurement logic
externally.

## Usage

``` r
fuse_gazepoint_respiration_kalman(
  dat,
  primary_col,
  secondary_col,
  time_col = NULL,
  group_cols = NULL,
  process_var = 0.01,
  primary_var = 0.05,
  secondary_var = 0.05,
  output_col = "respiration_kalman_fused"
)
```

## Arguments

- dat:

  A data frame.

- primary_col:

  First respiration proxy column.

- secondary_col:

  Second respiration proxy column.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- process_var:

  Process variance.

- primary_var:

  Measurement variance for `primary_col`.

- secondary_var:

  Measurement variance for `secondary_col`.

- output_col:

  Output fused respiration column.

## Value

A data frame with fused respiration output and Kalman attributes.
