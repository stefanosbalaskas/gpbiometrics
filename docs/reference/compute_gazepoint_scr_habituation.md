# Compute SCR habituation across trials

Estimates habituation of SCR amplitudes across ordered trials, either
for a vector or within subjects/groups in a data frame.

## Usage

``` r
compute_gazepoint_scr_habituation(
  data,
  amplitude_col = NULL,
  trial_col = NULL,
  subject_col = NULL,
  method = c("linear", "log_linear", "ratio"),
  min_trials = 3
)
```

## Arguments

- data:

  Numeric SCR-amplitude vector or data frame.

- amplitude_col:

  SCR amplitude column for data-frame input.

- trial_col:

  Trial/order column for data-frame input.

- subject_col:

  Optional subject/grouping column.

- method:

  `"linear"` for raw amplitudes, `"log_linear"` for log1p amplitudes, or
  `"ratio"` for first/last ratio only.

- min_trials:

  Minimum valid trials required for model-based estimates.

## Value

Data frame with habituation slope, p value, correlation, and first/last
response summaries.
