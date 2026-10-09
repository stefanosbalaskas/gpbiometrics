# Run a multiverse of SCR scoring specifications

Scores SCR amplitudes across multiple latency windows, thresholds,
baseline methods, and response metrics. Optionally applies a
user-supplied model function to each specification. This supports
transparent sensitivity analysis and specification-curve style
reporting.

## Usage

``` r
run_gazepoint_scr_multiverse(
  dat,
  signal_col = "GSR_US",
  time_col = "time",
  trial_cols = NULL,
  condition_col = NULL,
  participant_col = NULL,
  event_time_col = NULL,
  latency_windows = list(c(1, 3), c(1, 4), c(1, 5)),
  thresholds = c(0.01, 0.05),
  baseline_methods = c("median", "mean"),
  baseline_window = c(-1, 0),
  response_metrics = c("max_minus_baseline"),
  model_function = NULL
)
```

## Arguments

- dat:

  Sample-level EDA data.

- signal_col:

  Conductance/EDA signal column.

- time_col:

  Time column, preferably relative to stimulus onset. If
  `event_time_col` is supplied, relative time is computed as
  `time_col - event_time_col`.

- trial_cols:

  Columns identifying trials.

- condition_col:

  Optional experimental condition column.

- participant_col:

  Optional participant column.

- event_time_col:

  Optional event/stimulus onset time column.

- latency_windows:

  List of response windows in seconds.

- thresholds:

  SCR response thresholds.

- baseline_methods:

  Baseline methods: `"median"`, `"mean"`, or `"none"`.

- baseline_window:

  Baseline window in relative seconds.

- response_metrics:

  Response metrics: `"max_minus_baseline"` or `"peak_to_peak"`.

- model_function:

  Optional function applied to each specification-level trial summary.

## Value

A list with specification grid, scored trials, optional model results,
and robustness overview.
