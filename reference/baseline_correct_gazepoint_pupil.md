# Baseline-correct Gazepoint pupil size

Applies subtractive or divisive baseline correction to pupil-size data
within trials or other grouping units.

## Usage

``` r
baseline_correct_gazepoint_pupil(
  dat,
  pupil_col = NULL,
  time_col = "CNT",
  stimulus_onset_col = NULL,
  trial_cols = NULL,
  baseline_window = c(-240, -200),
  baseline_function = c("median", "mean"),
  correction = c("subtract", "divide"),
  suffix = "_baseline_corrected",
  min_baseline_rows = 2,
  overwrite = FALSE
)
```

## Arguments

- dat:

  A data frame containing pupil-size data.

- pupil_col:

  Pupil column. If `NULL`, common Gazepoint pupil columns are detected.

- time_col:

  Time column.

- stimulus_onset_col:

  Optional stimulus-onset column. If supplied, baseline windows are
  interpreted relative to onset.

- trial_cols:

  Trial/grouping columns.

- baseline_window:

  Numeric vector of length two defining the baseline window relative to
  stimulus onset.

- baseline_function:

  `"median"` or `"mean"`.

- correction:

  `"subtract"` or `"divide"`.

- suffix:

  Suffix for corrected output column.

- min_baseline_rows:

  Minimum finite baseline rows required.

- overwrite:

  Logical. If `FALSE`, existing output columns are protected.

## Value

A data frame with a corrected pupil column and baseline attributes.
