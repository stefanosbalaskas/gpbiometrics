# Estimate live LSL clock offsets through pylsl

Resolves active LSL streams and repeatedly calls each inlet's
`time_correction()` method. The returned correction is ready to pass to
[`sync_gazepoint_signals_via_lsl()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/sync_gazepoint_signals_via_lsl.md)
as a value added to remote timestamps.

## Usage

``` r
estimate_gazepoint_lsl_clock_offsets(
  stream_name = NULL,
  stream_type = NULL,
  source_id = NULL,
  timeout_s = 5,
  n_estimates = 5L,
  pause_s = 0.05,
  python = NULL,
  execute = TRUE
)
```

## Arguments

- stream_name:

  Optional exact LSL stream name.

- stream_type:

  Optional exact LSL stream type.

- source_id:

  Optional exact LSL source ID.

- timeout_s:

  Resolution and first-correction timeout.

- n_estimates:

  Number of offset estimates per stream.

- pause_s:

  Pause between estimates.

- python:

  Optional Python executable or Windows `py` launcher.

- execute:

  If `FALSE`, return a dry-run specification.

## Value

A `"gazepoint_lsl_clock_offsets"` object with raw estimates,
stream-level summaries, and named median offsets.
