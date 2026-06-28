# Standardise SCR or SCL using intra-individual z-scoring

Adds a within-participant z-scored version of a signal column. This is a
lightweight compatibility wrapper around the package's more general
within-unit standardisation helper.

## Usage

``` r
standardise_gazepoint_zscore(
  dat,
  signal_col = "SCR_Amplitude",
  group_col = "source_participant",
  suffix = "_Z",
  min_valid = 2,
  overwrite = FALSE
)

standardize_gazepoint_zscore(
  dat,
  signal_col = "SCR_Amplitude",
  group_col = "source_participant",
  suffix = "_Z",
  min_valid = 2,
  overwrite = FALSE
)
```

## Arguments

- dat:

  A data frame containing SCR, SCL, or another biometric signal.

- signal_col:

  Signal column to standardise.

- group_col:

  Participant or unit column.

- suffix:

  Suffix for the output column.

- min_valid:

  Minimum finite observations required within each group.

- overwrite:

  Logical. If `FALSE`, existing output columns are protected.

## Value

A data frame with an added z-scored column.
