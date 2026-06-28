# gpbiometrics: Process, Audit, Plot, and Report Gazepoint Biometrics Data

`gpbiometrics` provides helper functions for importing, checking,
preprocessing, summarising, diagnosing, plotting, and reporting
Gazepoint Biometrics exports. It is designed for reproducible offline
workflows involving physiological, response-channel, event-marker, and
timing data exported alongside Gazepoint eye-tracking recordings.

## Details

The package supports common Gazepoint biometric channels, including
GSR/EDA, heart rate, interbeat interval or RR-style intervals,
engagement dial, and TTL markers. It provides functions for folder-level
import, data-summary import, schema and timebase detection,
active-channel detection, column validation, missingness audits,
signal-quality audits, sampling and timing audits, dropout and flatline
flagging, baseline correction, smoothing, window summaries, TTL event
extraction, biometric-to-gaze synchronisation, exclusion
recommendations, workflow diagnostics, report-ready tables, cautious
methods text, lightweight report generation, and base-R diagnostic
plotting.

Schema and timing helpers include
[`standardise_gazepoint_biometric_names()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/standardise_gazepoint_biometric_names.md),
[`detect_gazepoint_biometric_schema()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_biometric_schema.md),
[`detect_gazepoint_time_columns()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_time_columns.md),
and
[`detect_gazepoint_biometric_timebase()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_biometric_timebase.md).
Signal-availability and quality helpers include
[`summarise_gazepoint_biometric_validity()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_biometric_validity.md),
[`flag_gazepoint_biometric_dropouts()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/flag_gazepoint_biometric_dropouts.md),
[`audit_gazepoint_gsr_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_gsr_quality.md),
[`audit_gazepoint_hr_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_hr_quality.md),
[`audit_gazepoint_engagement_dial()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_engagement_dial.md),
and
[`audit_gazepoint_ibi_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_ibi_quality.md).

Preprocessing and summary helpers include
[`baseline_correct_gazepoint_gsr()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/baseline_correct_gazepoint_gsr.md),
[`baseline_correct_gazepoint_hr()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/baseline_correct_gazepoint_hr.md),
[`smooth_gazepoint_biometrics()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/smooth_gazepoint_biometrics.md),
[`convert_gazepoint_gsr_to_conductance()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/convert_gazepoint_gsr_to_conductance.md),
[`summarise_gazepoint_gsr_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_gsr_windows.md),
[`summarise_gazepoint_hr_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_hr_windows.md),
[`summarise_gazepoint_engagement_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_engagement_windows.md),
[`summarise_gazepoint_dial_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_dial_windows.md),
[`summarise_gazepoint_ibi_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_ibi_windows.md),
[`summarise_gazepoint_gsr_tonic_phasic()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_gsr_tonic_phasic.md),
[`summarise_gazepoint_multimodal_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_multimodal_windows.md),
[`summarise_gazepoint_ibi_hrv_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_ibi_hrv_windows.md),
and
[`summarise_gazepoint_full_biometric_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_full_biometric_windows.md).

Synchronisation, modelling, workflow, and reporting helpers include
[`sync_gazepoint_biometrics_with_gaze()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/sync_gazepoint_biometrics_with_gaze.md),
[`join_gazepoint_biometrics_to_master()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/join_gazepoint_biometrics_to_master.md),
[`join_gazepoint_biometrics_to_gp3tools()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/join_gazepoint_biometrics_to_gp3tools.md),
[`prepare_gazepoint_multimodal_model_data()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_multimodal_model_data.md),
[`run_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_biometrics_workflow.md),
[`summarise_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_biometrics_workflow.md),
[`diagnose_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/diagnose_gazepoint_biometrics_workflow.md),
[`create_gazepoint_biometrics_checklist()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_checklist.md),
[`create_gazepoint_biometrics_methods_text()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_methods_text.md),
[`create_gazepoint_biometrics_report_tables()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_report_tables.md),
[`write_gazepoint_biometrics_report_tables()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/write_gazepoint_biometrics_report_tables.md),
and
[`create_gazepoint_biometrics_report()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_report.md).
Diagnostic plotting helpers include
[`plot_gazepoint_biometric_signals()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_biometric_signals.md)
and
[`plot_gazepoint_biometric_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_biometric_quality.md).

The package treats biometric signals conservatively. GSR/EDA is handled
as an electrodermal activity or arousal-related signal rather than
emotional valence. Heart-rate summaries should be interpreted relative
to baseline, artefact handling, and task context. Raw Gazepoint `HRV`
columns should be treated as validity or vendor flags unless independent
documentation proves otherwise. IBI-derived HRV-style summaries should
be computed only from genuine interbeat interval or RR-style interval
columns. Eye-tracking measures, when combined with biometric data,
should be interpreted as indicators of visual attention rather than
direct evidence of cognition, scrutiny, or evaluation.

## Main workflow

The main workflow function is:

[`run_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_biometrics_workflow.md)

Useful follow-up helpers include:

[`summarise_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_biometrics_workflow.md),
[`diagnose_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/diagnose_gazepoint_biometrics_workflow.md),
[`create_gazepoint_biometrics_report_tables()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_report_tables.md),
[`write_gazepoint_biometrics_report_tables()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/write_gazepoint_biometrics_report_tables.md),
and
[`create_gazepoint_biometrics_report()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_report.md).

## Interpretation caution

`gpbiometrics` is a preprocessing, quality-control, visualisation, and
reporting toolkit. It does not classify emotions, mental states, or
cognitive processes directly. Researchers should interpret biometric
signals in relation to experimental design, baseline periods, stimulus
timing, task demands, artefact handling, and complementary behavioural
or self-report measures.

## See also

Useful links:

- <https://github.com/stefanosbalaskas/gpbiometrics>

- Report bugs at
  <https://github.com/stefanosbalaskas/gpbiometrics/issues>

## Author

**Maintainer**: Stefanos Balaskas <s.balaskas@ac.upatras.gr>

Authors:

- Stefanos Balaskas <s.balaskas@ac.upatras.gr>
