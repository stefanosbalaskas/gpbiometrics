# Write prepared Gazepoint data to an MNE FIF file

Uses an external Python installation containing `numpy` and `mne`.
Python is invoked only when `execute = TRUE`; no Python package is an R
dependency.

## Usage

``` r
write_gazepoint_mne_fif(
  x,
  fname,
  events = NULL,
  overwrite = FALSE,
  fmt = c("single", "double"),
  python = NULL,
  execute = TRUE,
  keep_intermediate = FALSE,
  verbose = FALSE,
  ...
)
```

## Arguments

- x:

  A `"gazepoint_mne_input"` object or a data frame accepted by
  [`prepare_gazepoint_mne_input()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_mne_input.md).

- fname:

  Output filename. Use an MNE-compatible suffix such as `"_raw.fif"` or
  `"_raw.fif.gz"`.

- events:

  Optional `"gazepoint_mne_events"` object or three-column event matrix.
  Prepared event objects are also attached as MNE annotations.

- overwrite:

  Overwrite an existing file.

- fmt:

  FIF numeric format: `"single"` or `"double"`.

- python:

  Optional Python executable or Windows `py` launcher.

- execute:

  If `FALSE`, return a dry-run specification.

- keep_intermediate:

  Retain temporary CSV, TSV, and Python files.

- verbose:

  Show Python/MNE output.

- ...:

  Arguments passed to
  [`prepare_gazepoint_mne_input()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_mne_input.md)
  when `x` is a data frame.

## Value

A `"gazepoint_mne_fif_export"` object.
