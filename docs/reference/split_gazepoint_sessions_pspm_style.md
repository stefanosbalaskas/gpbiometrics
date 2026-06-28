# Split Gazepoint recordings into PsPM-style sessions

Split Gazepoint recordings into PsPM-style sessions

## Usage

``` r
split_gazepoint_sessions_pspm_style(
  data,
  time_col = NULL,
  gap_seconds = NULL,
  session_col = "pspm_session",
  reset_time = TRUE
)
```

## Arguments

- data:

  Gazepoint data frame.

- time_col:

  Time column.

- gap_seconds:

  Gap threshold. If NULL, inferred from sampling interval.

- session_col:

  Output session column.

- reset_time:

  If TRUE, add session-relative time.

## Value

List with annotated data, sessions, and split data.
