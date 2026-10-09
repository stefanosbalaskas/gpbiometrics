# Extract NN intervals from peak timestamps

Extract NN intervals from peak timestamps

## Usage

``` r
extract_gazepoint_pyhrv_nn_intervals(
  peaks,
  peak_time_col = "peak_time_s",
  time_unit = c("seconds", "milliseconds")
)
```

## Arguments

- peaks:

  Data frame with peak timestamps, or numeric peak timestamps.

- peak_time_col:

  Peak timestamp column when peaks is a data frame.

- time_unit:

  Unit of peak timestamps: seconds or milliseconds.

## Value

Numeric NN intervals in milliseconds.
