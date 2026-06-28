# Standardise SCR or SCL using within-participant range correction

Adds a range-corrected signal column using `(x - min) / (max - min)`
within participant or another grouping unit. This expresses each value
as a proportion of the observed within-unit range.

## Usage

``` r
standardise_gazepoint_range_correction(
  dat,
  signal_col,
  group_col = "source_participant",
  suffix = "_Range_Corrected",
  min_valid = 2,
  zero_range_action = c("NA", "zero"),
  overwrite = FALSE
)

standardize_gazepoint_range_correction(
  dat,
  signal_col,
  group_col = "source_participant",
  suffix = "_Range_Corrected",
  min_valid = 2,
  zero_range_action = c("NA", "zero"),
  overwrite = FALSE
)
```

## Arguments

- dat:

  A data frame containing SCR, SCL, or another biometric signal.

- signal_col:

  Signal column to range-correct.

- group_col:

  Participant or unit column.

- suffix:

  Suffix for the output column.

- min_valid:

  Minimum finite observations required within each group.

- zero_range_action:

  What to do when max equals min: `"NA"` or `"zero"`.

- overwrite:

  Logical. If `FALSE`, existing output columns are protected.

## Value

A data frame with an added range-corrected column.
