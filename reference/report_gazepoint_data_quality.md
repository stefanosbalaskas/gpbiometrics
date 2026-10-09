# Report Gazepoint data quality

Generates dependency-free data-quality report files for Gazepoint data.
The report summarizes missingness, numeric distributions, robust outlier
counts, and simple QC plots. HTML and PDF outputs are created using base
R only.

## Usage

``` r
report_gazepoint_data_quality(
  data,
  output_dir = tempfile("gazepoint_quality_report_"),
  report_name = "gazepoint_data_quality",
  formats = c("html", "csv"),
  max_plot_columns = 6,
  open = FALSE
)
```

## Arguments

- data:

  Data frame or list of data frames.

- output_dir:

  Output directory.

- report_name:

  File prefix for report outputs.

- formats:

  Character vector containing `"html"`, `"pdf"`, and/or `"csv"`.

- max_plot_columns:

  Maximum number of numeric columns plotted per table.

- open:

  If TRUE, open the HTML report interactively.

## Value

Invisibly returns a list with output paths and summary tables.

## Examples

``` r
if (FALSE) { # \dontrun{
report_gazepoint_data_quality(data.frame(time_s = 1:5, GSR = rnorm(5)))
} # }
```
