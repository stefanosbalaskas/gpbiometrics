# Create a simple Gazepoint data dictionary

Creates a column-level dictionary from a data frame or from CSV file
headers. The output is intended for reporting and reproducibility
documentation.

## Usage

``` r
create_gazepoint_dictionary(
  data = NULL,
  file_paths = NULL,
  units = NULL,
  descriptions = NULL,
  required_cols = NULL,
  write_path = NULL
)
```

## Arguments

- data:

  Optional data frame.

- file_paths:

  Optional character vector of CSV files to inspect when `data` is
  `NULL`.

- units:

  Optional named character vector or named list mapping columns to
  units.

- descriptions:

  Optional named character vector or named list mapping columns to
  descriptions.

- required_cols:

  Optional character vector of columns expected in the data.

- write_path:

  Optional output path. Use `.csv` for CSV; otherwise a simple Markdown
  table is written.

## Value

A data frame with class `gazepoint_dictionary`.
