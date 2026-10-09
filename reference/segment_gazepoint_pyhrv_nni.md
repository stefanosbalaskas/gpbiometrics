# Segment NN intervals into time windows

Segment NN intervals into time windows

## Usage

``` r
segment_gazepoint_pyhrv_nni(
  nni_ms,
  segment_seconds = 300,
  overlap = 0,
  min_intervals = 3L
)
```

## Arguments

- nni_ms:

  Numeric NN intervals in milliseconds.

- segment_seconds:

  Segment duration.

- overlap:

  Segment overlap proportion.

- min_intervals:

  Minimum intervals per segment.

## Value

Data frame with segment membership.
