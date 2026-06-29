# gpbiometrics roadmap status

This document records the roadmap-closure status for `gpbiometrics` version 0.2.0.

## Current release state

- Package version: 0.2.0
- Repository: https://github.com/stefanosbalaskas/gpbiometrics
- Development stage: maturing
- Validation target: `devtools::test()`, `devtools::check(args = "--as-cran")`, and `urlchecker::url_check()`
- Latest local validation before release preparation: 0 errors, 0 warnings, 0 notes; all URLs correct

## Roadmap functions implemented as standalone helpers

The following formerly open roadmap items are now implemented as exported helpers:

- `audit_gazepoint_biometrics_file()`
- `summarize_gazepoint_missingness()`
- `detrend_gazepoint_signal()`
- `align_gazepoint_streams_by_events()`
- `build_gazepoint_aoi_timecourse()`
- `summarize_gazepoint_eventlocked_multimodal()`
- `create_gazepoint_quality_dashboard()`
- `flag_gazepoint_hrv_segments()`
- `compute_gazepoint_scr_latency()`
- `compute_gazepoint_signal_lag_matrix()`
- `estimate_gazepoint_respiration_from_ppg()`
- `compare_gazepoint_conditions_bootstrap()`

## Roadmap compatibility aliases and discoverability wrappers

The following exact-name wrappers were added to improve discoverability for users searching by roadmap terminology:

- `standardize_gazepoint_columns()`
- `validate_gazepoint_format()`
- `clean_gazepoint_pupil()`
- `interpolate_gazepoint_pupil_blinks()`
- `respiration_from_ppg()`
- `prepare_gazepoint_mixed_model_data()`

These wrappers are intentionally lightweight. Where possible, they delegate to existing package-native helpers rather than duplicating core functionality.

## Intentionally conservative scope

`gpbiometrics` remains Gazepoint-native and CRAN-safe. The package does not attempt to provide full clones of external proprietary or specialist toolboxes, and it does not infer emotion, stress, cognition, preference, health status, or diagnosis directly from biometric signals.

The following classes of functionality are intentionally out of scope for the current release:

- full native Ledalab, PsPM, cvxEDA, or Kubios replacements
- heavy permutation-cluster or connectivity-analysis engines
- deep-learning gaze, PPG, stress, emotion, or health classifiers
- vendor-specific binary or JSON importers without real file evidence
- deep GUI-style replacements for commercial biometric platforms

## Remaining release-polish tasks

The main analysis roadmap is now closed for the current release. Remaining work is package-engineering and release polish:

- maintain the GitHub Actions R CMD check workflow
- optionally add coverage reporting
- optionally add a CRAN comments file when preparing an actual CRAN submission
- refresh vignettes if a journal/software-paper workflow requires a narrower narrative
- tag the release after final validation

## Release decision

Version 0.2.0 is appropriate because the package now includes a substantially expanded exported API, roadmap-closure helpers, compatibility aliases, tests, documentation, NEWS entries, and pkgdown pages.
