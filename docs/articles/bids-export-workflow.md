# Exporting Gazepoint eye-tracking and physiology to BIDS

## Purpose

This article describes the standards-oriented BIDS export layer in
`gpbiometrics`. The workflow separates eye-tracking and physiological
preparation, validates required metadata, previews output paths, and
writes tabular data and JSON sidecars.

The helpers support transparent export preparation. They do not
guarantee that an incomplete study description becomes fully BIDS
compliant without researcher review.

## Available helpers

``` r

bids_functions <- data.frame(
  function_name = c(
    "export_gazepoint_to_bids",
    "prepare_gazepoint_bids_eye",
    "prepare_gazepoint_bids_physio",
    "check_gazepoint_bids"
  ),
  role = c(
    "Integrated export workflow",
    "Eye-tracking preparation",
    "Physiological preparation",
    "Dataset-layout audit"
  ),
  stringsAsFactors = FALSE
)

bids_functions$available <-
  bids_functions$function_name %in%
  getNamespaceExports("gpbiometrics")

bids_functions
#>                   function_name                       role available
#> 1      export_gazepoint_to_bids Integrated export workflow      TRUE
#> 2    prepare_gazepoint_bids_eye   Eye-tracking preparation      TRUE
#> 3 prepare_gazepoint_bids_physio  Physiological preparation      TRUE
#> 4          check_gazepoint_bids       Dataset-layout audit      TRUE

stopifnot(all(bids_functions$available))
```

## Metadata required before export

| Metadata area | Examples |
|----|----|
| Dataset identity | Dataset name, authors, license |
| Participant structure | Subject, session, task, run |
| Acquisition | Sampling rate, device, software version |
| Eye tracking | Screen size, resolution, coordinate system, calibration |
| Physiology | Channel names, units, sampling frequencies |
| Timing | Time origin, event source, synchronization method |
| Processing | Filtering, interpolation, resampling, exclusions |

Missing screen or coordinate-system metadata should not be inferred from
gaze values alone.

## Inspect the function contracts

``` r

args(export_gazepoint_to_bids)
#> function (data, bids_root, subject, task, dataset_name = NULL,
#>     recorded_eye = c("cyclopean", "left", "right"), recording = "eye1",
#>     datatype = c("beh", "eeg", "emg", "func", "ieeg", "meg",
#>         "motion", "nirs", "pet"), session = NULL, acquisition = NULL,
#>     run = NULL, timestamp_col = NULL, x_col = NULL, y_col = NULL,
#>     include_pupil = TRUE, pupil_col = NULL, additional_cols = NULL,
#>     timestamp_units = c("auto", "seconds", "milliseconds", "microseconds"),
#>     coordinate_units = c("normalized", "pixel", "degree", "radian",
#>         "mm", "cm", "m", "arbitrary"), pupil_units = "arbitrary",
#>     sample_coordinate_system = c("gaze-on-screen", "eye-in-head",
#>         "gaze-in-world", "custom"), sampling_rate_hz = NULL,
#>     sampling_tolerance = 0.05, start_time_s = 0, screen_distance_m = NULL,
#>     screen_origin = NULL, screen_resolution_px = NULL, screen_size_m = NULL,
#>     screen_refresh_rate_hz = NULL, stimulus_software_name = NULL,
#>     stimulus_software_version = NULL, operating_system = NULL,
#>     vision_correction = NULL, manufacturer = "Gazepoint", manufacturers_model_name = NULL,
#>     software_versions = NULL, device_serial_number = NULL, eye_tracking_method = "P-CR",
#>     calibration_type = NULL, calibration_count = NULL, average_calibration_error_deg = NULL,
#>     maximal_calibration_error_deg = NULL, eye_tracker_distance_m = NULL,
#>     raw_data_filters = NULL, timestamp_origin = "Eye-tracker clock",
#>     custom_coordinate_system_description = NULL, column_metadata = list(),
#>     bids_version = "1.11.1", dry_run = FALSE, overwrite = FALSE)
#> NULL
args(prepare_gazepoint_bids_eye)
#> function (data, ..., execute = TRUE)
#> NULL
args(prepare_gazepoint_bids_physio)
#> function (data, ..., execute = TRUE)
#> NULL
args(check_gazepoint_bids)
#> function (root, subject_pattern = "^sub-[A-Za-z0-9]+$", recursive = TRUE,
#>     expected_files = c("dataset_description.json", "participants.tsv"),
#>     gazepoint_patterns = c("all[_-]?gaze", "fixation", "summary",
#>         "biometric", "eda", "gsr", "ecg", "ppg", "hr", "ibi"))
#> NULL
```

## Prepare eye-tracking data

``` r

eye_export <- prepare_gazepoint_bids_eye(
  ...
)
```

Retain gaze coordinates, pupil measurements, validity fields, blink
flags, timestamps, event information, and coordinate metadata where
available.

Coordinate interpretation must state whether values are normalized,
pixel-based, screen-centered, or expressed in another documented system.

## Prepare physiological data

``` r

physio_export <- prepare_gazepoint_bids_physio(
  ...
)
```

Physiological channel metadata should distinguish:

- EDA or GSR conductance-related channels;
- pulse or PPG waveform channels;
- heart-rate summaries;
- genuine IBI or RR intervals;
- engagement-dial values;
- validity or vendor-status columns.

## Preview the complete export

Always preview paths and metadata before writing files.

``` r

preview <- export_gazepoint_to_bids(
  ...,
  dry_run = TRUE
)

preview
```

Check participant, session, task, acquisition, and run labels;
filenames; compressed tables; JSON sidecars; coordinate-system files;
overwrite decisions; and missing mandatory metadata.

## Write and audit

``` r

written <- export_gazepoint_to_bids(
  ...,
  dry_run = FALSE
)

audit <- check_gazepoint_bids(
  ...
)
```

Do not overwrite an existing dataset until the preview and audit outputs
have been reviewed.

## Reproducibility checklist

Report:

- the BIDS specification targeted;
- gpbiometrics and R versions;
- source Gazepoint export types;
- subject, session, task, and run mappings;
- eye-coordinate conventions;
- physiological channel units;
- sampling rates and time origins;
- preprocessing completed before export;
- files omitted because required metadata were unavailable;
- audit warnings and unresolved deviations.

## Interpretation and scope

BIDS organizes data and metadata. It does not validate experimental
design, signal quality, clinical meaning, or psychological
interpretation. Data-sharing readiness should therefore be assessed
separately from analysis readiness.
