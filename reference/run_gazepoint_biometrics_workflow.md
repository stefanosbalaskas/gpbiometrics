# Run a Gazepoint Biometrics workflow

Runs a compact end-to-end workflow for Gazepoint Biometrics exports. The
workflow imports rectangular all-gaze/fixation-style CSV exports from a
folder, validates biometric columns, detects active channels, audits
missingness, signal quality, sampling/timing, optionally creates
window-level summaries, creates optional biometric exclusion
recommendations, extracts optional TTL marker events, and produces
checklist and methods-text outputs.

## Usage

``` r
run_gazepoint_biometrics_workflow(
  path,
  group_columns = NULL,
  recursive = FALSE,
  include_fixations = FALSE,
  include_all_gaze = TRUE,
  include_other_csv = FALSE,
  require_active_signal = TRUE,
  create_exclusion_recommendations = TRUE,
  gsr_min_usable_pct = 50,
  hr_min_usable_pct = 50,
  dial_min_usable_pct = 50,
  extract_ttl_events = TRUE,
  ttl_event_mode = c("changes", "nonzero"),
  audit_sampling = TRUE,
  sampling_group_columns = NULL,
  sampling_time_column = NULL,
  sampling_time_unit = c("samples", "seconds", "milliseconds", "microseconds"),
  expected_sampling_rate_hz = 60
)
```

## Arguments

- path:

  Folder containing Gazepoint CSV exports.

- group_columns:

  Optional columns used to create multimodal window summaries, such as
  `c("source_participant", "MEDIA_ID")`.

- recursive:

  Should subfolders be searched?

- include_fixations:

  Should fixation files be imported? Defaults to `FALSE` because
  continuous biometric summaries should usually be computed from
  all-gaze sample-level exports rather than fixation-level exports.

- include_all_gaze:

  Should all-gaze files be imported?

- include_other_csv:

  Should other non-Data-Summary CSV files be attempted?

- require_active_signal:

  Logical. Should inactive biometric signals be flagged in
  validation/checklist outputs?

- create_exclusion_recommendations:

  Logical. Should window-level and participant-level keep/review/exclude
  recommendations be created when `group_columns` are supplied?

- gsr_min_usable_pct:

  Minimum acceptable usable percentage for GSR/EDA windows.

- hr_min_usable_pct:

  Minimum acceptable usable percentage for heart-rate windows.

- dial_min_usable_pct:

  Minimum acceptable usable percentage for engagement-dial windows.

- extract_ttl_events:

  Logical. Should TTL marker events be extracted?

- ttl_event_mode:

  TTL event extraction mode passed to
  [`extract_gazepoint_ttl_events()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/extract_gazepoint_ttl_events.md).
  Use `"changes"` or `"nonzero"`.

- audit_sampling:

  Logical. Should sampling/timing information be audited?

- sampling_group_columns:

  Optional columns for the sampling audit. If `NULL`, the workflow uses
  available file/participant/media columns.

- sampling_time_column:

  Optional time/order column for the sampling audit.

- sampling_time_unit:

  Unit of the selected time/order column. Use `"seconds"`,
  `"milliseconds"`, `"microseconds"`, or `"samples"`.

- expected_sampling_rate_hz:

  Optional expected sampling rate in Hz.

## Value

A list with imported data, validation outputs, missingness summaries,
quality audits, sampling/timing audits, optional window summaries,
optional exclusion recommendations, optional TTL events, checklist, and
methods text. The object has class `"gazepoint_biometrics_workflow"`.
