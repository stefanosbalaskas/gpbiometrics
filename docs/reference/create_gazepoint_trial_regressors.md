# Create Gazepoint trial-level regressors for modeling

Prepares a long-format trial table by joining stimulus/event design
information with event-window summaries from numeric Gazepoint channels.
The output is intended for downstream GLM, LMM, or mixed-model
workflows.

## Usage

``` r
create_gazepoint_trial_regressors(
  data,
  design,
  pre = 0,
  post = 5,
  time_col = NULL,
  event_time_col = NULL,
  event_id_col = NULL,
  signal_cols = NULL,
  subject_col = NULL,
  design_subject_col = NULL,
  carry_design_cols = NULL
)
```

## Arguments

- data:

  Data frame containing time-series signals, or a list of data frames.

- design:

  Numeric event timestamps, a design data frame, or a list with an
  `events` data frame.

- pre:

  Seconds before event onset to summarize.

- post:

  Seconds after event onset to summarize.

- time_col:

  Time column in `data`.

- event_time_col:

  Event-time column in `design`.

- event_id_col:

  Trial/event identifier column in `design`.

- signal_cols:

  Numeric signal columns to summarize. If NULL, all numeric columns
  except the time column are used.

- subject_col:

  Optional subject/participant column in `data`.

- design_subject_col:

  Optional subject/participant column in `design`.

- carry_design_cols:

  Design columns to carry into the output. If NULL, all non-time design
  columns are carried.

## Value

A data frame with one row per trial/event and signal summary regressors.

## Examples

``` r
dat <- data.frame(time_s = seq(0, 10, by = 1), GSR = seq(0, 1, length.out = 11))
design <- data.frame(trial = "T1", onset = 5, condition = "A")
create_gazepoint_trial_regressors(dat, design, pre = 1, post = 2)
#>   trial onset condition trial_id event_time pre post n_samples GSR_mean
#> 1    T1     5         A       T1          5   1    2         4     0.55
#>      GSR_sd GSR_min GSR_max GSR_range GSR_missing_prop
#> 1 0.1290994     0.4     0.7       0.3                0
```
