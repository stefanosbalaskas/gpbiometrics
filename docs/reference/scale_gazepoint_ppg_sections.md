# Scale Gazepoint pulse/PPG signals within sections

Scale Gazepoint pulse/PPG signals within sections

## Usage

``` r
scale_gazepoint_ppg_sections(
  data,
  signal_col = NULL,
  section_cols = NULL,
  method = c("zscore", "minmax", "robust", "center", "none"),
  output_col = "ppg_scaled",
  range = c(0, 1)
)
```

## Arguments

- data:

  Data frame or numeric signal.

- signal_col:

  Signal column when data is a data frame.

- section_cols:

  Optional section/grouping columns.

- method:

  Scaling method.

- output_col:

  Name of the scaled output column.

- range:

  Output range for minmax scaling.

## Value

Data frame with an added scaled column, or a scaled vector for numeric
input.
