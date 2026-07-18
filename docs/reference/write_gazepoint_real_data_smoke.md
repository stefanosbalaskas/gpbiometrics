# Write privacy-safe real-data smoke-test summaries

Writes only aggregate dataset summaries, sanitized condition
information, runtime metadata, and non-sensitive settings.

## Usage

``` r
write_gazepoint_real_data_smoke(
  x,
  output_dir,
  prefix = "gpbiometrics-real-data-smoke",
  overwrite = FALSE,
  protect_repository = TRUE
)
```

## Arguments

- x:

  Object returned by
  [`run_gazepoint_real_data_smoke()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_real_data_smoke.md).

- output_dir:

  External output directory.

- prefix:

  Output filename prefix.

- overwrite:

  Permit replacement of existing files?

- protect_repository:

  Reject output directories inside the current package repository?

## Value

Invisibly returns a named character vector of written files.
