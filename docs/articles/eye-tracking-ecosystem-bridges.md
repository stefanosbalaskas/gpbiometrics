# Using gpbiometrics with eyetrackingR, PupillometryR, and gazeR

## Purpose

`gpbiometrics` provides optional bridges to `eyetrackingR`,
`PupillometryR`, and gazeR. These bridges standardize source columns,
preserve an audit record, and optionally construct an external-package
object when that package is installed.

The bridge is a data-preparation boundary. Downstream modelling,
visualization, and package-specific assumptions remain the
responsibility of the selected external package.

## Which bridge should be used?

``` r

bridge_functions <- data.frame(
  target = c(
    "eyetrackingR",
    "PupillometryR",
    "gazeR"
  ),
  helper = c(
    "prepare_gazepoint_eyetrackingr_input",
    "prepare_gazepoint_pupillometryr_input",
    "prepare_gazepoint_gazer_input"
  ),
  primary_focus = c(
    "AOI and time-window analysis",
    "Pupil preprocessing and time-course analysis",
    "Gaze, pupil, blink, and AOI preparation"
  ),
  stringsAsFactors = FALSE
)

bridge_functions$available <-
  bridge_functions$helper %in%
  getNamespaceExports("gpbiometrics")

bridge_functions
#>          target                                helper
#> 1  eyetrackingR  prepare_gazepoint_eyetrackingr_input
#> 2 PupillometryR prepare_gazepoint_pupillometryr_input
#> 3         gazeR         prepare_gazepoint_gazer_input
#>                                  primary_focus available
#> 1                 AOI and time-window analysis      TRUE
#> 2 Pupil preprocessing and time-course analysis      TRUE
#> 3      Gaze, pupil, blink, and AOI preparation      TRUE

stopifnot(all(bridge_functions$available))
```

## Common source contract

A bridge-ready table should preserve:

- participant identifier;
- trial or media identifier;
- ordered time variable with a documented unit;
- gaze coordinates where required;
- pupil values where required;
- validity or track-loss information;
- blink information where available;
- AOI membership or the columns required to construct AOIs;
- condition and stimulus metadata.

Do not remove original Gazepoint columns until the conversion audit has
been reviewed.

## eyetrackingR preparation

``` r

args(prepare_gazepoint_eyetrackingr_input)
#> function (data, participant_col = NULL, trial_col = NULL, time_col = NULL,
#>     time_unit = c("auto", "seconds", "milliseconds", "samples"),
#>     sampling_rate_hz = NULL, rezero_time = FALSE, trackloss_col = NULL,
#>     validity_col = NULL, valid_values = NULL, x_col = NULL, y_col = NULL,
#>     aoi_col = NULL, aoi_cols = NULL, aoi_levels = NULL, outside_aoi_values = c("",
#>         "none", "no_aoi", "outside", "outside_aoi", "non_aoi",
#>         "background"), allow_aoi_overlap = FALSE, item_cols = NULL,
#>     predictor_cols = NULL, treat_non_aoi_looks_as_missing = TRUE,
#>     sampling_tolerance = 0.05, irregular = c("error", "allow"),
#>     create_object = FALSE)
#> NULL
```

``` r

eyetrackingr_input <- prepare_gazepoint_eyetrackingr_input(
  data = gaze_samples,
  ...
)
```

Review participant, trial, time, track-loss, and logical AOI columns
before constructing an `eyetrackingR_data` object.

## PupillometryR preparation

``` r

args(prepare_gazepoint_pupillometryr_input)
#> function (data, participant_col = NULL, trial_col = NULL, time_col = NULL,
#>     condition_col = NULL, pupil_left_col = NULL, pupil_right_col = NULL,
#>     pupil_col = NULL, time_unit = c("auto", "seconds", "milliseconds",
#>         "samples"), sampling_rate_hz = NULL, rezero_time = FALSE,
#>     invalid_pupil_values = NULL, validity_cols = NULL, valid_values = NULL,
#>     blink_cols = NULL, mask_invalid = FALSE, create_mean_pupil = TRUE,
#>     other_cols = NULL, sampling_tolerance = 0.05, irregular = c("error",
#>         "allow"), create_object = FALSE)
#> NULL
```

``` r

pupillometryr_input <- prepare_gazepoint_pupillometryr_input(
  data = pupil_samples,
  ...
)
```

Document whether binocular or monocular pupil values were selected, how
invalid values were masked, whether time was converted to milliseconds,
and whether blink periods were retained or removed.

## gazeR preparation

``` r

args(prepare_gazepoint_gazer_input)
#> function (data, participant_col = NULL, trial_col = NULL, time_col = NULL,
#>     time_unit = c("auto", "seconds", "milliseconds", "samples"),
#>     sampling_rate_hz = NULL, rezero_time = FALSE, x_col = NULL,
#>     y_col = NULL, x_left_col = NULL, y_left_col = NULL, x_right_col = NULL,
#>     y_right_col = NULL, pupil_col = NULL, pupil_left_col = NULL,
#>     pupil_right_col = NULL, validity_col = NULL, validity_left_col = NULL,
#>     validity_right_col = NULL, valid_values = NULL, blink_col = NULL,
#>     blink_left_col = NULL, blink_right_col = NULL, invalid_coordinate_values = NULL,
#>     invalid_pupil_values = NULL, mask_invalid = FALSE, other_cols = NULL,
#>     sampling_tolerance = 0.05, irregular = c("error", "allow"),
#>     create_object = FALSE)
#> NULL
```

``` r

gazer_input <- prepare_gazepoint_gazer_input(
  data = gaze_samples,
  ...
)
```

gazeR preparation may include monocular or binocular coordinates, pupil
columns, validity values, blink flags, time conversion, and
irregular-sampling checks.

## Cross-bridge comparison

| Decision | Question |
|----|----|
| Analysis target | AOI proportions, pupil time course, blink processing, or gaze processing? |
| Time unit | Does the target package require milliseconds? |
| Validity rule | How will invalid coordinates or pupil values be represented? |
| Trial structure | Are participant and trial identifiers complete and stable? |
| AOI representation | Logical AOI columns or one categorical AOI field? |
| External dependency | Is object construction required or only a data frame? |
| Auditability | Are renamed, masked, omitted, and retained columns recorded? |

## Optional object construction

``` r

prepared <- prepare_gazepoint_eyetrackingr_input(
  data = gaze_samples,
  ...
)

# Inspect the prepared data, mapping, audit, and settings before
# constructing an external-package object.
```

## Reporting checklist

Report:

- source Gazepoint export and package versions;
- selected bridge and target-package version;
- participant, trial, time, gaze, pupil, AOI, validity, and blink
  mappings;
- time-unit conversion;
- invalid-sample masking;
- binocular or monocular processing;
- dropped rows or columns;
- irregular-sampling decisions;
- whether an external-package object was constructed.

## Interpretation guardrails

Conversion does not validate downstream model assumptions. Pupil, gaze,
AOI, blink, and track-loss outputs should be interpreted within the
experimental design and documented preprocessing workflow.
