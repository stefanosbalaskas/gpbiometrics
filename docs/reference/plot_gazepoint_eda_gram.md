# Plot an EDA-gram-style time-frequency representation

Creates a dependency-light EDA-gram-style representation using
sliding-window spectral power. This is inspired by EDA-gram
visualisations, but it does not implement a full sparse dictionary
decomposition unless such a model is supplied externally.

## Usage

``` r
plot_gazepoint_eda_gram(
  dat,
  eda_col = "GSR_US",
  time_col = "CNT",
  group_cols = NULL,
  group_id_to_plot = NULL,
  sampling_rate = NULL,
  window_seconds = 30,
  step_seconds = 5,
  frequency_range = c(0.01, 0.5),
  frequency_bins = 64,
  log_power = TRUE,
  plot = TRUE,
  main = "EDA-gram"
)
```

## Arguments

- dat:

  A data frame containing EDA data.

- eda_col:

  Numeric EDA/conductance column.

- time_col:

  Numeric time column.

- group_cols:

  Optional grouping columns.

- group_id_to_plot:

  Optional group ID to plot. If `NULL`, plots the first available group.

- sampling_rate:

  Optional sampling rate in Hz. If `NULL`, estimated from `time_col`.

- window_seconds:

  Sliding-window length.

- step_seconds:

  Sliding-window step.

- frequency_range:

  Frequency range shown in Hz.

- frequency_bins:

  Number of frequency bins.

- log_power:

  Logical. If `TRUE`, plot log1p power.

- plot:

  Logical. If `TRUE`, draw the EDA-gram.

- main:

  Plot title.

## Value

Invisibly returns a list with `overview`, `gram_table`, `plot_matrix`,
and `settings`.
