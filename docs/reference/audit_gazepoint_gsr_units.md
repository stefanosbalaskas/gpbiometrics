# Audit likely GSR/EDA units

Checks whether a Gazepoint GSR/EDA column looks more like conductance in
microSiemens or resistance/impedance-like values in Ohms. This is a
preprocessing safety audit, not a definitive device calibration test.

## Usage

``` r
audit_gazepoint_gsr_units(
  dat,
  gsr_col = "GSR",
  convert = FALSE,
  output_col = NULL,
  resistance_to_us_factor = 1e+06
)
```

## Arguments

- dat:

  A data frame.

- gsr_col:

  Name of the GSR/EDA column to audit.

- convert:

  Logical. If `TRUE`, add a conductance-converted column when the signal
  is likely resistance/impedance-like.

- output_col:

  Output column used when `convert = TRUE`.

- resistance_to_us_factor:

  Conversion factor. For Ohms to microSiemens, use
  `1000000 / resistance`.

## Value

A list with `overview`, `diagnostics`, `recommendation`, and, when
requested, `data`.
