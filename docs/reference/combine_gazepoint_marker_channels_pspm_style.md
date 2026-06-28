# Combine multiple Gazepoint marker channels PsPM-style

Combine multiple Gazepoint marker channels PsPM-style

## Usage

``` r
combine_gazepoint_marker_channels_pspm_style(
  data,
  marker_cols = NULL,
  time_col = NULL,
  sampling_rate_hz = NULL,
  group_cols = NULL,
  combined_col = "pspm_marker"
)
```

## Arguments

- data:

  Gazepoint data frame.

- marker_cols:

  Marker columns to combine.

- time_col:

  Time column.

- sampling_rate_hz:

  Sampling rate if time column is absent.

- group_cols:

  Optional grouping columns.

- combined_col:

  Name of combined marker column.

## Value

List with combined data and marker table.
