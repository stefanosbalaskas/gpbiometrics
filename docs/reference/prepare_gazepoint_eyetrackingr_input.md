# Prepare Gazepoint data for eyetrackingR

Converts sample-level Gazepoint gaze and AOI data into a conservative,
audited table compatible with
[`eyetrackingR::make_eyetrackingr_data()`](https://rdrr.io/pkg/eyetrackingR/man/make_eyetrackingr_data.html).

## Usage

``` r
prepare_gazepoint_eyetrackingr_input(
  data,
  participant_col = NULL,
  trial_col = NULL,
  time_col = NULL,
  time_unit = c("auto", "seconds", "milliseconds", "samples"),
  sampling_rate_hz = NULL,
  rezero_time = FALSE,
  trackloss_col = NULL,
  validity_col = NULL,
  valid_values = NULL,
  x_col = NULL,
  y_col = NULL,
  aoi_col = NULL,
  aoi_cols = NULL,
  aoi_levels = NULL,
  outside_aoi_values = c("", "none", "no_aoi", "outside", "outside_aoi", "non_aoi",
    "background"),
  allow_aoi_overlap = FALSE,
  item_cols = NULL,
  predictor_cols = NULL,
  treat_non_aoi_looks_as_missing = TRUE,
  sampling_tolerance = 0.05,
  irregular = c("error", "allow"),
  create_object = FALSE
)
```

## Arguments

- data:

  Sample-level Gazepoint data frame.

- participant_col:

  Participant identifier column. If `NULL`, common participant names are
  searched.

- trial_col:

  Trial identifier column. If `NULL`, common trial and stimulus names
  are searched.

- time_col:

  Numeric time or sample-counter column. If `NULL`, common Gazepoint
  time columns are searched.

- time_unit:

  Source time unit: `"auto"`, `"seconds"`, `"milliseconds"`, or
  `"samples"`. Output time is always milliseconds.

- sampling_rate_hz:

  Sampling rate required when `time_unit = "samples"` or when an
  automatically detected sample counter is used.

- rezero_time:

  Logical. Subtract the minimum time separately within each
  participant-trial group.

- trackloss_col:

  Optional column where `TRUE` or non-zero means tracking was lost.

- validity_col:

  Optional gaze-validity column where `TRUE`, `"valid"`, or a positive
  numeric value means valid tracking.

- valid_values:

  Optional explicit values treated as valid in `validity_col`.

- x_col, y_col:

  Optional gaze-coordinate columns. Missing or non-finite coordinates
  are treated as track loss.

- aoi_col:

  Optional categorical AOI column.

- aoi_cols:

  Optional existing binary or logical AOI columns. Supply either
  `aoi_col` or `aoi_cols`, not both.

- aoi_levels:

  Optional ordered AOI labels to create from `aoi_col`.

- outside_aoi_values:

  Values in `aoi_col` treated as valid looks outside all supplied AOIs
  rather than track loss.

- allow_aoi_overlap:

  Logical. Permit more than one AOI column to be `TRUE` in a sample.

- item_cols:

  Optional item identifier columns retained in the output and passed to
  [`eyetrackingR::make_eyetrackingr_data()`](https://rdrr.io/pkg/eyetrackingR/man/make_eyetrackingr_data.html).

- predictor_cols:

  Optional condition or predictor columns retained in the compatibility
  table.

- treat_non_aoi_looks_as_missing:

  Logical passed unchanged to
  [`eyetrackingR::make_eyetrackingr_data()`](https://rdrr.io/pkg/eyetrackingR/man/make_eyetrackingr_data.html)
  when `create_object = TRUE`.

- sampling_tolerance:

  Maximum relative deviation from the median within-trial sampling
  interval.

- irregular:

  Handling of irregular within-trial sampling: `"error"` or `"allow"`.

- create_object:

  Logical. If `TRUE`, construct an actual `eyetrackingR_data` object.
  The optional eyetrackingR package must then be installed.

## Value

An object of class `"gazepoint_eyetrackingr_input"` containing:

- `data`: plain compatibility data frame;

- `object`: optional output from `make_eyetrackingr_data()`;

- `row_audit`: row-level derivation and ordering audit;

- `sampling`: participant-trial sampling audit;

- `manifest`: column mappings and preparation summary;

- `settings`: resolved preparation settings.

## Details

The returned compatibility table uses the standardized columns
`ParticipantName`, `Trial`, `Time_ms`, and `TrackLoss`. `Time_ms` is
expressed in milliseconds. AOI columns are logical.

Track loss is derived conservatively from the union of an explicit
track-loss flag, an invalid validity flag, and missing or non-finite
gaze coordinates. A valid look outside every AOI is not silently
reclassified as hardware track loss.

eyetrackingR is intended for relatively raw sample-level data in which
rows represent equally spaced time samples. Fixation-level or
event-level tables should not be supplied to this helper.

## See also

[`assign_gazepoint_aoi()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/assign_gazepoint_aoi.md)

## Examples

``` r
gaze <- data.frame(
  participant = rep("P01", 4),
  trial = rep("T01", 4),
  time_s = c(0, 0.1, 0.2, 0.3),
  gaze_x = c(0.2, 0.5, 0.8, NA),
  gaze_y = c(0.5, 0.5, 0.5, NA),
  AOI = c("left", "center", "right", NA)
)

prepared <- prepare_gazepoint_eyetrackingr_input(gaze)
prepared$data
#>   ParticipantName Trial Time_ms TrackLoss  left center right
#> 1             P01   T01       0     FALSE  TRUE  FALSE FALSE
#> 2             P01   T01     100     FALSE FALSE   TRUE FALSE
#> 3             P01   T01     200     FALSE FALSE  FALSE  TRUE
#> 4             P01   T01     300      TRUE FALSE  FALSE FALSE
prepared$sampling
#>   ParticipantName Trial group_id sample_count start_time_ms end_time_ms
#> 1             P01   T01 P01\rT01            4             0         300
#>   median_interval_ms effective_sampling_rate_hz repeated_timestamp_count
#> 1                100                         10                        0
#>   negative_time_step_count irregular_interval_count
#> 1                        0                        0
#>   maximum_relative_interval_error
#> 1                               0
```
