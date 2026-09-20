# Experimental topology-aware PPG morphology features

Uses H0 persistence lifetimes, represented by Euclidean
minimum-spanning-tree edge lengths over a delay embedding. The output is
explicitly a structural waveform descriptor, not a direct physiological
surrogate.

## Usage

``` r
ppg_topology_features(signal, delay = 2L, dimension = 3L, max_points = 300L)
```

## Arguments

- signal:

  Numeric PPG signal.

- delay:

  Embedding delay in samples.

- dimension:

  Embedding dimension.

- max_points:

  Maximum embedded points used by the diagnostic.

## Value

A named list of topology-aware structural summaries.
