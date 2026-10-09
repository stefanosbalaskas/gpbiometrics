# Prepare Gazepoint intervals for Python pyHRV

Converts Gazepoint inter-beat or RR intervals into millisecond
NN-interval vectors suitable for transfer to Python pyHRV workflows. The
function does not invoke Python or pyHRV.

## Usage

``` r
prepare_gazepoint_pyhrv_input(
  data,
  ibi_col = NULL,
  group_cols = NULL,
  unit = c("auto", "milliseconds", "seconds"),
  filter = c("none", "plausible"),
  min_nni_ms = 300,
  max_nni_ms = 2000,
  collapse_repeated_intervals = FALSE,
  repeated_tolerance_ms = 1e-08,
  output_dir = NULL,
  prefix = "gazepoint_pyhrv",
  write_manifest = TRUE,
  overwrite = FALSE
)
```

## Arguments

- data:

  A numeric interval vector or a data frame containing an IBI, RR, or
  NN-interval column.

- ibi_col:

  Interval column when `data` is a data frame. If `NULL`, common
  Gazepoint, RR, and NNI column names are searched.

- group_cols:

  Optional participant, session, trial, or file columns. One pyHRV-ready
  vector is produced per group.

- unit:

  Input interval unit: `"auto"`, `"milliseconds"`, or `"seconds"`.

- filter:

  Which intervals should be included in the pyHRV vectors: `"none"`
  retains all finite positive intervals, whereas `"plausible"` also
  applies `min_nni_ms` and `max_nni_ms`.

- min_nni_ms:

  Minimum plausible NN interval in milliseconds.

- max_nni_ms:

  Maximum plausible NN interval in milliseconds.

- collapse_repeated_intervals:

  Logical. If `TRUE`, consecutive interval values equal within
  `repeated_tolerance_ms` are represented once. This can be useful for
  sample-level Gazepoint exports in which the current IBI is repeated
  across multiple rows.

- repeated_tolerance_ms:

  Non-negative tolerance used to identify consecutive repeated
  intervals.

- output_dir:

  Optional directory in which one-column CSV files and a manifest are
  written.

- prefix:

  Filename prefix used when `output_dir` is supplied.

- write_manifest:

  Logical. If `TRUE` and `output_dir` is supplied, write a group-level
  manifest CSV.

- overwrite:

  Logical. If `FALSE`, existing output files are protected.

## Value

An object of class `"gazepoint_pyhrv_input"` containing:

- `intervals`: auditable row-level interval table;

- `vectors`: named list of pyHRV-ready numeric millisecond vectors;

- `manifest`: group-level interval and exclusion summary;

- `files`: paths written when `output_dir` is supplied;

- `settings`: complete preparation settings.

## Details

Input rows are retained in an auditable interval table. Missing,
non-positive, implausible, and repeated intervals are flagged explicitly
rather than removed silently.

Automatic unit assessment first examines the interval-column name. Names
containing common millisecond markers are interpreted as milliseconds.
Otherwise, the median positive interval is used: values no greater than
10 are interpreted as seconds, and values at least 100 as milliseconds.
Intermediate values are considered ambiguous and require an explicit
unit.

CSV interval files contain one numeric millisecond value per line,
without row names, quotation marks, or a header. They can therefore be
read into Python as a one-dimensional numeric vector.

Repeated-interval collapsing is optional because physiologically genuine
adjacent intervals may occasionally have identical values. The setting
should be chosen according to the structure of the source export.

## See also

[`run_gazepoint_pyhrv_style()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_pyhrv_style.md),
[`check_gazepoint_pyhrv_interval()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/check_gazepoint_pyhrv_interval.md),
[`prepare_gazepoint_rhrv_input()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_rhrv_input.md)

## Examples

``` r
ibi <- data.frame(
  participant = c("P01", "P01", "P01"),
  IBI_clean_ms = c(800, 810, 790)
)

prepared <- prepare_gazepoint_pyhrv_input(
  ibi,
  group_cols = "participant"
)

prepared$vectors$P01
#> [1] 800 810 790
prepared$manifest
#>   participant group_id input_rows finite_positive_rows plausible_rows
#> 1         P01      P01          3                    3              3
#>   repeated_rows included_intervals excluded_intervals
#> 1             0                  3                  0
#>   excluded_missing_or_nonfinite excluded_non_positive excluded_below_minimum
#> 1                             0                     0                      0
#>   excluded_above_maximum excluded_repeated total_duration_s mean_nni_ms
#> 1                      0                 0              2.4         800
```
