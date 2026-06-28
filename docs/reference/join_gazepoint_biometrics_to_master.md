# Join Gazepoint Biometrics to a master table

Convenience wrapper around
[`sync_gazepoint_biometrics_with_gaze()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/sync_gazepoint_biometrics_with_gaze.md)
for joining biometric data to a `gp3tools`-style master table or any
other analysis-ready gaze table.

## Usage

``` r
join_gazepoint_biometrics_to_master(master, biometrics, by, all_x = TRUE)
```

## Arguments

- master:

  A master gaze or analysis table.

- biometrics:

  A Gazepoint Biometrics data frame.

- by:

  Character vector of key columns used for joining.

- all_x:

  Logical. Should all rows from `master` be retained?

## Value

A data frame with biometric columns joined to the master table.
