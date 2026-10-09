# Import a folder of Gazepoint Biometrics exports

Reads rectangular Gazepoint CSV exports from a folder and combines files
that contain at least one known Gazepoint Biometrics column. This
function is designed for all-gaze and fixation-style exports.
Multi-section Gazepoint Data Summary files should be parsed separately.

## Usage

``` r
import_gazepoint_biometric_folder(
  path,
  pattern = "\\.csv$",
  recursive = FALSE,
  include_fixations = TRUE,
  include_all_gaze = TRUE,
  include_other_csv = FALSE,
  na = c("", "NA", "NaN")
)
```

## Arguments

- path:

  Folder containing Gazepoint CSV exports.

- pattern:

  Regular expression used to identify candidate CSV files.

- recursive:

  Should subfolders be searched?

- include_fixations:

  Should files with `"fixation"` in the file name be included?

- include_all_gaze:

  Should files with `"all_gaze"` in the file name be included?

- include_other_csv:

  Should other CSV files be attempted? The default is `FALSE` to avoid
  accidentally trying to parse multi-section `Data_Summary_export` files
  as rectangular data.

- na:

  Values that should be treated as missing.

## Value

A data frame with all imported rows combined. The output includes a
`source_file` column and has class `"gazepoint_biometrics_folder"`.
