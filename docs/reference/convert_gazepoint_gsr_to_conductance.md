# Convert Gazepoint GSR resistance to conductance

Converts GSR resistance values to conductance in microSiemens. The
helper is intentionally conservative. If a conductance column such as
`GSR_US` is already present, the data are returned unchanged unless
`overwrite = TRUE`. If `input_unit = "auto"`, conversion is performed
only when the source column has a resistance-like name, such as
`GSR_OHMS` or `resistance_ohms`.

## Usage

``` r
convert_gazepoint_gsr_to_conductance(
  data,
  gsr_col = NULL,
  output_col = "GSR_US",
  input_unit = c("auto", "ohms", "kohms", "microsiemens"),
  overwrite = FALSE
)
```

## Arguments

- data:

  A data frame.

- gsr_col:

  Optional source GSR column. If `NULL`, a resistance-like column is
  detected when possible.

- output_col:

  Name of the output conductance column.

- input_unit:

  Source unit. `"auto"` converts only resistance-like columns; `"ohms"`
  converts ohms to microSiemens; `"kohms"` converts kilo-ohms to
  microSiemens; `"microsiemens"` copies values to `output_col`.

- overwrite:

  Logical. If `FALSE`, an existing `output_col` is not overwritten.

## Value

The input data frame with a conductance column when conversion is
possible. A structured conversion summary is stored in the
`gsr_conversion_summary` attribute.

## Details

Generic `GSR` columns are not automatically assumed to be resistance
because Gazepoint exports and workflows may represent GSR/EDA
differently. For a generic `GSR` column, use `input_unit = "ohms"` or
`input_unit = "kohms"` only when the study documentation confirms
resistance units.

## Examples

``` r
df <- data.frame(GSR_OHMS = c(1000000, 500000, NA))
convert_gazepoint_gsr_to_conductance(df)
#>   GSR_OHMS GSR_US
#> 1    1e+06      1
#> 2    5e+05      2
#> 3       NA     NA
```
