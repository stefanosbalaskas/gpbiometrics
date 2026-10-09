# Compare Gazepoint export-folder profiles

Compare two or more objects created by
[`profile_gazepoint_export_folder()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/profile_gazepoint_export_folder.md).
The comparison reports folder-level dimensions and column-role coverage
across profiles.

## Usage

``` r
compare_gazepoint_export_profiles(..., labels = NULL)
```

## Arguments

- ...:

  Profile objects returned by
  [`profile_gazepoint_export_folder()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/profile_gazepoint_export_folder.md),
  or a single list of profile objects.

- labels:

  Optional labels for the profiles.

## Value

A list with class `"gazepoint_export_profile_comparison"`.
