# Detect Gazepoint SCR peaks

Detects candidate skin conductance responses (SCRs) from Gazepoint
EDA/GSR signals. The helper prefers a phasic channel such as
`GSR_US_PHASIC` when available, and otherwise falls back to a
conductance-like signal such as `GSR_US`. It returns explicit onset,
peak, amplitude, rise-time, and recovery-time fields for downstream
event-window summaries and statistical modelling.

## Usage

``` r
detect_gazepoint_scr_peaks(
  data,
  signal_col = NULL,
  phasic_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  prefer_vendor_phasic = TRUE,
  amplitude_min = 0.01,
  recovery_fraction = 0.5,
  smooth_width = 1,
  min_peak_distance = 1
)
```

## Arguments

- data:

  A data frame containing Gazepoint biometric rows.

- signal_col:

  Optional conductance-like signal column, typically `GSR_US`. Used when
  `phasic_col` is absent or unavailable.

- phasic_col:

  Optional phasic EDA signal column, typically `GSR_US_PHASIC`.

- time_col:

  Optional time/counter column. If `NULL`, common Gazepoint time columns
  are detected automatically.

- group_cols:

  Optional grouping columns. If `NULL`, available
  source/participant/media/trial-like columns are used.

- prefer_vendor_phasic:

  Logical. If `TRUE`, prefer `GSR_US_PHASIC` when available.

- amplitude_min:

  Minimum trough-to-peak amplitude required for a detected SCR.

- recovery_fraction:

  Fraction of the peak amplitude used to define recovery. The default
  `.5` estimates half-recovery.

- smooth_width:

  Optional odd integer moving-average width. Use `1` for no smoothing.

- min_peak_distance:

  Minimum distance, in rows, allowed between retained candidate peaks
  within each group. The default `1` preserves all local maxima. Larger
  values reduce repeated detection of closely spaced local maxima within
  a sustained SCR-like response.

## Value

A list with `overview`, `peaks`, `group_summary`, `signal_summary`, and
`settings`.

## Details

This is a conservative R-native peak detector. It is not a replacement
for full model-based EDA decomposition tools such as Ledalab, PsPM, or
cvxEDA.
