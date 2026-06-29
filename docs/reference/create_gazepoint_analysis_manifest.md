# Create a Gazepoint analysis manifest

Creates a reproducibility manifest containing package version, files,
settings, outputs, exclusions, and optional session information. If
`path` is supplied, a plain-text manifest is written for audit trails.

## Usage

``` r
create_gazepoint_analysis_manifest(
  files = NULL,
  settings = list(),
  outputs = NULL,
  exclusions = NULL,
  path = NULL,
  include_session = TRUE
)
```

## Arguments

- files:

  Optional character vector of input files.

- settings:

  Optional named list of analysis settings.

- outputs:

  Optional named list or character vector of generated outputs.

- exclusions:

  Optional data frame or named list of exclusions.

- path:

  Optional output path for a text manifest.

- include_session:

  If TRUE, include
  [`sessionInfo()`](https://rdrr.io/r/utils/sessionInfo.html) in the
  return object.

## Value

Manifest list.
