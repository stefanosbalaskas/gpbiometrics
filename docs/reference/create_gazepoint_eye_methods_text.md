# Create reproducible Gazepoint eye-tracking methods text

Create reproducible Gazepoint eye-tracking methods text

## Usage

``` r
create_gazepoint_eye_methods_text(
  sampling_rate_hz,
  device_model = "Gazepoint GP3",
  calibration_points = 9L,
  binocular = TRUE,
  software = "Gazepoint Analysis",
  screen_resolution = NULL,
  viewing_distance_cm = NULL,
  coordinate_space = NULL,
  preprocessing = NULL,
  fixation_detection = NULL,
  aoi_definition = NULL,
  synchronization = NULL,
  exclusions = NULL,
  tense = c("past", "future"),
  include_package_version = TRUE
)
```

## Arguments

- sampling_rate_hz:

  Recording frequency.

- device_model:

  Device model.

- calibration_points:

  Number of calibration points.

- binocular:

  Whether binocular data were recorded.

- software:

  Optional acquisition software.

- screen_resolution:

  Optional width-height pixel vector.

- viewing_distance_cm:

  Optional viewing distance.

- coordinate_space:

  Optional coordinate description.

- preprocessing:

  Optional preprocessing descriptions.

- fixation_detection:

  Optional fixation-detection description.

- aoi_definition:

  Optional AOI description.

- synchronization:

  Optional synchronization description.

- exclusions:

  Optional exclusion description.

- tense:

  `"past"` for manuscripts or `"future"` for preregistrations.

- include_package_version:

  Include the gpbiometrics version.

## Value

A character object of class `"gazepoint_eye_methods_text"`.
