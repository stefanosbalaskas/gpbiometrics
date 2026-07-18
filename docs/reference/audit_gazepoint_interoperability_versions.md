# Audit external interoperability versions

Checks whether declared bridge functions are exported and records the
installed versions of optional R and Python dependencies. Missing
optional dependencies are recorded for review rather than treated as
core-package failures.

## Usage

``` r
audit_gazepoint_interoperability_versions(
  manifest = gazepoint_interoperability_manifest(),
  include_python = TRUE,
  strict = FALSE
)
```

## Arguments

- manifest:

  Interoperability manifest. Defaults to
  [`gazepoint_interoperability_manifest()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/gazepoint_interoperability_manifest.md).

- include_python:

  Logical. Inspect the active Python environment through the optional
  `reticulate` package.

- strict:

  Logical. Stop when a required contract fails, a declared bridge
  function is missing, or an installed dependency is below its minimum
  tested version.

## Value

An object of class `"gazepoint_interoperability_audit"` containing:

- `results`: target-level compatibility findings;

- `summary`: aggregate pass and review counts;

- `session`: R, Python, operating-system, package, and timestamp
  metadata;

- `manifest`: the manifest used for the audit.

## Details

Python package versions are queried through `importlib.metadata`; target
modules are not imported merely to determine their versions.

## Examples

``` r
audit <- audit_gazepoint_interoperability_versions(
  include_python = FALSE
)
audit$summary
#>   n_targets n_pass n_fail n_review n_available n_missing_optional overall_pass
#> 1        11     11      0       10           4                  0         TRUE
```
