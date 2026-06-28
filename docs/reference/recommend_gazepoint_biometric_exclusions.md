# Recommend Gazepoint biometric exclusions

Creates window-level and participant-level exclusion recommendations
from Gazepoint biometric usable-sample summaries. The function does not
remove data. It only creates transparent keep, review, or exclude
recommendations.

## Usage

``` r
recommend_gazepoint_biometric_exclusions(
  data,
  group_columns = NULL,
  data_is_window_summary = FALSE,
  participant_column = NULL,
  gsr_min_usable_pct = 50,
  hr_min_usable_pct = 50,
  dial_min_usable_pct = 50,
  require_gsr = TRUE,
  require_hr = TRUE,
  require_dial = FALSE
)
```

## Arguments

- data:

  A row-level Gazepoint Biometrics data frame, a path to a Gazepoint CSV
  export, or an already summarised multimodal window table.

- group_columns:

  Columns defining analysis windows when `data` is row-level, such as
  `c("source_participant", "MEDIA_ID")`.

- data_is_window_summary:

  Logical. If `TRUE`, `data` is treated as an already summarised window
  table.

- participant_column:

  Optional participant identifier column. If `NULL`, the function tries
  `source_participant`, `USER`, and `USERID`.

- gsr_min_usable_pct:

  Minimum acceptable usable percentage for GSR/EDA.

- hr_min_usable_pct:

  Minimum acceptable usable percentage for heart rate.

- dial_min_usable_pct:

  Minimum acceptable usable percentage for engagement dial.

- require_gsr:

  Should low GSR/EDA coverage cause exclusion rather than review?

- require_hr:

  Should low heart-rate coverage cause exclusion rather than review?

- require_dial:

  Should low engagement-dial coverage cause exclusion rather than
  review?

## Value

A list with `overview`, `window_recommendations`,
`participant_recommendations`, and `settings`.
