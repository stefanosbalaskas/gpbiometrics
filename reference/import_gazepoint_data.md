# Import Gazepoint export files from a session folder

Loads Gazepoint-style CSV exports from a folder into a named list of
data frames. The function is intended as a single entry point for common
session folders that contain all-gaze, fixation, summary, biometric,
marker, or related exports.

## Usage

``` r
import_gazepoint_data(
  dir,
  session = NULL,
  pattern = "\\.csv$",
  recursive = FALSE,
  session_match = c("prefix", "contains", "regex"),
  file_encoding = "UTF-8-BOM",
  add_file_info = TRUE
)
```

## Arguments

- dir:

  Folder containing Gazepoint export files.

- session:

  Optional session or participant prefix used to select files. Can be a
  character vector.

- pattern:

  File pattern. Defaults to CSV files.

- recursive:

  If TRUE, search subfolders.

- session_match:

  How `session` should be matched: `"prefix"`, `"contains"`, or
  `"regex"`.

- file_encoding:

  Encoding passed to
  [`read.table()`](https://rdrr.io/r/utils/read.table.html).

- add_file_info:

  If TRUE, add source-file columns to each imported data frame.

## Value

A named list of data frames with class `gazepoint_session_data`. File
metadata are stored in the `file_index` attribute.

## Examples

``` r
if (FALSE) { # \dontrun{
session_data <- import_gazepoint_data("path/to/session", session = "P01")
names(session_data)
attr(session_data, "file_index")
} # }
```
