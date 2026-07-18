# MNE, EEG, and LSL interoperability workflow

## Purpose

This article documents an auditable workflow for preparing Gazepoint
events and signal channels for MNE-Python, aligning Gazepoint timestamps
with an EEG clock, and handling LSL or XDF synchronization information.

The interoperability helpers prepare data and synchronization records.
They do not replace EEG preprocessing, event-quality review, or
specialist MNE analysis.

## Workflow map

``` r

workflow_functions <- data.frame(
  stage = c(
    "Event conversion",
    "Channel preparation",
    "EEG clock alignment",
    "LSL stream synchronization",
    "LSL clock-offset estimation",
    "Optional FIF writing",
    "Reproducibility metadata"
  ),
  function_name = c(
    "prepare_gazepoint_mne_events",
    "prepare_gazepoint_mne_input",
    "align_gazepoint_to_eeg",
    "sync_gazepoint_signals_via_lsl",
    "estimate_gazepoint_lsl_clock_offsets",
    "write_gazepoint_mne_fif",
    "session_info_gazepoint"
  ),
  stringsAsFactors = FALSE
)

workflow_functions$available <-
  workflow_functions$function_name %in%
  getNamespaceExports("gpbiometrics")

workflow_functions
#>                         stage                        function_name available
#> 1            Event conversion         prepare_gazepoint_mne_events      TRUE
#> 2         Channel preparation          prepare_gazepoint_mne_input      TRUE
#> 3         EEG clock alignment               align_gazepoint_to_eeg      TRUE
#> 4  LSL stream synchronization       sync_gazepoint_signals_via_lsl      TRUE
#> 5 LSL clock-offset estimation estimate_gazepoint_lsl_clock_offsets      TRUE
#> 6        Optional FIF writing              write_gazepoint_mne_fif      TRUE
#> 7    Reproducibility metadata               session_info_gazepoint      TRUE

stopifnot(all(workflow_functions$available))
```

## Prepare event information

A useful event table should retain:

- participant and recording identifiers;
- event labels or numeric event codes;
- original Gazepoint timestamps;
- the time unit and recording origin;
- TTL validity or marker-channel information;
- a stable event identifier.

``` r

args(prepare_gazepoint_mne_events)
#> function (events, event_time_col = NULL, event_label_col = NULL,
#>     event_code_col = NULL, marker_cols = NULL, participant_col = NULL,
#>     trial_col = NULL, time_unit = c("auto", "seconds", "milliseconds",
#>         "samples"), sampling_rate_hz, recording_start_s = 0,
#>     first_samp = 0L, event_id = NULL, previous_value = 0L, marker_onset = c("change",
#>         "nonzero"), duplicate = c("error", "allow"), export_csv = NULL)
#> NULL
```

``` r

mne_events <- prepare_gazepoint_mne_events(
  ...
)
```

Confirm that event order, sample indices, event codes, and timestamp
conversion agree with the experimental log.

## Prepare Gazepoint channels for MNE

``` r

args(prepare_gazepoint_mne_input)
#> function (data, channel_cols = NULL, channel_names = NULL, channel_types = NULL,
#>     time_col = NULL, time_unit = c("auto", "seconds", "milliseconds",
#>         "samples"), sampling_rate_hz = NULL, first_samp = 0L,
#>     scale_factors = NULL, missing = c("error", "allow"), irregular = c("error",
#>         "allow"), sampling_tolerance = 0.05)
#> NULL
```

``` r

mne_input <- prepare_gazepoint_mne_input(
  ...
)
```

Document every exported channel’s source column, signal type, physical
unit, sampling rate, missing-data handling, filtering history, and
validity rule.

Do not label an HRV validity field as an HRV metric. EDA, pupil, pulse,
gaze, HR, and IBI channels should not be reinterpreted as direct
psychological states.

## Align Gazepoint and EEG clocks

``` r

args(align_gazepoint_to_eeg)
#> function (gazepoint, gazepoint_events, eeg_events, gazepoint_time_col = NULL,
#>     gazepoint_event_time_col = NULL, eeg_event_time_col = NULL,
#>     eeg_event_sample_col = NULL, gazepoint_event_id_col = NULL,
#>     eeg_event_id_col = NULL, gazepoint_time_unit = c("auto",
#>         "seconds", "milliseconds", "samples"), eeg_time_unit = c("auto",
#>         "seconds", "milliseconds", "samples"), eeg_sampling_rate_hz = NULL,
#>     method = c("offset", "linear"), match_by = c("auto", "id",
#>         "row"), robust = TRUE, maximum_residual_s = NULL, residual_action = c("error",
#>         "allow"), output_col = "time_eeg_s")
#> NULL
```

``` r

alignment <- align_gazepoint_to_eeg(
  ...
)
```

Retain original and adjusted timestamps, estimated offset, estimated
drift, matched event pairs, unmatched events, and residual timing
errors.

Alignment should not silently remove events or conceal poor
correspondence between recording clocks.

## Synchronize LSL or XDF streams

``` r

args(sync_gazepoint_signals_via_lsl)
#> function (streams, reference = NULL, time_cols = NULL, clock_offsets_s = NULL,
#>     known_lags_s = NULL, relative_zero = c("reference", "global",
#>         "none"), dejitter = c("none", "linear"), nominal_rates_hz = NULL,
#>     merge = c("none", "nearest"), tolerance_s = NULL)
#> NULL
args(estimate_gazepoint_lsl_clock_offsets)
#> function (stream_name = NULL, stream_type = NULL, source_id = NULL,
#>     timeout_s = 5, n_estimates = 5L, pause_s = 0.05, python = NULL,
#>     execute = TRUE)
#> NULL
```

``` r

clock_offsets <- estimate_gazepoint_lsl_clock_offsets(
  ...
)

lsl_sync <- sync_gazepoint_signals_via_lsl(
  ...
)
```

Live clock-offset estimation requires a local `pylsl` installation.
Imported XDF workflows should retain stream names, source identifiers,
nominal rates, original timestamps, corrected timestamps, and any
dejittering decision.

## Optional native FIF writing

``` r

args(write_gazepoint_mne_fif)
#> function (x, fname, events = NULL, overwrite = FALSE, fmt = c("single",
#>     "double"), python = NULL, execute = TRUE, keep_intermediate = FALSE,
#>     verbose = FALSE, ...)
#> NULL
```

``` r

fif_result <- write_gazepoint_mne_fif(
  ...
)
```

Native FIF writing requires a local Python and MNE installation. Use a
dry run or temporary output directory first and inspect the resulting
channel metadata.

## Reporting checklist

Report at minimum:

- Gazepoint and EEG acquisition rates;
- event sources and marker definitions;
- timestamp units and clock origins;
- event-matching method;
- estimated offset and drift;
- synchronization residuals;
- unmatched or excluded events;
- resampling, interpolation, or dejittering decisions;
- MNE, Python, pylsl, R, and gpbiometrics versions.

``` r

args(session_info_gazepoint)
#> function (packages = NULL, include_loaded = TRUE, timestamp = Sys.time())
#> NULL
```

## Interpretation guardrails

Synchronization establishes temporal correspondence, not causal or
psychological interpretation. Aligned signals remain measurements whose
interpretation depends on study design, preprocessing,
operationalization, and convergent evidence.
