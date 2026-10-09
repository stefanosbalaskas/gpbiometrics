# Extract geometric HRV features

Computes dependency-light geometric HRV descriptors, including the HRV
triangular index and an approximate TINN-style triangular interpolation
width.

## Usage

``` r
extract_gazepoint_hrv_geometric(
  dat,
  ibi_col = "IBI",
  group_cols = NULL,
  bin_width = NULL
)
```

## Arguments

- dat:

  A data frame.

- ibi_col:

  Numeric IBI/RR interval column.

- group_cols:

  Optional grouping columns.

- bin_width:

  Histogram bin width in the same units as `ibi_col`.

## Value

A list with `overview`, `features`, and `settings`.
