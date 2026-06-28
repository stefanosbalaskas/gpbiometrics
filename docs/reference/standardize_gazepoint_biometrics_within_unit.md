# Standardize biometric signals within participant or other analysis units

Adds within-unit standardized biometric columns, usually within
participant or participant-by-session/stimulus groups. This is useful
when the analysis focuses on relative within-person signal change rather
than absolute between-person level differences.

## Usage

``` r
standardize_gazepoint_biometrics_within_unit(
  data,
  signal_cols = NULL,
  unit_cols = NULL,
  reference_col = NULL,
  reference_value = TRUE,
  suffix = "_z_within",
  center = TRUE,
  scale = TRUE,
  min_valid = 2,
  zero_sd_action = c("NA", "zero"),
  overwrite = FALSE
)

standardise_gazepoint_biometrics_within_unit(
  data,
  signal_cols = NULL,
  unit_cols = NULL,
  reference_col = NULL,
  reference_value = TRUE,
  suffix = "_z_within",
  center = TRUE,
  scale = TRUE,
  min_valid = 2,
  zero_sd_action = c("NA", "zero"),
  overwrite = FALSE
)
```

## Arguments

- data:

  A data frame containing Gazepoint biometric data.

- signal_cols:

  Character vector of biometric signal columns to standardize. If
  `NULL`, common numeric biometric columns are detected.

- unit_cols:

  Character vector defining the unit within which means and standard
  deviations are computed. If `NULL`, common participant/session columns
  are detected. If no columns are detected, the whole data frame is
  treated as one unit.

- reference_col:

  Optional logical or categorical column identifying rows used to
  estimate the reference mean and standard deviation. For example, this
  can be a baseline-window flag. The resulting parameters are then
  applied to all rows in the same unit.

- reference_value:

  Value in `reference_col` that marks reference rows. Defaults to
  `TRUE`.

- suffix:

  Suffix for standardized output columns.

- center:

  Logical. If `TRUE`, subtract the within-unit reference mean.

- scale:

  Logical. If `TRUE`, divide by the within-unit reference standard
  deviation.

- min_valid:

  Minimum number of finite reference observations required per unit and
  signal.

- zero_sd_action:

  What to do when the within-unit standard deviation is zero or
  unavailable. `"NA"` returns `NA`; `"zero"` returns zero for finite
  centered values.

- overwrite:

  Logical. If `FALSE`, existing output columns are protected.

## Value

A data frame with added standardized columns. Attributes include
`standardization_summary`, `standardization_parameters`, and `settings`.

## Details

The helper is intentionally conservative. It does not run automatically
in the main workflow and does not infer emotion, valence, stress, trust,
preference, cognition, or diagnosis. Within-unit z-scoring removes
between-unit level and scale differences and should therefore be
reported explicitly.
