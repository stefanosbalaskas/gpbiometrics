# Align Gazepoint biometric samples to TTL events

Aligns biometric rows to TTL/event markers and returns event-relative
time and sample indices. The helper is conservative: TTL events are
detected from rising edges by default, validity flags are used when
available, and no physiological interpretation is added.

## Usage

``` r
align_gazepoint_biometrics_to_ttl(
  data,
  ttl_cols = NULL,
  event_col = NULL,
  ttl_valid_col = NULL,
  time_col = NULL,
  sample_col = NULL,
  group_cols = NULL,
  participant_col = NULL,
  stimulus_col = NULL,
  trial_col = NULL,
  event_value = NULL,
  valid_values = c(TRUE, 1, "1"),
  event_edge = c("rising", "change", "active"),
  pre_window_ms = 1000,
  post_window_ms = 5000,
  pre_window_samples = NULL,
  post_window_samples = NULL,
  collapse_nearby_ms = 0,
  require_valid_ttl = TRUE
)
```

## Arguments

- data:

  A data frame containing biometric samples.

- ttl_cols:

  Optional TTL marker columns. If `NULL`, the function first looks for
  `ttl_marker`, then raw `TTL0`-`TTL6` columns.

- event_col:

  Optional single user-specified event column. If supplied, it is used
  instead of automatic TTL-column detection.

- ttl_valid_col:

  Optional TTL validity column. If `NULL`, the function looks for
  `ttl_validity_flag` or `TTLV`.

- time_col:

  Optional time column. If `NULL`, common time-column names are detected
  automatically when present.

- sample_col:

  Optional sample/counter column. If `NULL`, `CNT`/`cnt` is used when
  present; otherwise row order is used.

- group_cols:

  Optional grouping columns. If `NULL`, the function uses available
  participant/stimulus/trial-like columns when present.

- participant_col, stimulus_col, trial_col:

  Optional explicit grouping columns to add to `group_cols`.

- event_value:

  Optional value(s) that define an active event. If `NULL`, non-zero
  numeric/logical values and non-empty character values are treated as
  active.

- valid_values:

  Values treated as valid in the TTL validity column.

- event_edge:

  Event-detection rule. `"rising"` keeps inactive-to-active transitions,
  `"change"` keeps changes among active event values, and `"active"`
  keeps every active sample.

- pre_window_ms, post_window_ms:

  Event window in milliseconds when a usable time column is available.

- pre_window_samples, post_window_samples:

  Event window in samples when no usable time column is available. If
  omitted, only the event sample is kept.

- collapse_nearby_ms:

  Optional minimum distance between retained events within a group, in
  milliseconds.

- require_valid_ttl:

  If `TRUE`, a detected TTL validity column must be active for a row to
  count as an event.

## Value

A list with `overview`, `events`, `aligned_data`, and `settings`.
