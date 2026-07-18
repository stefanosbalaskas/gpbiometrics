# Assign Gazepoint coordinates to areas of interest

Assigns sample-level gaze coordinates or fixation centroids to
rectangular or polygonal areas of interest (AOIs). The original rows are
preserved and augmented with an AOI label, match count, ambiguity flag,
and assignment status.

## Usage

``` r
assign_gazepoint_aoi(
  data,
  aois,
  x_col = NULL,
  y_col = NULL,
  aoi_label_col = "aoi",
  format = c("auto", "rectangle", "polygon"),
  aoi_id_col = NULL,
  data_match_cols = NULL,
  aoi_match_cols = data_match_cols,
  xmin_col = "xmin",
  xmax_col = "xmax",
  ymin_col = "ymin",
  ymax_col = "ymax",
  vertex_x_col = "vertex_x",
  vertex_y_col = "vertex_y",
  priority_col = NULL,
  overlap = c("priority", "first", "smallest", "all", "error"),
  boundary = c("inside", "outside"),
  output_col = "AOI",
  match_count_col = "aoi_match_count",
  ambiguous_col = "aoi_ambiguous",
  status_col = "aoi_assignment_status",
  all_separator = "|",
  overwrite = FALSE
)
```

## Arguments

- data:

  A data frame containing gaze coordinates or fixation centroids.

- aois:

  A data frame containing rectangular or polygonal AOI definitions.

- x_col:

  Numeric horizontal-coordinate column in `data`. If `NULL`, common
  Gazepoint and fixation-summary names are searched.

- y_col:

  Numeric vertical-coordinate column in `data`. If `NULL`, common
  Gazepoint and fixation-summary names are searched.

- aoi_label_col:

  AOI label column in `aois`.

- format:

  AOI-definition format: `"auto"`, `"rectangle"`, or `"polygon"`.

- aoi_id_col:

  Optional AOI identifier column. For polygon definitions, this
  distinguishes multiple polygons with the same label.

- data_match_cols:

  Optional columns in `data` used to restrict eligible AOI definitions,
  for example `"trial"` or `"MEDIA_ID"`.

- aoi_match_cols:

  Corresponding columns in `aois`. Must have the same length and order
  as `data_match_cols`.

- xmin_col, xmax_col, ymin_col, ymax_col:

  Rectangle-boundary columns.

- vertex_x_col, vertex_y_col:

  Polygon-vertex columns.

- priority_col:

  Optional numeric priority column. Smaller values receive higher
  priority when `overlap = "priority"`.

- overlap:

  Rule for coordinates falling within multiple AOIs: `"priority"`,
  `"first"`, `"smallest"`, `"all"`, or `"error"`.

- boundary:

  Should coordinates on AOI boundaries be treated as `"inside"` or
  `"outside"`?

- output_col:

  Name of the generated AOI-label column.

- match_count_col:

  Name of the generated AOI-match-count column.

- ambiguous_col:

  Name of the generated logical ambiguity column.

- status_col:

  Name of the generated assignment-status column.

- all_separator:

  Separator used when `overlap = "all"`.

- overwrite:

  Logical. If `FALSE`, existing output columns are protected.

## Value

A data frame with class `"gazepoint_aoi_assignment"`. Attributes
`aoi_assignment_log`, `aoi_assignment_settings`, and `aoi_definitions`
contain structured provenance information.

## Details

Rectangular AOIs use one row per definition with minimum and maximum x
and y coordinates. Polygon AOIs use long-format vertices, with one row
per vertex and repeated AOI identifiers or labels.

Optional matching columns can restrict AOIs to particular trials,
screens, media items, stimuli, or other recording contexts. Missing or
blank values in AOI matching columns act as wildcards.

Supported assignment statuses are:

- `"matched"`: exactly one AOI matched;

- `"ambiguous_resolved"`: multiple AOIs matched and one was selected;

- `"ambiguous_all"`: all matching labels were retained;

- `"unmatched"`: valid coordinates did not fall within an eligible AOI;

- `"invalid_coordinate"`: x or y was missing or non-finite.

Coordinate systems are not transformed. Gaze coordinates and AOI
definitions must therefore use the same scale, orientation, and origin.

## See also

[`summarize_gazepoint_fixations()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarize_gazepoint_fixations.md),
[`summarize_gazepoint_aoi_dwell()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarize_gazepoint_aoi_dwell.md),
[`summarise_gazepoint_aoi_biometrics()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_aoi_biometrics.md)

## Examples

``` r
gaze <- data.frame(
  gaze_x = c(0.1, 0.5, 0.9),
  gaze_y = c(0.5, 0.5, 0.5)
)

rectangles <- data.frame(
  aoi = c("left", "right"),
  xmin = c(0, 0.6),
  xmax = c(0.4, 1),
  ymin = c(0, 0),
  ymax = c(1, 1)
)

assign_gazepoint_aoi(
  gaze,
  rectangles,
  x_col = "gaze_x",
  y_col = "gaze_y"
)
#>   gaze_x gaze_y   AOI aoi_match_count aoi_ambiguous aoi_assignment_status
#> 1    0.1    0.5  left               1         FALSE               matched
#> 2    0.5    0.5  <NA>               0         FALSE             unmatched
#> 3    0.9    0.5 right               1         FALSE               matched
```
