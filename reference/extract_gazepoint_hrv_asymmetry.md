# Extract heart-rate asymmetry features

Computes dependency-light heart-rate asymmetry descriptors from IBI/RR
intervals, including acceleration/deceleration proportions, signed run
summaries, and Guzik-style squared-difference asymmetry.

## Usage

``` r
extract_gazepoint_hrv_asymmetry(
  dat,
  ibi_col = "IBI",
  group_cols = NULL,
  zero_tolerance = 0
)
```

## Arguments

- dat:

  A data frame containing IBI/RR intervals.

- ibi_col:

  Numeric IBI/RR interval column.

- group_cols:

  Optional grouping columns.

- zero_tolerance:

  Absolute change below which interval differences are treated as zero.

## Value

A list with `overview`, `features`, `run_table`, and `settings`.

## Details

Positive IBI/RR differences are treated as decelerations because the
heart period lengthens. Negative IBI/RR differences are treated as
accelerations.
