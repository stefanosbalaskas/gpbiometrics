# Extract ECG-derived respiration using PCA

Extracts an ECG-derived respiration proxy from beat-level ECG morphology
features using principal component analysis. This function requires
ECG-derived morphology columns, such as QRS amplitudes, widths, or
sampled beat-shape features. It is not intended for HR, IBI, or PPG-only
data.

## Usage

``` r
extract_gazepoint_edr_pca(
  dat,
  ecg_cols,
  time_col = NULL,
  group_cols = NULL,
  n_components = 1,
  scale = TRUE,
  output_prefix = "edr_pca"
)
```

## Arguments

- dat:

  A data frame.

- ecg_cols:

  Numeric ECG morphology columns.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- n_components:

  Number of PCA components to retain.

- scale:

  Logical. If `TRUE`, scale ECG morphology columns before PCA.

- output_prefix:

  Prefix for PCA output columns.

## Value

A list with `overview`, `edr_timeseries`, `component_summary`, and
`settings`.
