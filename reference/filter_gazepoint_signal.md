# Apply lightweight preprocessing to signal columns

Applies conservative base-R preprocessing to selected numeric signal
columns. Supported methods are moving average, rolling median, and
linear detrending. The function returns new columns by default and
records a processing log.

## Usage

``` r
filter_gazepoint_signal(
  data,
  signal_cols,
  method = c("moving_average", "rolling_median", "detrend"),
  group_cols = NULL,
  time_col = NULL,
  window = 5,
  suffix = NULL,
  overwrite = FALSE,
  na_rm = FALSE
)
```

## Arguments

- data:

  A data frame.

- signal_cols:

  Character vector of numeric signal columns.

- method:

  One of `"moving_average"`, `"rolling_median"`, or `"detrend"`.

- group_cols:

  Optional grouping columns.

- time_col:

  Optional numeric time column used for ordering within groups.

- window:

  Window length for moving-average and rolling-median methods.

- suffix:

  Optional suffix for created columns. If `NULL`, a suffix is derived
  from `method`.

- overwrite:

  Logical. If `TRUE`, overwrite input signal columns.

- na_rm:

  Logical. If `TRUE`, ignore missing values inside rolling windows.

## Value

A data frame with class `gazepoint_filtered_signal`.
