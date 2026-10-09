# Import a Gazepoint Biometrics export

Reads a Gazepoint CSV export containing biometric columns such as GSR,
heart rate, interbeat interval, pulse signal, engagement dial, and TTL
synchronization fields. The function is conservative: it preserves
original column names, removes only empty trailing columns, and attaches
a basic biometric-column summary as an attribute.

## Usage

``` r
import_gazepoint_biometrics(file, na = c("", "NA", "NaN"))
```

## Arguments

- file:

  Path to a Gazepoint CSV export.

- na:

  Values that should be treated as missing.

## Value

A data frame with Gazepoint export columns preserved. The returned
object has class `"gazepoint_biometrics"` and an attribute named
`"biometric_columns"`.
