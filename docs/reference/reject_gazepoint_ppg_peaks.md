# Reject implausible pulse/PPG peaks using RR-interval thresholds

Reject implausible pulse/PPG peaks using RR-interval thresholds

## Usage

``` r
reject_gazepoint_ppg_peaks(
  peaks,
  group_col = "group",
  rr_tolerance = 0.3,
  min_rr_ms = 300
)
```

## Arguments

- peaks:

  Peak table returned by detect_gazepoint_ppg_peaks().

- group_col:

  Group column.

- rr_tolerance:

  Proportional RR tolerance around the group mean.

- min_rr_ms:

  Minimum absolute tolerance in milliseconds.

## Value

Peak table with accepted and rr_ms columns.
