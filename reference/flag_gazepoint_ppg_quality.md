# Flag segment-level PPG quality

Computes windowed PPG quality metrics and flags segments with excessive
missingness, flatness, or robust outliers.

## Usage

``` r
flag_gazepoint_ppg_quality(
  data,
  time_col = NULL,
  ppg_col = NULL,
  window_s = 10,
  step_s = NULL,
  missing_prop_threshold = 0.2,
  flat_sd_threshold = 1e-06,
  outlier_prop_threshold = 0.1
)
```

## Arguments

- data:

  PPG data frame.

- time_col:

  Time column.

- ppg_col:

  PPG/BVP signal column.

- window_s:

  Window duration in seconds.

- step_s:

  Step size in seconds. Defaults to `window_s`.

- missing_prop_threshold:

  Maximum allowed missing proportion.

- flat_sd_threshold:

  Minimum allowed standard deviation.

- outlier_prop_threshold:

  Maximum allowed robust outlier proportion.

## Value

Data frame with one row per segment.
