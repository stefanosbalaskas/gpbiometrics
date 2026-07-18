# Diagnosing common Gazepoint export and workflow problems

## Purpose

This article provides a structured sequence for diagnosing common
Gazepoint export, signal, timing, gaze, event, and synchronization
problems before modelling.

Warnings should be investigated and reported. They should not
automatically be converted into exclusions without a study-specific
rule.

## Diagnostic sequence

``` r

diagnostic_functions <- data.frame(
  order = seq_len(8),
  function_name = c(
    "validate_gazepoint_biometrics",
    "audit_gazepoint_biometrics_file",
    "summarize_gazepoint_missingness",
    "assess_gazepoint_sampling_irregularity",
    "detect_gazepoint_time_columns",
    "validate_gazepoint_gaze",
    "diagnose_gazepoint_sync_drift",
    "run_gazepoint_biometrics_real_data_readiness"
  ),
  purpose = c(
    "Basic structure and active-channel validation",
    "Front-door file and schema audit",
    "Missing-value and gap diagnostics",
    "Sampling regularity assessment",
    "Time-column detection and interpretation",
    "Gaze range, validity, and timestamp checks",
    "Synchronization offset and drift diagnostics",
    "Final real-data readiness gate"
  ),
  stringsAsFactors = FALSE
)

diagnostic_functions$available <-
  diagnostic_functions$function_name %in%
  getNamespaceExports("gpbiometrics")

diagnostic_functions
#>   order                                function_name
#> 1     1                validate_gazepoint_biometrics
#> 2     2              audit_gazepoint_biometrics_file
#> 3     3              summarize_gazepoint_missingness
#> 4     4       assess_gazepoint_sampling_irregularity
#> 5     5                detect_gazepoint_time_columns
#> 6     6                      validate_gazepoint_gaze
#> 7     7                diagnose_gazepoint_sync_drift
#> 8     8 run_gazepoint_biometrics_real_data_readiness
#>                                         purpose available
#> 1 Basic structure and active-channel validation      TRUE
#> 2              Front-door file and schema audit      TRUE
#> 3             Missing-value and gap diagnostics      TRUE
#> 4                Sampling regularity assessment      TRUE
#> 5      Time-column detection and interpretation      TRUE
#> 6    Gaze range, validity, and timestamp checks      TRUE
#> 7  Synchronization offset and drift diagnostics      TRUE
#> 8                Final real-data readiness gate      TRUE

stopifnot(all(diagnostic_functions$available))
```

## Validate before preprocessing

``` r

args(validate_gazepoint_biometrics)
#> function (data, require_active_signal = FALSE)
#> NULL
args(audit_gazepoint_biometrics_file)
#> function (path = NULL, data = NULL, expected_modalities = c("time",
#>     "eda", "ppg", "hr", "ibi", "pupil", "gaze", "events"), time_col = NULL,
#>     standardize = TRUE, include_data = FALSE, long_gap_s = NULL)
#> NULL
```

``` r

validation <- validate_gazepoint_biometrics(
  data
)

preflight <- audit_gazepoint_biometrics_file(
  data
)
```

Check that expected biometric, gaze, event, identifier, and time columns
are present before renaming, filtering, interpolating, or joining data.

## Inspect missingness and gaps

``` r

args(summarize_gazepoint_missingness)
#> function (data, signal_cols = NULL, time_col = NULL, group_cols = NULL,
#>     long_gap_s = NULL, count_nonfinite = TRUE)
#> NULL
```

``` r

missingness <- summarize_gazepoint_missingness(
  data,
  ...
)
```

Distinguish isolated missing samples, short missing runs, long dropout
periods, participant-specific failures, trial-specific failures, and
channel-specific inactivity.

Interpolation should be limited to prespecified short gaps and should
preserve an interpolation indicator.

## Check sampling and time columns

``` r

args(assess_gazepoint_sampling_irregularity)
#> function (data, time_col = NULL, group_cols = NULL, nominal_rate_hz = NULL,
#>     large_gap_factor = 3)
#> NULL
args(detect_gazepoint_time_columns)
#> function (data)
#> NULL
```

``` r

sampling <- assess_gazepoint_sampling_irregularity(
  data,
  ...
)

time_columns <- detect_gazepoint_time_columns(
  data
)
```

Common problems include duplicated timestamps, time resets, inconsistent
time units, nonmonotonic sequences, and nominal rates that do not match
observed sample intervals.

## Validate gaze separately

``` r

args(validate_gazepoint_gaze)
#> function (data, time_col = NULL, x_col = NULL, y_col = NULL,
#>     validity_cols = NULL, group_cols = NULL, coordinate_system = c("auto",
#>         "normalized", "pixels", "degrees"), screen_width_px = NULL,
#>     screen_height_px = NULL, time_unit = c("auto", "seconds",
#>         "milliseconds", "samples"), sampling_rate_hz = NULL,
#>     expected_sampling_rate_hz = NULL, sampling_tolerance = 0.2,
#>     missing_threshold = 0.2, gap_multiplier = 3)
#> NULL
```

``` r

gaze_validation <- validate_gazepoint_gaze(
  data,
  ...
)
```

Review missing coordinates, out-of-range coordinates, timestamp gaps,
coordinate-system assumptions, pupil validity, and trial coverage.

## Diagnose synchronization

``` r

args(diagnose_gazepoint_sync_drift)
#> function (reference, target = NULL, reference_time_col = NULL,
#>     target_time_col = NULL, max_pairs = NULL)
#> NULL
```

``` r

sync_diagnostics <- diagnose_gazepoint_sync_drift(
  ...
)
```

Do not infer synchronization quality from a successful join alone.
Retain matched and unmatched event counts, offset estimates, drift
estimates, timing residuals, and tolerance settings.

## Run the final readiness gate

``` r

args(run_gazepoint_biometrics_real_data_readiness)
#> function (data = NULL, workflow_result = NULL, min_rows = 100,
#>     min_active_signal_count = 1, max_missing_prop = 0.5, required_signal_cols = NULL,
#>     require_gsr_us_preferred = TRUE, require_ibi_for_hrv = FALSE,
#>     time_col = NULL, ttl_cols = NULL)
#> NULL
```

``` r

readiness <- run_gazepoint_biometrics_real_data_readiness(
  ...
)
```

A readiness result is a structured decision aid, not an automatic
declaration that data are scientifically valid.

## Symptom-to-action guide

| Symptom | First checks | Conservative response |
|----|----|----|
| No active EDA or pulse channel | Schema, validity, unique finite values | Verify acquisition and export settings |
| Implausible GSR values | Unit audit and source documentation | Do not convert without documented units |
| HRV contains zeros and ones | Vendor-field interpretation | Treat as validity unless documented otherwise |
| Large missing pupil segments | Blink flags and gap duration | Avoid long-gap interpolation |
| Gaze outside expected bounds | Coordinate system and screen dimensions | Correct metadata before AOI assignment |
| Repeated timestamps | Reset audit and group structure | Segment recordings before alignment |
| Few matched events | IDs, labels, origins, and tolerance | Resolve mapping before analysis |
| Quality differs by condition | Condition-level QC summaries | Report imbalance and assess sensitivity |
| Workflow warnings | Diagnostic tables and settings | Investigate each warning explicitly |

## Reporting checklist

Report:

- original file inventory and export type;
- detected schema and renamed columns;
- active and inactive channels;
- time columns, units, and resets;
- observed sampling rate and irregularity;
- missingness and longest gaps;
- gaze coordinate and validity checks;
- event coverage and synchronization quality;
- exclusion and interpolation rules;
- unresolved warnings;
- final readiness status and supporting evidence.

## Interpretation guardrails

Signal availability is not evidence of emotional, cognitive, clinical,
or behavioral meaning. Quality-control helpers describe data properties
and workflow readiness. Scientific interpretation requires a suitable
design, validated measures, transparent preprocessing, and appropriate
analysis.
