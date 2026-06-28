# Export Gazepoint pulse/PPG data for HeartPy-style workflows

Export Gazepoint pulse/PPG data for HeartPy-style workflows

## Usage

``` r
export_gazepoint_heartpy_input(
  data,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL,
  output_dir,
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

A list returned by prepare_gazepoint_heartpy_input().
