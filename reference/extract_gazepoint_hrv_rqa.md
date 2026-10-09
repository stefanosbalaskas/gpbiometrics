# Extract HRV recurrence quantification analysis features

Computes dependency-light recurrence quantification analysis (RQA)
features from IBI/RR intervals. This is intended as a compact nonlinear
HRV summary and not as a clinical diagnostic tool.

## Usage

``` r
extract_gazepoint_hrv_rqa(
  dat,
  ibi_col = "IBI",
  group_cols = NULL,
  embedding_dimension = 2,
  delay = 1,
  radius = NULL,
  radius_multiplier = 0.2,
  min_line_length = 2
)
```

## Arguments

- dat:

  A data frame.

- ibi_col:

  Numeric IBI/RR interval column.

- group_cols:

  Optional grouping columns.

- embedding_dimension:

  Embedding dimension for phase-space reconstruction.

- delay:

  Delay used in embedding.

- radius:

  Radius for recurrence threshold. If `NULL`, uses
  `radius_multiplier * SD`.

- radius_multiplier:

  Multiplier used when `radius = NULL`.

- min_line_length:

  Minimum diagonal/vertical line length.

## Value

A list with `overview`, `features`, and `settings`.
