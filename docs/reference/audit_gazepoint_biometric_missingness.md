# Audit missingness in Gazepoint biometric channels

Summarises missingness and zero values for Gazepoint biometric columns.
This is useful because Gazepoint exports may contain biometric columns
even when a channel was inactive or invalid during recording.

## Usage

``` r
audit_gazepoint_biometric_missingness(data, columns = NULL)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- columns:

  Optional character vector of columns to audit. If `NULL`, known
  present Gazepoint biometric, TTL, and validity columns are audited.

## Value

A data frame with one row per audited column.
