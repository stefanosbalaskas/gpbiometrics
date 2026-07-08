# Create a static Gazepoint pipeline comparison dashboard

Aggregates participant-, session-, or row-level Gazepoint QC outputs
into a compact static dashboard object. The function is intentionally
conservative: it summarizes existing QC indicators, missingness rates,
signal-quality scores, rule failures, exclusion flags, and audit notes
without fitting models, making clinical claims, or launching an
interactive dashboard.

## Usage

``` r
pipeline_comparison_dashboard(
  data,
  participant_col = NULL,
  session_col = NULL,
  grouping_cols = NULL,
  missingness_col = NULL,
  quality_col = NULL,
  qc_status_col = NULL,
  failed_rules_col = NULL,
  excluded_col = NULL,
  notes_col = NULL
)
```

## Arguments

- data:

  A data frame containing QC, quality, missingness, exclusion, or
  audit-summary columns.

- participant_col:

  Optional participant identifier column. If `NULL`, a common
  participant column is detected when available.

- session_col:

  Optional session identifier column. If `NULL`, a common session column
  is detected when available.

- grouping_cols:

  Optional character vector of grouping columns. If supplied, this
  overrides `participant_col` and `session_col`.

- missingness_col:

  Optional numeric missingness-rate column.

- quality_col:

  Optional numeric quality-score or SQI column.

- qc_status_col:

  Optional QC status column.

- failed_rules_col:

  Optional column containing failed rule labels.

- excluded_col:

  Optional logical, numeric, or character exclusion flag column.

- notes_col:

  Optional audit-note column.

## Value

A list with class `gazepoint_pipeline_comparison_dashboard` containing
an overall summary, grouped dashboard table, issue table, and detected
column mapping.
