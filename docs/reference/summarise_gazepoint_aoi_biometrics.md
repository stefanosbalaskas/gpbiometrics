# Summarise biometric signals by AOI

Summarises Gazepoint biometric channels within area-of-interest (AOI)
rows. The helper is intended for AOI-linked physiological descriptions,
not for inferring emotional valence.

## Usage

``` r
summarise_gazepoint_aoi_biometrics(
  data,
  aoi_col = "AOI",
  signal_cols = NULL,
  group_cols = NULL,
  time_col = NULL,
  valid_aoi_values = NULL,
  drop_missing_aoi = TRUE,
  min_rows = 1
)
```

## Arguments

- data:

  A Gazepoint data frame containing AOI labels and biometric signals.

- aoi_col:

  AOI label column.

- signal_cols:

  Biometric signal columns to summarise.

- group_cols:

  Optional grouping columns, for example participant/media.

- time_col:

  Optional time/counter column.

- valid_aoi_values:

  Optional AOI labels to retain.

- drop_missing_aoi:

  Logical. If `TRUE`, rows with missing/blank AOI labels are excluded.

- min_rows:

  Minimum rows required for a group/AOI/signal summary to be marked as
  usable.

## Value

A list with `overview`, `summary`, `signal_summary`, `aoi_summary`,
`data`, and `settings`.
