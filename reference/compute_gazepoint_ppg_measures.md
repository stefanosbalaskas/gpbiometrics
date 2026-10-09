# Compute HeartPy-style pulse/PPG measures

Compute HeartPy-style pulse/PPG measures

## Usage

``` r
compute_gazepoint_ppg_measures(peaks, group_col = "group")
```

## Arguments

- peaks:

  Peak table from detect_gazepoint_ppg_peaks() or
  reject_gazepoint_ppg_peaks().

- group_col:

  Group column.

## Value

Data frame with BPM, IBI, SDNN, SDSD, RMSSD, pNN20, pNN50, MAD, LF, HF,
HF/LF, and breathing rate.
