# Import a Gazepoint Data Summary export

Reads a multi-section `Data_Summary_export_*.csv` file produced by
Gazepoint Analysis. These files are not ordinary rectangular CSV files.
They contain metadata followed by sections such as `AOI Summary` and
`AOI Statistics (for each user)`. The latter may include AOI-level
biometric summaries such as average dial value, average GSR, average
heart rate, average interbeat interval, and pupil diameter.

## Usage

``` r
import_gazepoint_data_summary(file)
```

## Arguments

- file:

  Path to a Gazepoint `Data_Summary_export_*.csv` file.

## Value

A list with `metadata`, `aoi_summary`, and `aoi_statistics` data frames.
The returned object has class `"gazepoint_data_summary"`.
