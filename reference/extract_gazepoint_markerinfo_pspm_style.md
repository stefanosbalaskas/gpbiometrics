# Extract PsPM-style marker information from Gazepoint biometrics data

Extract PsPM-style marker information from Gazepoint biometrics data

## Usage

``` r
extract_gazepoint_markerinfo_pspm_style(
  data,
  marker_cols = NULL,
  time_col = NULL,
  sampling_rate_hz = NULL,
  group_cols = NULL,
  edge = c("rising", "change", "nonzero"),
  nonzero_only = TRUE
)
```

## Arguments

- data:

  Gazepoint data frame.

- marker_cols:

  Marker/TTL columns. If NULL, likely marker columns are inferred.

- time_col:

  Time column in seconds. If NULL, inferred or created from
  sampling_rate_hz.

- sampling_rate_hz:

  Sampling rate used when no time column is available.

- group_cols:

  Optional grouping columns such as participant or trial.

- edge:

  Event rule: rising, change, or nonzero.

- nonzero_only:

  Whether zero-valued markers should be ignored.

## Value

Data frame with marker events.
