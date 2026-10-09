# Analyse AC EDA admittance and susceptance recordings

Computes summaries for specialised alternating-current EDA recordings.
This function is for true AC admittance/susceptance data, not ordinary
DC skin-conductance columns such as `GSR_US`.

## Usage

``` r
analyze_gazepoint_ac_susceptance(
  dat,
  conductance_col = NULL,
  susceptance_col = NULL,
  admittance_col = NULL,
  phase_col = NULL,
  frequency_col = NULL,
  time_col = NULL,
  group_cols = NULL
)
```

## Arguments

- dat:

  A data frame.

- conductance_col:

  Optional real conductance component column.

- susceptance_col:

  Optional imaginary susceptance component column.

- admittance_col:

  Optional admittance magnitude column.

- phase_col:

  Optional phase angle column.

- frequency_col:

  Optional AC frequency column.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

## Value

A list with `overview`, `timeseries`, `summary`, and `settings`.
