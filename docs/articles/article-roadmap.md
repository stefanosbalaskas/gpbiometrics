# Article roadmap

## Planned workflow articles

`gpbiometrics` now contains a broad set of Gazepoint-oriented import,
preprocessing, QC, plotting, modelling-preparation, reporting, and
reproducibility helpers. The article section should make these helpers
easier to use by organizing them into practical workflows rather than
leaving users to navigate the reference index alone.

This roadmap lists the next documentation articles planned for the
package. The goal is conservative, reviewer-facing documentation: each
article should show how to inspect, clean, summarize, and report
Gazepoint-derived signals without making clinical, affective, emotional,
or diagnostic claims.

### Current articles

- `gpbiometrics-workflow`: package-level workflow overview.
- `quality-control-workflow`: reviewer-facing QC sequence linking layout
  checks, metadata validation, missingness, signal quality, exclusion
  recommendations, dashboard summaries, and reproducibility outputs.
- `plot-gallery`: visual examples for package plotting helpers.
- `cluster-permutation`: cluster-based time-course testing workflow.

### Priority 1: pupil and gaze quality control

Suggested file: `vignettes/articles/pupil-qc-workflow.Rmd`.

Core helpers to showcase:

- [`detect_gazepoint_blinks()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_blinks.md)
- [`detect_gazepoint_pupil_blinks()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_pupil_blinks.md)
- [`smooth_gazepoint_pupil()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/smooth_gazepoint_pupil.md)
- [`interpolate_gazepoint_pupil_blinks()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/interpolate_gazepoint_pupil_blinks.md)
- [`baseline_correct_gazepoint_pupil()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/baseline_correct_gazepoint_pupil.md)
- [`filter_gazepoint_gaze()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/filter_gazepoint_gaze.md)
- [`summarize_gazepoint_pupil_events()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarize_gazepoint_pupil_events.md)
- [`plot_gazepoint_missingness()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_missingness.md)

Article purpose: show a transparent pupil/gaze preprocessing sequence,
including blink detection, missingness review, smoothing, interpolation,
baseline correction, and conservative reporting.

### Priority 2: EDA, GSR, and SCR workflow

Suggested file: `vignettes/articles/eda-scr-workflow.Rmd`.

Core helpers to showcase:

- [`audit_gazepoint_gsr_units()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_gsr_units.md)
- [`convert_gazepoint_gsr_to_conductance()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/convert_gazepoint_gsr_to_conductance.md)
- [`audit_gazepoint_gsr_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_gsr_quality.md)
- [`audit_gazepoint_eda_artifacts()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_eda_artifacts.md)
- [`baseline_correct_gazepoint_gsr()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/baseline_correct_gazepoint_gsr.md)
- [`decompose_gazepoint_eda()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/decompose_gazepoint_eda.md)
- [`detect_gazepoint_scr_events()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_scr_events.md)
- [`detect_gazepoint_scr_peaks()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_scr_peaks.md)
- [`normalize_gazepoint_scr()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/normalize_gazepoint_scr.md)
- [`summarise_gazepoint_gsr_tonic_phasic()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_gsr_tonic_phasic.md)
- [`summarise_gazepoint_scr_event_windows()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_scr_event_windows.md)
- [`plot_gazepoint_scr_events()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_scr_events.md)
- [`plot_gazepoint_eda_decomposition()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_eda_decomposition.md)

Article purpose: show how to audit, preprocess, decompose, summarize,
and plot EDA/GSR/SCR signals using conservative signal-processing
language.

### Priority 3: PPG, IBI, HRV, and respiration workflow

Suggested file: `vignettes/articles/ppg-hrv-workflow.Rmd`.

Core helpers to showcase:

- [`filter_gazepoint_ppg_signal()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/filter_gazepoint_ppg_signal.md)
- [`remove_gazepoint_ppg_baseline_wander()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/remove_gazepoint_ppg_baseline_wander.md)
- [`detect_gazepoint_ppg_peaks()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_ppg_peaks.md)
- [`detect_gazepoint_ppg_onsets()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/detect_gazepoint_ppg_onsets.md)
- [`audit_gazepoint_ibi_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_ibi_quality.md)
- [`correct_gazepoint_beats()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/correct_gazepoint_beats.md)
- [`summarize_gazepoint_beat_corrections()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarize_gazepoint_beat_corrections.md)
- [`extract_gazepoint_hrv_features()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/extract_gazepoint_hrv_features.md)
- [`summarise_gazepoint_hrv_features()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_hrv_features.md)
- [`estimate_gazepoint_respiration_from_ppg()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/estimate_gazepoint_respiration_from_ppg.md)
- [`plot_gazepoint_ppg_peak_detection()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_ppg_peak_detection.md)
- [`plot_gazepoint_ppg_segmentwise()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_ppg_segmentwise.md)
- [`plot_gazepoint_ppg_breathing()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_ppg_breathing.md)

Article purpose: show a reproducible PPG-to-IBI/HRV sequence with
explicit quality checks and correction logs.

### Priority 4: TTL, AOI, and event-locked workflow

Suggested file: `vignettes/articles/event-alignment-aoi-workflow.Rmd`.

Core helpers to showcase:

- [`extract_gazepoint_ttl_events()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/extract_gazepoint_ttl_events.md)
- [`align_gazepoint_biometrics_to_ttl()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/align_gazepoint_biometrics_to_ttl.md)
- [`align_gazepoint_streams_by_events()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/align_gazepoint_streams_by_events.md)
- [`match_gazepoint_events_to_biometrics()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/match_gazepoint_events_to_biometrics.md)
- [`sync_gazepoint_biometrics_with_gaze()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/sync_gazepoint_biometrics_with_gaze.md)
- [`summarise_gazepoint_aoi_biometrics()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_aoi_biometrics.md)
- [`summarize_gazepoint_aoi_dwell()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarize_gazepoint_aoi_dwell.md)
- [`summarize_gazepoint_eventlocked_multimodal()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarize_gazepoint_eventlocked_multimodal.md)
- [`plot_gazepoint_multimodal_timeline()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_multimodal_timeline.md)
- [`plot_gazepoint_aoi_biometrics()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_aoi_biometrics.md)

Article purpose: show how to move from raw events and biometric streams
to aligned, AOI-aware, event-locked analysis tables.

### Priority 5: reporting and reproducibility workflow

Suggested file:
`vignettes/articles/reporting-reproducibility-workflow.Rmd`.

Core helpers to showcase:

- [`create_gazepoint_analysis_manifest()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_analysis_manifest.md)
- [`generate_gazepoint_manifest()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/generate_gazepoint_manifest.md)
- [`create_gazepoint_dictionary()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_dictionary.md)
- [`create_gazepoint_analysis_decision_log()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_analysis_decision_log.md)
- [`write_gazepoint_decision_log()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/write_gazepoint_decision_log.md)
- [`create_gazepoint_methods_section()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_methods_section.md)
- [`create_gazepoint_biometrics_methods_text()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_methods_text.md)
- [`create_gazepoint_qc_supplement()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_qc_supplement.md)
- [`create_gazepoint_reproducibility_statement()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_reproducibility_statement.md)
- [`export_gazepoint_biometrics_report_bundle()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/export_gazepoint_biometrics_report_bundle.md)

Article purpose: show how to turn QC outputs into audit-ready tables,
methods text, decision logs, manifests, and reproducibility statements.

### Priority 6: synthetic-data showcase

Suggested file: `vignettes/articles/synthetic-data-showcase.Rmd`.

Core helpers to showcase:

- [`simulate_gazepoint_biometrics()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/simulate_gazepoint_biometrics.md)
- [`simulate_gazepoint_eye_data()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/simulate_gazepoint_eye_data.md)
- [`simulate_gazepoint_multimodal_data()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/simulate_gazepoint_multimodal_data.md)
- [`simulate_gazepoint_artifact()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/simulate_gazepoint_artifact.md)
- [`run_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_biometrics_workflow.md)
- [`diagnose_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/diagnose_gazepoint_biometrics_workflow.md)
- [`summarise_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_biometrics_workflow.md)
- [`plot_gazepoint_biometric_report_dashboard()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_biometric_report_dashboard.md)

Article purpose: provide a fully reproducible demonstration that does
not depend on private Gazepoint exports.

### Priority 7: design and event-coverage audit workflow

Suggested file: `vignettes/articles/design-audit-workflow.Rmd`.

Core helpers to showcase:

- [`audit_gazepoint_experiment_design()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_experiment_design.md)
- [`audit_gazepoint_condition_balance()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_condition_balance.md)
- [`audit_gazepoint_event_coverage()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_event_coverage.md)
- [`audit_gazepoint_session_comparability()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_session_comparability.md)
- [`audit_gazepoint_dataset_structure()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_dataset_structure.md)
- [`audit_gazepoint_export_schema()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_export_schema.md)
- [`audit_gazepoint_preregistration_consistency()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_preregistration_consistency.md)
- [`summarize_gazepoint_qc_overview()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarize_gazepoint_qc_overview.md)
- [`create_gazepoint_preregistration_checklist()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_preregistration_checklist.md)

Article purpose: show how to check whether the exported dataset matches
the intended experimental design before analysis.

### Priority 8: external-toolbox preparation workflow

Suggested file: `vignettes/articles/toolbox-bridges-workflow.Rmd`.

Core helpers to showcase:

- [`prepare_gazepoint_heartpy_input()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_heartpy_input.md)
- [`prepare_gazepoint_pyppg_input()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_pyppg_input.md)
- [`prepare_gazepoint_rhrv_input()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_rhrv_input.md)
- [`prepare_gazepoint_neurokit_eda_input()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_neurokit_eda_input.md)
- [`prepare_gazepoint_ledalab_input()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_ledalab_input.md)
- [`prepare_gazepoint_pspm_input()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_pspm_input.md)
- [`prepare_gazepoint_cvxeda_input()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_cvxeda_input.md)
- [`export_gazepoint_heartpy_input()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/export_gazepoint_heartpy_input.md)
- [`export_gazepoint_rhrv_input()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/export_gazepoint_rhrv_input.md)

Article purpose: show how gpbiometrics prepares Gazepoint-derived data
for external physiological-analysis toolchains while keeping the native
QC trail in R.

### Plot-gallery expansion

The existing `plot-gallery` article should eventually be expanded with
examples for:

- [`plot_gazepoint_missingness()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_missingness.md)
- [`plot_gazepoint_signal_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_signal_quality.md)
- [`plot_gazepoint_signal_activity()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_signal_activity.md)
- [`plot_gazepoint_time_resets()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_time_resets.md)
- [`plot_gazepoint_biometric_quality()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_biometric_quality.md)
- [`plot_gazepoint_biometric_signals()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_biometric_signals.md)
- [`plot_gazepoint_multimodal_timeline()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_multimodal_timeline.md)
- [`plot_gazepoint_scr_events()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_scr_events.md)
- [`plot_gazepoint_ppg_peak_detection()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_ppg_peak_detection.md)
- [`plot_gazepoint_biometric_report_dashboard()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/plot_gazepoint_biometric_report_dashboard.md)

### Implementation order

Recommended branch order:

1.  `feature/pupil-qc-workflow-article`
2.  `feature/eda-scr-workflow-article`
3.  `feature/ppg-hrv-workflow-article`
4.  `feature/event-alignment-aoi-workflow-article`
5.  `feature/reporting-reproducibility-article`
6.  `feature/synthetic-data-showcase-article`
7.  `feature/design-audit-workflow-article`
8.  `feature/toolbox-bridges-workflow-article`
9.  `feature/plot-gallery-expansion`

Each article should remain compact, reproducible with synthetic or
example data where possible, and explicit about what the functions do
and do not claim.
