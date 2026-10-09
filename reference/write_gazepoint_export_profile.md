# Write a Gazepoint export-folder profile to disk

Export profile tables and a compact text summary.

## Usage

``` r
write_gazepoint_export_profile(
  profile,
  path,
  prefix = "gazepoint_export_profile",
  overwrite = FALSE
)
```

## Arguments

- profile:

  Object returned by
  [`profile_gazepoint_export_folder()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/profile_gazepoint_export_folder.md).

- path:

  Output folder.

- prefix:

  File prefix.

- overwrite:

  Logical. If `FALSE`, existing files are not overwritten.

## Value

A data frame listing written files.
