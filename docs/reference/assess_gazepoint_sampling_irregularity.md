# Assess sampling irregularity in Gazepoint time series

Summarizes median sample interval, effective sampling rate, jitter,
repeated timestamps, negative steps, and large gaps overall or by group.

## Usage

``` r
assess_gazepoint_sampling_irregularity(
  data,
  time_col = NULL,
  group_cols = NULL,
  nominal_rate_hz = NULL,
  large_gap_factor = 3
)
```

## Arguments

- data:

  Data frame or numeric time vector.

- time_col:

  Time column for data-frame input.

- group_cols:

  Optional grouping columns.

- nominal_rate_hz:

  Optional expected sampling rate.

- large_gap_factor:

  Gap threshold relative to median interval.

## Value

Data frame with one row per group.
