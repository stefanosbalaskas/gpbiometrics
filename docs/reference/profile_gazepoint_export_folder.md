# Profile a Gazepoint export folder before analysis

Create a compact, auditable profile of a Gazepoint-style export folder
before running a full workflow. The profiler inspects files, row and
column counts, likely Gazepoint column roles, missingness, numeric
signal activity, constant columns, all-zero columns, and read errors.

## Usage

``` r
profile_gazepoint_export_folder(
  path,
  pattern = "\\.csv$",
  recursive = FALSE,
  max_files = Inf,
  max_rows = Inf,
  na.strings = c("", "NA", "NaN")
)
```

## Arguments

- path:

  Path to a folder containing Gazepoint-style export files.

- pattern:

  File-name regular expression. Defaults to CSV files.

- recursive:

  Logical. If `TRUE`, search subfolders recursively.

- max_files:

  Maximum number of matching files to inspect.

- max_rows:

  Maximum number of rows to read per file for profiling. Use `Inf` to
  read complete files.

- na.strings:

  Character vector of strings to treat as missing values.

## Value

A list with class `"gazepoint_export_folder_profile"` containing
`overview`, `files`, `columns`, `warnings`, and `settings` tables.

## Examples

``` r
demo_dir <- system.file(
  "extdata",
  "gazepoint_biometrics_kiosk_demo_exports",
  package = "gpbiometrics"
)

if (nzchar(demo_dir)) {
  profile <- profile_gazepoint_export_folder(demo_dir, max_files = 2)
  profile
}
#> Gazepoint export folder profile
#> --------------------------------
#>                                                                                                                                     path
#>  C:/Users/Stefanos-PC/AppData/Local/Temp/Rtmp0AaltD/temp_libpath9781c936edb/gpbiometrics/extdata/gazepoint_biometrics_kiosk_demo_exports
#>  n_files n_readable_files n_read_errors total_rows_profiled total_size_bytes
#>        2                2             0                1921           887560
#>  n_unique_extensions n_unique_column_sets any_time_columns any_ttl_columns
#>                    1                    2             TRUE            TRUE
#>  any_aoi_columns any_signal_columns
#>             TRUE               TRUE
#>
#> Warnings
#>  severity                    issue
#>      info     multiple_column_sets
#>      info all_zero_numeric_columns
#>                                        message
#>   Readable files contain 2 unique column sets.
#>  5 numeric column occurrence(s) were all zero.
```
