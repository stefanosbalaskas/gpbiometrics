# Measurement accountability for Gazepoint physiology

This tranche adds four conservative diagnostics.

[`compare_hrv_prv_devices()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/compare_hrv_prv_devices.md)
reports ICC(A,1), Lin CCC and Bland–Altman agreement **per derived
metric**, carrying ECG/PPG and sensor-site provenance rather than
producing a global interchangeability flag.

[`scr_responsivity_sensitivity()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/scr_responsivity_sensitivity.md)
preserves the conventional SCR non-responder flag while estimating a
Beta-Binomial response probability and retaining low-reactive
participants for model-based sensitivity analysis.

[`physiology_validation_ladder()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/physiology_validation_ladder.md)
separates acquisition QC, analytical QC, construct evidence,
within-person evidence and held-out-person generalization.
Population/generalization claims require the final stage to pass.

[`ppg_topology_features()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/ppg_topology_features.md)
is opt-in and experimental. It summarizes H0 persistence lifetimes on a
delay embedding as a **structural waveform descriptor**, never as a
direct physiological surrogate, and carries a participant-grouped
validation guardrail.

Methodological motivation: DOI 10.1186/s12872-026-06556-4, DOI
10.1016/j.biopsycho.2026.109336, DOI 10.3389/fnrgo.2026.1911259, and DOI
10.1016/j.measurement.2026.122168.
