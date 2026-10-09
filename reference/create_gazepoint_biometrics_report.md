# Create a Gazepoint Biometrics report

Creates a structured, manuscript-oriented report object for Gazepoint
Biometrics data, workflow outputs, quality checks, report tables,
methods text, and reporting checklists. The report is intentionally
conservative: GSR/EDA is described as electrodermal
activity/arousal-related signal rather than emotional valence;
heart-rate interpretation is tied to baseline/task context; eye-tracking
is described as visual attention rather than direct cognition; and raw
`HRV` columns are not treated as HRV metrics.

## Usage

``` r
create_gazepoint_biometrics_report(
  data = NULL,
  workflow = NULL,
  validation = NULL,
  quality = NULL,
  sampling = NULL,
  missingness = NULL,
  exclusions = NULL,
  report_tables = NULL,
  methods_text = NULL,
  checklist = NULL,
  title = "Gazepoint Biometrics report",
  subtitle = NULL,
  output_file = NULL,
  format = c("markdown", "html"),
  include_timestamp = FALSE,
  overwrite = FALSE,
  max_table_rows = 20L
)
```

## Arguments

- data:

  Optional biometric data frame.

- workflow:

  Optional workflow object or workflow summary list.

- validation:

  Optional validation object or data frame.

- quality:

  Optional quality-audit object or data frame.

- sampling:

  Optional sampling-audit object or data frame.

- missingness:

  Optional missingness-audit object or data frame.

- exclusions:

  Optional exclusion-recommendation object or data frame.

- report_tables:

  Optional report-table object, data frame, or named list of data
  frames.

- methods_text:

  Optional methods text, character vector, or object returned by
  [`create_gazepoint_biometrics_methods_text()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/create_gazepoint_biometrics_methods_text.md).

- checklist:

  Optional checklist object or data frame.

- title:

  Report title.

- subtitle:

  Optional report subtitle.

- output_file:

  Optional path to write a report file.

- format:

  Output format when `output_file` is supplied. Supported values are
  `"markdown"` and `"html"`.

- include_timestamp:

  Logical. Should a creation timestamp be included?

- overwrite:

  Logical. Should an existing `output_file` be overwritten?

- max_table_rows:

  Maximum number of rows shown per table in the written report.

## Value

A list of class `"gazepoint_biometrics_report"` with `overview`,
`sections`, `tables`, `objects`, `output_file`, and `settings`.

## Details

The function can also write a lightweight Markdown or HTML file without
adding heavy reporting dependencies.

## Examples

``` r
df <- data.frame(
  CNT = 1:5,
  GSR = c(1, 1.1, 1.2, 1.1, 1),
  HR = c(70, 71, 72, 71, 70),
  DIAL = c(40, 42, 44, 43, 41)
)
report <- create_gazepoint_biometrics_report(df)
names(report)
#> [1] "overview"    "sections"    "tables"      "objects"     "output_file"
#> [6] "settings"   
```
