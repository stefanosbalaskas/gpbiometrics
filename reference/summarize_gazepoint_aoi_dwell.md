# Summarize AOI dwell time and entries

Computes AOI dwell time, entry counts, first-entry latency, and
valid-sample ratios from gaze samples or fixation/AOI tables.

## Usage

``` r
summarize_gazepoint_aoi_dwell(
  data,
  time_col = NULL,
  aoi_col = NULL,
  duration_col = NULL,
  group_cols = NULL,
  valid_col = NULL
)
```

## Arguments

- data:

  Data frame containing AOI labels.

- time_col:

  Optional time column for sample-level data.

- aoi_col:

  AOI column.

- duration_col:

  Optional duration column for fixation-level data.

- group_cols:

  Optional grouping columns such as participant/trial.

- valid_col:

  Optional validity column.

## Value

Data frame with one row per group and AOI.
