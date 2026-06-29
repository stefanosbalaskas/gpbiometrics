# Summarize missingness and gap structure in Gazepoint data

Computes missingness rates, missing-run counts, longest missing run,
longest missing duration, and optional long-gap counts for one or more
columns. This is intended as a reviewer-friendly audit helper before
interpolation, exclusion, or event-locked analysis.

## Usage

``` r
summarize_gazepoint_missingness(
  data,
  signal_cols = NULL,
  time_col = NULL,
  group_cols = NULL,
  long_gap_s = NULL,
  count_nonfinite = TRUE
)
```

## Arguments

- data:

  Data frame containing signal columns.

- signal_cols:

  Optional character vector of columns to audit. If omitted, all columns
  except `time_col` and `group_cols` are audited.

- time_col:

  Optional time column. If supplied or detected, missing-run durations
  are reported in seconds.

- group_cols:

  Optional grouping columns such as participant, session, or trial.

- long_gap_s:

  Optional threshold in seconds used to count long missing gaps.

- count_nonfinite:

  If TRUE, non-finite numeric values are counted as missing.

## Value

Data frame with one row per group and signal column.
