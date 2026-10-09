# Extract FuzzyEn and Lorenz-plot CSI HRV features

Computes fuzzy entropy and Lorenz/Poincare-derived cardiac sympathetic
index style descriptors from IBI/RR intervals.

## Usage

``` r
extract_gazepoint_hrv_fuzzy_csi(
  dat,
  ibi_col = "IBI",
  group_cols = NULL,
  m = 2,
  r_multiplier = 0.2,
  fuzzy_power = 2,
  min_intervals = 10
)
```

## Arguments

- dat:

  A data frame.

- ibi_col:

  Numeric IBI/RR interval column.

- group_cols:

  Optional grouping columns.

- m:

  Embedding dimension.

- r_multiplier:

  Tolerance multiplier applied to within-group SD.

- fuzzy_power:

  Fuzzy exponential power.

- min_intervals:

  Minimum intervals per group.

## Value

A list with `overview`, `features`, and `settings`.

## Details

These outputs are nonlinear/geometric HRV descriptors. They do not infer
seizure status, diagnosis, health status, emotion, stress, or cognition.
