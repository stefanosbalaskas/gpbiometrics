# Run a six-phase Gazepoint EDA/GSR analysis pipeline

Runs a conservative six-phase Gazepoint EDA/GSR workflow using native
`gpbiometrics` helpers where possible. The function imports or accepts
data, audits signal quality, prepares preprocessing outputs, creates
optional external-method bridge inputs, prepares
synchronization/model-formatting outputs, attaches model templates, and
generates reporting outputs.

## Usage

``` r
run_gazepoint_eda_analysis_pipeline(
  data = NULL,
  path = NULL,
  eda_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  signal_cols = NULL,
  sampling_rate = NULL,
  baseline_window = NULL,
  event_windows = NULL,
  event_data = NULL,
  lag_signal_pair = NULL,
  convert_resistance_to_us = FALSE,
  prepare_external_bridges = TRUE,
  bridge_methods = c("neurokit", "cvxeda", "ledalab", "pspm"),
  prepare_model_data = TRUE,
  create_reports = TRUE,
  output_dir = NULL,
  prefix = "gazepoint_eda_pipeline",
  continue_on_error = TRUE
)
```

## Arguments

- data:

  Optional Gazepoint biometric data frame or imported object.

- path:

  Optional file or folder path. Used only when `data` is `NULL`.

- eda_col:

  Optional EDA/conductance column. If omitted, the runner prefers
  `GSR_US` when available.

- time_col:

  Optional time/counter column.

- group_cols:

  Optional grouping columns.

- signal_cols:

  Optional biometric signal columns for activity plots and signal
  audits.

- sampling_rate:

  Optional sampling rate in Hz, used when `time_col` is a sample
  counter.

- baseline_window:

  Optional baseline window object passed to baseline correction helpers
  when supported.

- event_windows:

  Optional event-window table used for SCR event-window summaries when
  available.

- event_data:

  Optional event table used for TTL/event alignment when available.

- lag_signal_pair:

  Optional character vector of length two giving signals for lag
  estimation.

- convert_resistance_to_us:

  Logical. If `TRUE`, allow conservative resistance-to-conductance
  conversion when the selected EDA column is `GSR`.

- prepare_external_bridges:

  Logical. If `TRUE`, prepare selected external EDA bridge inputs.

- bridge_methods:

  Character vector containing any of `"neurokit"`, `"cvxeda"`,
  `"ledalab"`, and `"pspm"`.

- prepare_model_data:

  Logical. If `TRUE`, attempt to create SCR hurdle and biometric
  LME-ready data objects.

- create_reports:

  Logical. If `TRUE`, attempt to create report outputs.

- output_dir:

  Optional output directory for report bundles or bridge files where
  supported.

- prefix:

  File prefix used by output-producing helpers where supported.

- continue_on_error:

  Logical. If `TRUE`, failed steps are stored in `errors` and the
  pipeline continues.

## Value

A list with `overview`, `phases`, `errors`, `pipeline_guide`,
`model_templates`, `reporting_guidance`, `interpretation_guardrails`,
and `settings`.

## Details

The function does not fit `brms` or `lme4` models, does not run external
software, and does not infer emotion, valence, stress, trust,
preference, cognition, or diagnosis.
