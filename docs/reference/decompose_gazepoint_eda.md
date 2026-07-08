# Decompose Gazepoint GSR/EDA into tonic and phasic components

Creates descriptive tonic and phasic EDA columns from Gazepoint GSR/EDA
data. If vendor-provided tonic/phasic columns such as `GSR_US_TONIC` and
`GSR_US_PHASIC` are available, they are used by default. Otherwise, a
simple rolling-median tonic estimate is used and the phasic component is
calculated as signal minus tonic. This helper is intentionally
conservative and does not replace specialised biosignal-processing
software.

## Usage

``` r
decompose_gazepoint_eda(
  data,
  signal_col = NULL,
  tonic_col = NULL,
  phasic_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  window_size = 31L,
  output_prefix = "eda",
  overwrite = FALSE
)
```

## Arguments

- data:

  A data frame.

- signal_col:

  Optional GSR/EDA signal column. If `NULL`, a likely conductance-like
  column is detected.

- tonic_col:

  Optional existing tonic column.

- phasic_col:

  Optional existing phasic column.

- time_col:

  Optional time/order column.

- group_cols:

  Optional grouping columns.

- window_size:

  Rolling-median window size used when existing tonic/phasic columns are
  not available. Even values are increased by one.

- output_prefix:

  Prefix for output columns.

- overwrite:

  Logical. Should existing output columns be overwritten?

## Value

A data frame with added tonic, phasic, and method columns. Attributes
include `overview` and `settings`.

## Examples

``` r
df <- data.frame(CNT = 1:10, GSR_US = seq(1, 2, length.out = 10))
out <- decompose_gazepoint_eda(df, signal_col = "GSR_US", window_size = 3)
names(out)
#> [1] "CNT"                      "GSR_US"
#> [3] "eda_tonic"                "eda_phasic"
#> [5] "eda_decomposition_method"
```
