# Record gpbiometrics session information

Record gpbiometrics session information

## Usage

``` r
session_info_gazepoint(
  packages = NULL,
  include_loaded = TRUE,
  timestamp = Sys.time()
)
```

## Arguments

- packages:

  Optional additional packages to report.

- include_loaded:

  Include loaded namespaces.

- timestamp:

  Timestamp recorded in the output.

## Value

A `"gazepoint_session_info"` object containing system metadata, package
versions, and printable session text.
