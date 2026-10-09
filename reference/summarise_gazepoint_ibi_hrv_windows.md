# Summarise Gazepoint IBI-derived HRV windows

Summarises interbeat-interval (IBI) values within participant, stimulus,
trial, AOI, or other user-defined windows. This function derives simple
time-domain variability features from `IBI`. It does not use the
Gazepoint `HRV` column as a heart-rate-variability metric, because `HRV`
is treated as the Gazepoint heart-rate validity flag.

## Usage

``` r
summarise_gazepoint_ibi_hrv_windows(
  data,
  group_columns,
  ibi_column = "IBI",
  validity_column = "HRV",
  min_ibi = 0.3,
  max_ibi = 2
)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- group_columns:

  Columns defining analysis windows, such as
  `c("source_participant", "MEDIA_ID")`.

- ibi_column:

  Interbeat-interval column. Defaults to `"IBI"`.

- validity_column:

  Optional validity column. Defaults to `"HRV"`.

- min_ibi:

  Minimum plausible IBI in seconds.

- max_ibi:

  Maximum plausible IBI in seconds.

## Value

A data frame with one row per window and IBI-derived HRV summaries.
