# Write an interoperability audit

Writes only machine-readable aggregate compatibility information. No
source data, participant identifiers, input filenames, or local data
paths are included.

## Usage

``` r
write_gazepoint_interoperability_audit(
  x,
  output_dir,
  prefix = "gpbiometrics-interoperability",
  overwrite = FALSE
)
```

## Arguments

- x:

  Object returned by
  [`audit_gazepoint_interoperability_versions()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_interoperability_versions.md).

- output_dir:

  Output directory.

- prefix:

  Filename prefix.

- overwrite:

  Logical. Permit replacement of existing files.

## Value

Invisibly returns a named character vector containing the four written
file paths.

## Examples

``` r
audit <- audit_gazepoint_interoperability_versions(
  include_python = FALSE
)
output <- tempfile("gpbiometrics-interoperability-")
files <- write_gazepoint_interoperability_audit(
  audit,
  output
)
basename(files)
#> [1] "gpbiometrics-interoperability-results.csv"
#> [2] "gpbiometrics-interoperability-summary.csv"
#> [3] "gpbiometrics-interoperability-session.csv"
#> [4] "gpbiometrics-interoperability-manifest.csv"
```
