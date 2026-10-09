# Extract heart-rate fragmentation features

Computes dependency-light heart-rate fragmentation descriptors from
IBI/RR intervals. Metrics include percentage of inflection points (PIP),
inverse average segment length (IALS), percentage of short segments
(PSS), percentage of alternation segments (PAS), and long/short segment
summaries.

## Usage

``` r
extract_gazepoint_hrv_fragmentation(
  dat,
  ibi_col = "IBI",
  group_cols = NULL,
  zero_tolerance = 0,
  short_segment_length = 3
)
```

## Arguments

- dat:

  A data frame containing IBI/RR intervals.

- ibi_col:

  Numeric IBI/RR interval column.

- group_cols:

  Optional grouping columns.

- zero_tolerance:

  Absolute change below which interval differences are treated as zero.

- short_segment_length:

  Maximum segment length counted as short.

## Value

A list with `overview`, `features`, and `settings`.

## Details

These are fragmentation descriptors of interbeat interval dynamics. They
should not be interpreted as clinical diagnoses or direct
autonomic-state labels by themselves.
