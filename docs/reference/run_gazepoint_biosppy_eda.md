# Run BioSPPy-style Gazepoint EDA processing

Run BioSPPy-style Gazepoint EDA processing

## Usage

``` r
run_gazepoint_biosppy_eda(
  data,
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL,
  smoothing_seconds = 4
)
```

## Arguments

- data:

  Data frame or numeric EDA/GSR signal.

- signal_col:

  EDA/GSR column.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- sampling_rate_hz:

  Sampling rate in Hz.

- smoothing_seconds:

  Window used for tonic smoothing.

## Value

List with raw table, tonic, phasic, events, and recovery estimates.
