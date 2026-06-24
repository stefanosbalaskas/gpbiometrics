# gpbiometrics synthetic kiosk showcase

This folder contains a paper-style demonstration workflow for the `gpbiometrics` R package.

The showcase uses the public synthetic dataset included with the package under:

```text
inst/extdata/gazepoint_biometrics_kiosk_demo_exports/
```

The dataset is fully artificial. It simulates a public-service touchscreen kiosk usability task and is not derived from real participants or from any private study data.

## Scenario

Synthetic participants complete public-service kiosk tasks under a 2 × 2 design:

* interface complexity: `simple` vs. `dense`
* feedback clarity: `clear` vs. `ambiguous`

The dataset contains:

* 36 synthetic participants
* 4 kiosk tasks per participant
* 60 Hz sampling
* 69,120 rows
* 36 Gazepoint-like all-gaze CSV exports
* gaze, AOI, pupil, GSR/EDA, HR, IBI, pulse waveform, engagement dial, TTL markers, and task metadata

## Purpose

The showcase demonstrates an end-to-end `gpbiometrics` workflow:

```text
import -> readiness -> workflow summary -> quality checks -> TTL events ->
window summaries -> feature inventory -> report bundle -> reproducible outputs
```

It is intended for package documentation, software-paper development, and reproducible demonstration. It should not be interpreted as evidence about real human physiology, emotion, cognition, stress, health status, or diagnosis.

## Render

From the package root, run:

```r
source("paper-showcase/02_render_kiosk_showcase.R")
```

The rendered HTML and generated outputs are written to:

```text
paper-showcase/output/
```

The output folder is ignored by Git through `paper-showcase/.gitignore`.
