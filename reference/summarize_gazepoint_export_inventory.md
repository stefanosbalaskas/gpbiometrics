# Summarize Gazepoint export inventory

Creates a descriptive file inventory for a Gazepoint export folder or a
vector of files. The function summarizes paths, extensions, file sizes,
likely export types, and empty-file flags. It is intended for
reproducibility and audit reporting only.

## Usage

``` r
summarize_gazepoint_export_inventory(
  path,
  recursive = TRUE,
  include_hidden = FALSE,
  classify = TRUE
)
```

## Arguments

- path:

  Directory path, file path, or character vector of file paths.

- recursive:

  Logical. If `TRUE`, directories are searched recursively.

- include_hidden:

  Logical. If `TRUE`, hidden files are included.

- classify:

  Logical. If `TRUE`, likely Gazepoint export types are inferred from
  file names using conservative keyword rules.

## Value

A data frame with class `gazepoint_export_inventory`.
