# Extract BioSPPy-style PPG pulse templates

Extract BioSPPy-style PPG pulse templates

## Usage

``` r
extract_gazepoint_ppg_templates(
  data,
  signal_col = NULL,
  time_col = NULL,
  peaks = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL,
  before_seconds = 0.3,
  after_seconds = 0.6
)
```

## Arguments

- data:

  Data frame or numeric PPG/BVP signal.

- signal_col:

  PPG/BVP column.

- time_col:

  Optional time column.

- peaks:

  Optional peak table or peak indices.

- group_cols:

  Optional grouping columns.

- sampling_rate_hz:

  Sampling rate in Hz.

- before_seconds:

  Seconds before peak.

- after_seconds:

  Seconds after peak.

## Value

List with templates, average template, and template time.
