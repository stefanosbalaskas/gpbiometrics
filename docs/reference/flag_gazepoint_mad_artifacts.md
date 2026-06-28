# Flag MAD-based EDA wearable artifacts

Flags dependency-light, subject-specific EDA artifact categories using
robust median absolute deviation (MAD) logic. The categories are
heuristic QC labels: step artifacts, needle artifacts, flatline
artifacts, and wall artifacts.

## Usage

``` r
flag_gazepoint_mad_artifacts(
  dat,
  eda_col = "GSR_US",
  time_col = NULL,
  group_cols = NULL,
  mad_multiplier = 8,
  flatline_tolerance = 1e-06,
  flatline_min_run = 5,
  wall_abs_change = NULL,
  output_prefix = "mad"
)
```

## Arguments

- dat:

  A data frame.

- eda_col:

  Numeric EDA/conductance column.

- time_col:

  Optional time column for ordering within group.

- group_cols:

  Optional grouping columns.

- mad_multiplier:

  MAD multiplier used for robust thresholding.

- flatline_tolerance:

  Maximum absolute sample-to-sample change treated as flatline.

- flatline_min_run:

  Minimum consecutive flatline samples.

- wall_abs_change:

  Optional absolute change threshold for wall artifacts.

- output_prefix:

  Prefix for output columns.

## Value

A data frame with artifact flags and artifact-summary attributes.
