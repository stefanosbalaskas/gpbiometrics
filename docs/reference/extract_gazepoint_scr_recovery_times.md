# Extract SCR recovery times

Extracts 50 percent half-recovery time (`rec.t2`) and 63 percent
recovery time (`rec.tc`) for skin conductance responses from an EDA
waveform and event onsets.

## Usage

``` r
extract_gazepoint_scr_recovery_times(
  dat,
  eda_col = "GSR_US",
  time_col = "CNT",
  event_onset_col = NULL,
  group_cols = NULL,
  pre_onset_baseline_s = 2,
  peak_window_s = 5,
  recovery_window_s = 20
)
```

## Arguments

- dat:

  A data frame.

- eda_col:

  Numeric EDA/conductance column.

- time_col:

  Numeric time column.

- event_onset_col:

  Optional event onset column. Finite values are treated as event
  onsets.

- group_cols:

  Optional grouping columns.

- pre_onset_baseline_s:

  Baseline window before event onset.

- peak_window_s:

  Window after onset used to find the response peak.

- recovery_window_s:

  Window after peak used to find recovery.

## Value

A list with `overview`, `recovery_table`, and `settings`.
