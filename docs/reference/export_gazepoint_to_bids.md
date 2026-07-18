# Export Gazepoint eye-tracking data to BIDS

Exports one Gazepoint eye-tracking recording as a BIDS 1.11.1
physiological-recording pair consisting of a compressed, headerless
`_physio.tsv.gz` file and a matching JSON sidecar.

## Usage

``` r
export_gazepoint_to_bids(
  data,
  bids_root,
  subject,
  task,
  dataset_name = NULL,
  recorded_eye = c("cyclopean", "left", "right"),
  recording = "eye1",
  datatype = c("beh", "eeg", "emg", "func", "ieeg", "meg", "motion", "nirs", "pet"),
  session = NULL,
  acquisition = NULL,
  run = NULL,
  timestamp_col = NULL,
  x_col = NULL,
  y_col = NULL,
  include_pupil = TRUE,
  pupil_col = NULL,
  additional_cols = NULL,
  timestamp_units = c("auto", "seconds", "milliseconds", "microseconds"),
  coordinate_units = c("normalized", "pixel", "degree", "radian", "mm", "cm", "m",
    "arbitrary"),
  pupil_units = "arbitrary",
  sample_coordinate_system = c("gaze-on-screen", "eye-in-head", "gaze-in-world",
    "custom"),
  sampling_rate_hz = NULL,
  sampling_tolerance = 0.05,
  start_time_s = 0,
  screen_distance_m = NULL,
  screen_origin = NULL,
  screen_resolution_px = NULL,
  screen_size_m = NULL,
  screen_refresh_rate_hz = NULL,
  stimulus_software_name = NULL,
  stimulus_software_version = NULL,
  operating_system = NULL,
  vision_correction = NULL,
  manufacturer = "Gazepoint",
  manufacturers_model_name = NULL,
  software_versions = NULL,
  device_serial_number = NULL,
  eye_tracking_method = "P-CR",
  calibration_type = NULL,
  calibration_count = NULL,
  average_calibration_error_deg = NULL,
  maximal_calibration_error_deg = NULL,
  eye_tracker_distance_m = NULL,
  raw_data_filters = NULL,
  timestamp_origin = "Eye-tracker clock",
  custom_coordinate_system_description = NULL,
  column_metadata = list(),
  bids_version = "1.11.1",
  dry_run = FALSE,
  overwrite = FALSE
)
```

## Arguments

- data:

  Data frame containing regularly sampled Gazepoint eye-tracking
  samples.

- bids_root:

  Root directory of the BIDS dataset.

- subject:

  BIDS subject label without the `sub-` prefix.

- task:

  BIDS task label without the `task-` prefix.

- dataset_name:

  Dataset name used when creating `dataset_description.json`. May be
  `NULL` when a valid file already exists.

- recorded_eye:

  Recorded eye: `"left"`, `"right"`, or `"cyclopean"`.

- recording:

  Required BIDS recording label. The recommended labels are `"eye1"`,
  `"eye2"`, and `"eye3"`.

- datatype:

  BIDS datatype directory. Supported values are `"beh"`, `"eeg"`,
  `"emg"`, `"func"`, `"ieeg"`, `"meg"`, `"motion"`, `"nirs"`, and
  `"pet"`.

- session:

  Optional BIDS session label without the `ses-` prefix.

- acquisition:

  Optional BIDS acquisition label without the `acq-` prefix.

- run:

  Optional non-negative BIDS run index.

- timestamp_col:

  Timestamp column issued by the eye tracker. If `NULL`, common
  Gazepoint timestamp columns are searched.

- x_col:

  Horizontal gaze-coordinate column. If `NULL`, common Gazepoint columns
  are searched according to `recorded_eye`.

- y_col:

  Vertical gaze-coordinate column. If `NULL`, common Gazepoint columns
  are searched according to `recorded_eye`.

- include_pupil:

  Logical. Attempt to include a `pupil_size` column.

- pupil_col:

  Optional pupil-size column. If `NULL` and `include_pupil = TRUE`,
  common Gazepoint pupil columns are searched.

- additional_cols:

  Optional additional numeric or logical columns to append after the
  prescribed eye-tracking columns.

- timestamp_units:

  Units of the source timestamp: `"auto"`, `"seconds"`,
  `"milliseconds"`, or `"microseconds"`.

- coordinate_units:

  Units of the gaze coordinates. `"normalized"` is encoded as the
  dimensionless BIDS unit `"1"`.

- pupil_units:

  Units of pupil size when included.

- sample_coordinate_system:

  Coordinate system: `"gaze-on-screen"`, `"eye-in-head"`,
  `"gaze-in-world"`, or `"custom"`.

- sampling_rate_hz:

  Optional positive sampling frequency. If omitted, it is inferred from
  the timestamps.

- sampling_tolerance:

  Maximum relative deviation from the expected sampling interval.

- start_time_s:

  BIDS `StartTime`, in seconds relative to the associated acquisition.

- screen_distance_m:

  Required for `"gaze-on-screen"` unless already defined in an existing
  events JSON sidecar.

- screen_origin:

  Two strings describing vertical and horizontal screen origin, for
  example `c("top", "left")`.

- screen_resolution_px:

  Two positive integers giving screen width and height in pixels.

- screen_size_m:

  Two positive numbers giving screen width and height in metres.

- screen_refresh_rate_hz:

  Optional screen refresh rate.

- stimulus_software_name:

  Optional stimulus-presentation software name.

- stimulus_software_version:

  Optional stimulus-presentation software version.

- operating_system:

  Optional operating-system description.

- vision_correction:

  Optional vision-correction description.

- manufacturer:

  Optional eye-tracker manufacturer.

- manufacturers_model_name:

  Optional eye-tracker model.

- software_versions:

  Optional acquisition-software version.

- device_serial_number:

  Optional device serial number or pseudonym.

- eye_tracking_method:

  Optional eye-tracking method.

- calibration_type:

  Optional calibration type, for example `"HV9"`.

- calibration_count:

  Optional non-negative calibration count.

- average_calibration_error_deg:

  Optional average calibration error.

- maximal_calibration_error_deg:

  Optional maximal calibration error.

- eye_tracker_distance_m:

  Optional eye-to-tracker distance in metres.

- raw_data_filters:

  Optional description of device-side filters.

- timestamp_origin:

  Description of the timestamp origin.

- custom_coordinate_system_description:

  Required when `sample_coordinate_system = "custom"`.

- column_metadata:

  Optional named list of additional or replacement metadata entries for
  exported columns.

- bids_version:

  BIDS specification version written to a newly created dataset
  description.

- dry_run:

  Logical. Validate and preview paths without writing files.

- overwrite:

  Logical. Permit replacement of the recording pair and merging of
  supplied stimulus metadata into an existing events JSON file.

## Value

An object of class `"gazepoint_bids_export"` containing the prepared
table, sidecars, file manifest, audit information, and settings.

## Details

One call exports one eye or one cyclopean recording. Binocular
recordings should be exported through separate calls with different
`recording` labels and appropriate `RecordedEye` metadata.

The compressed TSV file is headerless. Its first three columns are
always `timestamp`, `x_coordinate`, and `y_coordinate`. Missing numeric
values are written as `n/a`.

When `sample_coordinate_system = "gaze-on-screen"`, the corresponding
events JSON metadata must define screen distance, origin, resolution,
and physical size. This function creates or validates that metadata.

This helper does not execute the external BIDS Validator. Exported
datasets should still be checked with the current official validator.

## See also

[`check_gazepoint_bids()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/check_gazepoint_bids.md)

## Examples

``` r
gaze <- data.frame(
  TIME = c(0, 1 / 60, 2 / 60),
  BPOGX = c(0.45, 0.46, 0.47),
  BPOGY = c(0.52, 0.51, 0.50)
)

preview <- export_gazepoint_to_bids(
  gaze,
  bids_root = tempfile("bids-"),
  subject = "01",
  task = "viewing",
  dataset_name = "Gazepoint viewing study",
  recorded_eye = "cyclopean",
  coordinate_units = "normalized",
  screen_distance_m = 0.60,
  screen_origin = c("top", "left"),
  screen_resolution_px = c(1920, 1080),
  screen_size_m = c(0.53, 0.30),
  dry_run = TRUE
)

preview$files
#>                  role
#> 1 dataset_description
#> 2         events_json
#> 3         physio_json
#> 4       physio_tsv_gz
#>                                                                                                                           path
#> 1                                    C:/Users/STEFAN~1/AppData/Local/Temp/Rtmp0IUFbV/bids-84a03a77c96/dataset_description.json
#> 2                  C:/Users/STEFAN~1/AppData/Local/Temp/Rtmp0IUFbV/bids-84a03a77c96/sub-01/beh/sub-01_task-viewing_events.json
#> 3   C:/Users/STEFAN~1/AppData/Local/Temp/Rtmp0IUFbV/bids-84a03a77c96/sub-01/beh/sub-01_task-viewing_recording-eye1_physio.json
#> 4 C:/Users/STEFAN~1/AppData/Local/Temp/Rtmp0IUFbV/bids-84a03a77c96/sub-01/beh/sub-01_task-viewing_recording-eye1_physio.tsv.gz
#>   exists action
#> 1  FALSE  write
#> 2  FALSE  write
#> 3  FALSE  write
#> 4  FALSE  write
```
