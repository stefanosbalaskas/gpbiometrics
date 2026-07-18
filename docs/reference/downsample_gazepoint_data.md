# Downsample Gazepoint time-series data

Aggregates selected numeric gaze or biometric signals into fixed-width
time bins. Processing can be performed independently within participant,
trial, session, or other user-defined groups. Only occupied bins are
returned; the function does not fabricate observations for empty
periods.

## Usage

``` r
downsample_gazepoint_data(
  data,
  time_col,
  signal_cols = NULL,
  group_cols = NULL,
  interval,
  method = c("mean", "median", "first", "last"),
  na_rm = TRUE,
  time_value = c("start", "center", "mean"),
  origin = NULL
)
```

## Arguments

- data:

  A data frame containing a numeric time column and one or more numeric
  signal columns.

- time_col:

  Name of the numeric time column.

- signal_cols:

  Optional character vector of numeric columns to aggregate. If `NULL`,
  all numeric columns except `time_col` and `group_cols` are used.

- group_cols:

  Optional character vector of grouping columns. Downsampling is
  performed independently within each group.

- interval:

  Positive width of each output time bin, expressed in the same units as
  `time_col`.

- method:

  Aggregation method applied to each signal within each bin: `"mean"`,
  `"median"`, `"first"`, or `"last"`.

- na_rm:

  Logical. If `TRUE`, missing signal values are removed before
  aggregation. If `FALSE`, a missing value causes mean or median
  aggregation for that signal-bin combination to return `NA`.

- time_value:

  Value assigned to the output time column: the bin `"start"`, bin
  `"center"`, or mean observed sample time (`"mean"`).

- origin:

  Optional finite numeric origin used to align the bin grid. If `NULL`,
  the minimum finite time across the complete input is used.

## Value

A data frame with class `"gazepoint_downsampled_data"`. The output
contains grouping columns, the downsampled time column, aggregated
signals, and `n_source_rows`. Attributes `downsample_log` and
`downsample_settings` provide provenance information.

## Details

The returned object records the number of contributing source rows for
each bin and stores a structured downsampling log and settings as
attributes.

## Examples

``` r
dat <- data.frame(
  participant = rep(c("P01", "P02"), each = 6),
  time_ms = rep(0:5, 2),
  pupil = c(3.0, 3.1, 3.2, 3.3, 3.4, 3.5,
            2.9, 3.0, 3.1, 3.2, 3.3, 3.4)
)

downsample_gazepoint_data(
  dat,
  time_col = "time_ms",
  signal_cols = "pupil",
  group_cols = "participant",
  interval = 3
)
#>   participant time_ms pupil n_source_rows
#> 1         P01       0   3.1             3
#> 2         P01       3   3.4             3
#> 3         P02       0   3.0             3
#> 4         P02       3   3.3             3
```
