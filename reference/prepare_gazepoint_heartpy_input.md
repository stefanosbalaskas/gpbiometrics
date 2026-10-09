# Prepare Gazepoint pulse/PPG data for HeartPy-style workflows

Creates a compact table with time, signal, and optional grouping columns
from Gazepoint Biometrics exports. No files are written unless
output_dir is supplied.

## Usage

``` r
prepare_gazepoint_heartpy_input(
  data,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL,
  output_dir = NULL,
  prefix = "gazepoint_heartpy"
)
```

## Arguments

- data:

  Data frame containing Gazepoint biometric samples.

- signal_col:

  Pulse/PPG signal column. If NULL, a likely column is inferred.

- time_col:

  Time column in seconds. If NULL, a likely column is inferred or
  created from sampling_rate_hz.

- group_cols:

  Optional grouping columns such as participant or trial identifiers.

- sampling_rate_hz:

  Sampling rate in Hz. Required if time_col cannot be inferred.

- output_dir:

  Optional directory for CSV export. If NULL, no files are written.

- prefix:

  File prefix used when output_dir is supplied.

## Value

A list with signal_table, sampling_rate_hz, group_summary, and path.
