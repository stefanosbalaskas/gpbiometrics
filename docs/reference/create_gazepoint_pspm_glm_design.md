# Create PsPM-style convolution GLM design matrix

Create PsPM-style convolution GLM design matrix

## Usage

``` r
create_gazepoint_pspm_glm_design(
  events,
  time,
  time_col = NULL,
  onset_col = "onset_time_s",
  condition_col = "condition",
  duration_col = NULL,
  response = c("scr", "canonical", "boxcar"),
  response_length_s = 20,
  include_derivative = FALSE,
  add_intercept = TRUE
)
```

## Arguments

- events:

  Event table.

- time:

  Numeric time vector or data frame containing time_col.

- time_col:

  Time column if time is a data frame.

- onset_col:

  Event onset column.

- condition_col:

  Event condition column.

- duration_col:

  Optional duration column.

- response:

  Response kernel: scr, canonical, or boxcar.

- response_length_s:

  Kernel length in seconds.

- include_derivative:

  If TRUE, include temporal derivative regressors.

- add_intercept:

  If TRUE, add intercept column.

## Value

Design matrix as data frame.
