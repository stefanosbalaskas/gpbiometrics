# Write Gazepoint Biometrics report tables

Writes report-ready Gazepoint Biometrics tables to CSV files. The input
can be a workflow object produced by
[`run_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_biometrics_workflow.md),
a report-table object produced by
[`create_gazepoint_biometrics_report_tables()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_report_tables.md),
or a named list of data frames.

## Usage

``` r
write_gazepoint_biometrics_report_tables(
  tables,
  output_dir,
  prefix = "gazepoint_biometrics",
  overwrite = TRUE,
  include_empty_message_tables = FALSE
)
```

## Arguments

- tables:

  A Gazepoint Biometrics workflow object, report-table object, or named
  list of data frames.

- output_dir:

  Output directory for CSV files.

- prefix:

  Filename prefix.

- overwrite:

  Should existing files be overwritten?

- include_empty_message_tables:

  Should placeholder tables containing only a `message` column be
  written?

## Value

A data frame indexing written and skipped files.
