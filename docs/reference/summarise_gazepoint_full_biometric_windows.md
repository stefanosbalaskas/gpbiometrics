# Summarise full Gazepoint biometric windows

Creates a combined window-level summary table containing GSR/EDA,
heart-rate, engagement-dial, and IBI-derived HRV summaries. This
function is intended for biometric analyses where both continuous
physiological values and interbeat-interval variability features are
needed.

## Usage

``` r
summarise_gazepoint_full_biometric_windows(
  data,
  group_columns,
  include_ibi_hrv = TRUE
)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- group_columns:

  Columns defining analysis windows, such as
  `c("source_participant", "MEDIA_ID")`.

- include_ibi_hrv:

  Logical. Should IBI-derived HRV summaries be included?

## Value

A data frame with one row per window and prefixed biometric summary
columns.
