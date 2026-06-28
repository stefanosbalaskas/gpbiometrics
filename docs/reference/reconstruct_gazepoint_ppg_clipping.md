# Detect and reconstruct clipped pulse/PPG samples

Detect and reconstruct clipped pulse/PPG samples

## Usage

``` r
reconstruct_gazepoint_ppg_clipping(
  x,
  near_max_prop = 0.02,
  flat_diff_prop = 0.001,
  min_run = 2L
)
```

## Arguments

- x:

  Numeric pulse/PPG signal.

- near_max_prop:

  Proportion of the observed range used to define near-maximum samples.

- flat_diff_prop:

  Proportion of the observed range used to define near-flat differences.

- min_run:

  Minimum number of consecutive clipped samples.

## Value

A list with signal, clipped, and runs.
