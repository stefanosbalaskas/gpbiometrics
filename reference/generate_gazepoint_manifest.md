# Generate a reproducibility manifest

Creates a conservative analysis manifest containing package/session
information, input file metadata, output paths, user-supplied
parameters, and notes. The function is designed for auditability and
does not inspect private data contents.

## Usage

``` r
generate_gazepoint_manifest(
  input_paths = NULL,
  parameters = list(),
  outputs = NULL,
  notes = NULL,
  write_path = NULL,
  include_session_info = TRUE
)
```

## Arguments

- input_paths:

  Optional character vector of input file or folder paths.

- parameters:

  Optional named list of analysis parameters.

- outputs:

  Optional character vector of output paths or object names.

- notes:

  Optional character vector of free-text notes.

- write_path:

  Optional path. Use `.rds` to save the manifest object; otherwise a
  plain-text manifest is written.

- include_session_info:

  Logical. If `TRUE`, include
  [`utils::sessionInfo()`](https://rdrr.io/r/utils/sessionInfo.html).

## Value

A list with class `gazepoint_manifest`.
