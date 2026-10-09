# Define gpbiometrics interoperability targets

Creates the machine-readable interoperability manifest used by
[`audit_gazepoint_interoperability_versions()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_interoperability_versions.md).
The manifest distinguishes R packages, Python distributions, supporting
Python packages, and external standards.

## Usage

``` r
gazepoint_interoperability_manifest(include_support = TRUE)
```

## Arguments

- include_support:

  Logical. Include NumPy and pandas support rows in addition to the
  direct interoperability targets.

## Value

A data frame of class `"gazepoint_interoperability_manifest"` with one
row per target.

## Details

A minimum tested version records the oldest version exercised by the
maintained interoperability workflow. It is not a claim that every
earlier version is incompatible.

## Examples

``` r
manifest <- gazepoint_interoperability_manifest()
manifest[, c("target", "dependency", "minimum_tested_version")]
#>           target    dependency minimum_tested_version
#> 1   eyetrackingR  eyetrackingR                   <NA>
#> 2  PupillometryR PupillometryR                   <NA>
#> 3          gazeR         gazer                   <NA>
#> 4     MNE-Python           mne                 1.11.0
#> 5          pylsl         pylsl                 1.16.2
#> 6        BioSPPy       biosppy                  2.1.0
#> 7        HeartPy       heartpy                  1.2.7
#> 8          pyHRV         pyhrv                  0.4.1
#> 9           BIDS          BIDS                 1.11.1
#> 10         NumPy         numpy                 1.26.4
#> 11        pandas        pandas                  2.2.3
```
