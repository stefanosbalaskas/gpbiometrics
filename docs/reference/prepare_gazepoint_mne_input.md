# Prepare Gazepoint channels for an MNE RawArray

Produces a channel-by-sample matrix and metadata specifications suitable
for `mne.create_info()` and `mne.io.RawArray()`. No Python execution is
required.

## Usage

``` r
prepare_gazepoint_mne_input(
  data,
  channel_cols = NULL,
  channel_names = NULL,
  channel_types = NULL,
  time_col = NULL,
  time_unit = c("auto", "seconds", "milliseconds", "samples"),
  sampling_rate_hz = NULL,
  first_samp = 0L,
  scale_factors = NULL,
  missing = c("error", "allow"),
  irregular = c("error", "allow"),
  sampling_tolerance = 0.05
)
```

## Arguments

- data:

  One continuous sample-level data frame.

- channel_cols:

  Numeric signal columns. If omitted, common Gazepoint gaze, pupil,
  physiology, marker, and temperature columns are detected.

- channel_names:

  Optional MNE channel names.

- channel_types:

  Optional MNE channel types, either parallel to `channel_cols` or named
  by source column.

- time_col:

  Numeric time column.

- time_unit:

  Time unit.

- sampling_rate_hz:

  Optional sampling frequency. If omitted it is inferred from the median
  interval.

- first_samp:

  Integer MNE first-sample offset.

- scale_factors:

  Optional explicit numeric factors applied to channels.

- missing:

  Handling of non-finite signal values.

- irregular:

  Handling of irregular sampling.

- sampling_tolerance:

  Maximum relative interval deviation.

## Value

A `"gazepoint_mne_input"` object.
