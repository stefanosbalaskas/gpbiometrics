# gpbiometrics

[![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)](https://github.com/stefanosbalaskas/gpbiometrics/releases/tag/v2.0.0)
[![CRAN RStudio mirror
downloads](https://cranlogs.r-pkg.org/badges/grand-total/gpbiometrics?color=blue)](https://r-pkg.org/pkg/gpbiometrics)
[![DOI](https://img.shields.io/badge/DOI-Zenodo-blue.svg)](https://doi.org/10.5281/zenodo.20836724)
[![Paper](https://img.shields.io/badge/paper-10.3390%2Fsignals7050086-blue.svg)](https://doi.org/10.3390/signals7050086)

`gpbiometrics` provides reproducible Gazepoint-native infrastructure for
importing, validating, quality-checking, preprocessing, synchronising,
summarising, modelling, plotting, and reporting physiological and
eye-tracking exports. It covers EDA/GSR/SCR, PPG, HR, IBI/HRV, pupil,
gaze, fixations, AOIs, TTL/event timing, multimodal alignment,
interoperability, reporting, and privacy-safe validation.

**Current GitHub release:** **2.0.0** (`v2.0.0`, 18 July 2026)

[Website](https://stefanosbalaskas.github.io/gpbiometrics/) ·
[Reference](https://stefanosbalaskas.github.io/gpbiometrics/reference/index.html)
·
[Articles](https://stefanosbalaskas.github.io/gpbiometrics/articles/index.html)
·
[Release](https://github.com/stefanosbalaskas/gpbiometrics/releases/tag/v2.0.0)
· [Signals paper](https://doi.org/10.3390/signals7050086)

## What gpbiometrics provides

- Gazepoint biometric, gaze, pupil, fixation, AOI, EDA/GSR/SCR, PPG, HR,
  IBI, and HRV workflows;
- explicit schema, sampling, missingness, timebase, TTL,
  synchronization, and quality audits;
- event-locked, AOI-linked, trial-level, and model-ready summaries;
- HeartPy-style, pyHRV-style, BioSPPy-style, and PsPM-style
  Gazepoint-native workflows without claiming exact external-toolbox
  equivalence;
- MNE/EEG/LSL, BIDS, eyetrackingR, PupillometryR, gazeR, BioSPPy, pyHRV,
  and gp3tools interoperability helpers;
- reproducibility manifests, reporting bundles, reviewer-facing audits,
  release-readiness checks, and privacy-safe real-data smoke testing.

## September 2026 measurement-accountability additions

The current development branch adds four conservative diagnostics
motivated by the September 2026 methods-surveillance tranche:

- [`compare_hrv_prv_devices()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/compare_hrv_prv_devices.md)
  reports ICC(A,1), Lin’s CCC, Bland–Altman bias, and 95% limits **for
  one derived metric at a time**, while retaining signal-source and
  sensor-site provenance. It does not create a global ECG/PPG
  interchangeability decision.
- [`scr_responsivity_sensitivity()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/scr_responsivity_sensitivity.md)
  preserves the conventional SCR non-responder flag, estimates a
  Beta-Binomial posterior response probability, and retains low-reactive
  participants for model-based sensitivity analysis instead of imposing
  irreversible preprocessing deletion.
- [`physiology_validation_ladder()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/physiology_validation_ladder.md)
  separates acquisition QC, analytical QC, construct evidence,
  within-person evidence, and held-out-person generalization.
  Population/generalization claims require held-out-person validation to
  pass.
- [`ppg_topology_features()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/ppg_topology_features.md)
  is opt-in and experimental. It summarizes H0 persistence lifetimes
  from a delay embedding as a **structural waveform descriptor**, not a
  direct physiological surrogate, and carries a participant-grouped
  validation guardrail.

These are post-2.0.0 development additions and do not alter the
immutable `v2.0.0` release archive.

See the [Measurement accountability for Gazepoint physiology
article](https://stefanosbalaskas.github.io/gpbiometrics/articles/measurement-accountability.html).

## Installation

Install the exact GitHub 2.0.0 release:

``` r

install.packages("remotes")
remotes::install_github("stefanosbalaskas/gpbiometrics", ref = "v2.0.0")
```

For the current development branch, including the September
measurement-accountability additions:

``` r

remotes::install_github("stefanosbalaskas/gpbiometrics")
```

## Quick start

``` r

library(gpbiometrics)

folder <- "path/to/gazepoint_exports"
workflow <- run_gazepoint_biometrics_workflow(
  path = folder,
  include_all_gaze = TRUE,
  include_fixations = FALSE,
  include_other_csv = FALSE,
  expected_sampling_rate_hz = 60
)

summarise_gazepoint_biometrics_workflow(workflow)
```

For private real data, keep source exports and generated smoke-test
outputs outside the package repository.

## Main workflow

``` text
Gazepoint / external exports
  -> schema + signal availability audit
  -> timing / TTL / missingness / quality checks
  -> EDA / PPG / IBI / pupil / gaze preprocessing
  -> fixation / AOI / event / multimodal alignment
  -> physiological and process feature extraction
  -> model-ready tables
  -> plots + reports + reproducibility evidence
  -> optional external-toolbox cross-checks
```

The package is intentionally modular: researchers can run a complete
workflow or call individual helpers while keeping preprocessing and
interpretation decisions explicit.

## Release validation

The `v2.0.0` release record reports:

- **3,515 package tests passed**;
- **49 release-readiness tests passed**;
- **40 interoperability-version tests passed**;
- **55 private smoke-harness tests passed**;
- `R CMD check`: **0 errors, 0 warnings, 0 notes**; and
- pkgdown configuration: **no problems found**.

The September 2026 additions are development functionality layered on
top of this qualified release baseline.

## Interpretation guardrails

`gpbiometrics` treats biometric outputs as physiological descriptors,
quality-control evidence, or analysis-ready measurements. It does not
infer emotion, stress, cognition, preference, attention quality, health
status, diagnosis, or another psychological/clinical state directly from
EDA, HRV/PRV, PPG, pupil, gaze, or multimodal signals.

Metric agreement does not imply sensor interchangeability;
retention-first responsivity does not diagnose participant state;
held-out prediction does not establish construct validity; and
experimental topology features are not physiological surrogates without
independent validation.

## Documentation

- [Article
  roadmap](https://stefanosbalaskas.github.io/gpbiometrics/articles/article-roadmap.html)
- [EDA/GSR/SCR
  workflow](https://stefanosbalaskas.github.io/gpbiometrics/articles/eda-scr-workflow.html)
- [PPG/HRV
  workflow](https://stefanosbalaskas.github.io/gpbiometrics/articles/ppg-hrv-workflow.html)
- [Pupil QC
  workflow](https://stefanosbalaskas.github.io/gpbiometrics/articles/pupil-qc-workflow.html)
- [Event alignment and AOI
  workflow](https://stefanosbalaskas.github.io/gpbiometrics/articles/event-alignment-aoi-workflow.html)
- [MNE/EEG/LSL
  interoperability](https://stefanosbalaskas.github.io/gpbiometrics/articles/mne-eeg-lsl-workflow.html)
- [Measurement
  accountability](https://stefanosbalaskas.github.io/gpbiometrics/articles/measurement-accountability.html)
- [Complete function
  reference](https://stefanosbalaskas.github.io/gpbiometrics/reference/index.html)

## Citation

For the installed package citation:

``` r

citation("gpbiometrics")
packageVersion("gpbiometrics")
```

The package paper is **“gpbiometrics: An R Package for Reproducible
Analysis and Reporting of Gazepoint Biometrics Exports”**, *Signals*
(2026), DOI
[`10.3390/signals7050086`](https://doi.org/10.3390/signals7050086).

## License

MIT License.
