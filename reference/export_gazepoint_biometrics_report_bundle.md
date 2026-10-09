# Export a Gazepoint biometrics report bundle

Exports selected report tables, text outputs, optional plot objects, and
a manifest to a local output directory. This helper is intended for
reproducible reporting. It does not commit files and should not be used
to export private real-data outputs into a package repository.

## Usage

``` r
export_gazepoint_biometrics_report_bundle(
  bundle = NULL,
  output_dir,
  prefix = "gpbiometrics_report",
  tables = NULL,
  text = NULL,
  plots = NULL,
  include_readme = TRUE,
  include_session_info = TRUE,
  overwrite = FALSE
)
```

## Arguments

- bundle:

  Optional list-like object containing data frames, text, or plots.

- output_dir:

  Output directory.

- prefix:

  File prefix.

- tables:

  Optional named list of data frames to export as CSV files.

- text:

  Optional named list or character vector of text outputs to export as
  TXT files.

- plots:

  Optional named list of ggplot objects to export as PNG files.

- include_readme:

  Logical. Should a README text file be written?

- include_session_info:

  Logical. Should session information be written?

- overwrite:

  Logical. Should existing files be overwritten?

## Value

A list with `overview`, `manifest`, `output_dir`, and `settings`.
