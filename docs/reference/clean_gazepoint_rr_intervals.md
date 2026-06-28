# Clean RR or IBI intervals using HeartPy-style methods

Clean RR or IBI intervals using HeartPy-style methods

## Usage

``` r
clean_gazepoint_rr_intervals(
  rr_ms,
  method = c("quotient", "iqr", "modified_z", "zscore", "none"),
  group_col = "group",
  quotient_threshold = 0.2,
  iqr_multiplier = 1.5,
  z_threshold = 3.5
)
```

## Arguments

- rr_ms:

  Numeric RR/IBI intervals in milliseconds, or a peak table.

- method:

  Cleaning method: quotient, iqr, modified_z, zscore, or none.

- group_col:

  Group column when rr_ms is a peak table.

- quotient_threshold:

  Maximum allowed ratio between adjacent intervals.

- iqr_multiplier:

  IQR multiplier for IQR cleaning.

- z_threshold:

  Z-score threshold.

## Value

Cleaned interval table, or cleaned peak table when a peak table is
supplied.
