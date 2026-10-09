# gpbiometrics roadmap coverage audit

This note records the post-0.3.0 coverage check against the external
roadmap scan.

## Summary

- Roadmap areas checked: 21
- Implemented or superseded: 19
- Not exported / intentionally deferred: 2

## Implemented or superseded

- Pupil blink detection
- Pupil smoothing
- Pupil interpolation
- Upsampling
- Nonwear and dropout detection
- Signal filtering
- Signal quality indices
- Rule-based quality flags
- Beat correction
- Missingness reporting
- Metadata validation
- Artifact simulation
- Data dictionary generation
- Analysis manifest generation
- Anonymization
- Preregistration helpers
- Pipeline visualization
- Audit-trail helpers
- Release-readiness helpers

## Deferred or intentionally not exported

- [`check_gazepoint_bids()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/check_gazepoint_bids.md):
  deferred. A full BIDS-style dataset checker is low priority and may
  overextend the package beyond Gazepoint-native QC and audit workflows.
- [`pipeline_comparison_dashboard()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/pipeline_comparison_dashboard.md):
  deferred. Full dashboard generation is exploratory and may introduce
  heavier reporting dependencies. Current static reports, pkgdown
  reference pages, quality summaries, and audit helpers provide the
  conservative alternative.

## Interpretation

The 0.3.0 release substantially completed the roadmap-safe QC,
preprocessing, auditability, reproducibility, and synthetic-testing
directions while avoiding heavy ML, full GUI dashboards, clinical
interpretation, emotion/stress inference, or unsupported biometric
claims.

## Next development direction

Future work should focus on refinement, examples, documentation, and
validation rather than broad new feature expansion. Candidate future
work includes compact examples for quality-index workflows,
manuscript-ready reporting examples, and optional documentation-only
notes for deferred BIDS/dashboard ideas.
