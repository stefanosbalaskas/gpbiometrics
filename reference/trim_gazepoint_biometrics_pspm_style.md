# Trim Gazepoint biometrics data PsPM-style

Trim Gazepoint biometrics data PsPM-style

## Usage

``` r
trim_gazepoint_biometrics_pspm_style(
  data,
  start_s = NULL,
  end_s = NULL,
  time_col = NULL,
  reset_time = FALSE
)
```

## Arguments

- data:

  Gazepoint data frame.

- start_s:

  Start time in seconds.

- end_s:

  End time in seconds.

- time_col:

  Time column.

- reset_time:

  If TRUE, reset trimmed time to start at zero.

## Value

Trimmed data frame.
