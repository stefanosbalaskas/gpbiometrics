# Detect active Gazepoint biometric channels

Detects whether GSR/EDA, heart-rate, engagement-dial, and TTL channels
are present and whether they appear active. A channel can be present but
inactive when validity flags are zero or the signal contains only zeros
or missing values. For each signal family, `summary_column` identifies
the primary column used for the reported minimum and maximum values.

## Usage

``` r
detect_active_biometric_channels(data)
```

## Arguments

- data:

  A data frame imported from a Gazepoint export.

## Value

A data frame with one row per signal family.
