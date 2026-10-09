# Standardise Gazepoint biometric column names

Standardises common Gazepoint Biometrics column-name variants to stable
canonical names. The helper is intentionally conservative: it recognises
common biometric, timing, marker, participant, and stimulus columns, but
it leaves unknown columns unchanged apart from optional snake-case
cleaning.

## Usage

``` r
standardise_gazepoint_biometric_names(
  data,
  style = c("canonical", "snake"),
  rename = TRUE
)
```

## Arguments

- data:

  A data frame or a character vector of column names.

- style:

  Naming style to return. `"canonical"` returns uppercase
  Gazepoint-style names for recognised columns. `"snake"` returns
  lowercase snake-case names.

- rename:

  Logical. If `data` is a data frame, should the returned data frame
  have standardised names? If `FALSE`, a name-mapping table is returned.

## Value

If `data` is a character vector, a character vector of standardised
names. If `data` is a data frame and `rename = TRUE`, the data frame
with standardised names. If `rename = FALSE`, a data frame mapping
original names to standardised names.

## Examples

``` r
standardise_gazepoint_biometric_names(c("time ms", "heart rate", "eda uS"))
#> [1] "TIME_MS" "HR"      "GSR_US" 

df <- data.frame(`time ms` = 1:3, `heart rate` = c(70, 72, 71))
names(standardise_gazepoint_biometric_names(df))
#> [1] "TIME_MS" "HR"     
```
