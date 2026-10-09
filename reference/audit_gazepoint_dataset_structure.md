# Audit Gazepoint dataset structure

Checks a dataset or export folder for expected directories, files,
filename patterns, duplicate names, empty files, and optional sidecar
coverage. This is a lightweight structure audit, not a full BIDS
validator or converter.

## Usage

``` r
audit_gazepoint_dataset_structure(
  root,
  expected_dirs = NULL,
  expected_files = NULL,
  expected_patterns = NULL,
  allowed_extensions = c("csv", "tsv", "txt", "json", "xlsx", "rds"),
  require_sidecars = FALSE,
  recursive = TRUE,
  include_hidden = FALSE
)
```

## Arguments

- root:

  Dataset or export root directory.

- expected_dirs:

  Optional character vector of directory paths expected under `root`.

- expected_files:

  Optional character vector of file paths expected under `root`.

- expected_patterns:

  Optional named or unnamed character vector of regular expressions that
  should match at least one relative file path.

- allowed_extensions:

  Optional character vector of allowed file extensions, without leading
  dots.

- require_sidecars:

  Logical. If `TRUE`, non-sidecar files are flagged when no same-stem
  `.json` sidecar exists.

- recursive:

  Logical. If `TRUE`, files are inventoried recursively.

- include_hidden:

  Logical. If `TRUE`, hidden files are included.

## Value

A list with class `gazepoint_dataset_structure_audit`.
