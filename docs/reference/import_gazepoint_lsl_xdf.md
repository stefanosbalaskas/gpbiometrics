# Import Gazepoint-related streams from an LSL/XDF file

Reads an XDF file through the optional Python `pyxdf` package via
`reticulate`. This supports high-end LSL workflows without making Python
a hard dependency of gpbiometrics.

## Usage

``` r
import_gazepoint_lsl_xdf(
  path,
  stream_name_pattern = "Gazepoint|GP3|GSR|EDA|Biometric|TTL|Pupil|Gaze",
  include_all_streams = FALSE,
  flatten = TRUE,
  pyxdf_module = "pyxdf"
)
```

## Arguments

- path:

  Path to an `.xdf` file.

- stream_name_pattern:

  Regular expression used to identify Gazepoint-like streams when
  `include_all_streams = FALSE`.

- include_all_streams:

  Logical. If `TRUE`, return all streams.

- flatten:

  Logical. If `TRUE`, convert streams to data frames where possible.

- pyxdf_module:

  Python module name, usually `"pyxdf"`.

## Value

A list with `overview`, `streams`, `header`, and `settings`.
