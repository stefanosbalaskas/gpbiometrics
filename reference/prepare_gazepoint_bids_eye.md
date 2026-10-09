# Prepare an eye-tracking-only BIDS export

A modality-specific convenience wrapper around
[`export_gazepoint_to_bids()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/export_gazepoint_to_bids.md).
Arguments are forwarded without changing the unified export contract.
When the unified exporter exposes modality switches, they are set to
eye-tracking mode automatically.

## Usage

``` r
prepare_gazepoint_bids_eye(data, ..., execute = TRUE)
```

## Arguments

- data:

  Gazepoint eye-tracking data accepted by
  [`export_gazepoint_to_bids()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/export_gazepoint_to_bids.md).

- ...:

  Additional arguments forwarded to
  [`export_gazepoint_to_bids()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/export_gazepoint_to_bids.md).

- execute:

  If `FALSE`, return the resolved call specification without writing
  files.

## Value

The result of
[`export_gazepoint_to_bids()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/export_gazepoint_to_bids.md)
or a dry-run specification.
