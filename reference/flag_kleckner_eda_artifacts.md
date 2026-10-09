# Flag EDA artifacts using transparent Kleckner-style heuristics

Applies simple transparent EDA artifact flags: non-finite values,
physiological range violations, rapid percent change per second, and
transitional padding around flagged samples.

## Usage

``` r
flag_kleckner_eda_artifacts(
  dat,
  eda_col = "GSR_US",
  time_col = NULL,
  group_cols = NULL,
  min_us = 0.01,
  max_us = 100,
  max_abs_percent_change_per_second = 20,
  transition_padding = 1,
  output_prefix = "kleckner"
)
```

## Arguments

- dat:

  A data frame containing EDA data.

- eda_col:

  Conductance column in microsiemens.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- min_us:

  Minimum plausible conductance.

- max_us:

  Maximum plausible conductance.

- max_abs_percent_change_per_second:

  Maximum absolute percent change per second before flagging.

- transition_padding:

  Number of neighbouring rows to flag around bad samples within each
  group.

- output_prefix:

  Prefix for output columns.

## Value

A data frame with artifact flag columns and summary attributes.

## Details

This helper is Kleckner-style rather than a claim of exact reproduction
of every rule in a specific external implementation.
