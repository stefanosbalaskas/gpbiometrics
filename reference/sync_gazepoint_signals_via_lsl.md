# Synchronize imported Gazepoint LSL/XDF streams

Applies explicit clock offsets and known latency corrections to already
imported LSL/XDF streams. Input may be named data frames or pyxdf-style
stream lists containing `time_stamps` and `time_series`.

## Usage

``` r
sync_gazepoint_signals_via_lsl(
  streams,
  reference = NULL,
  time_cols = NULL,
  clock_offsets_s = NULL,
  known_lags_s = NULL,
  relative_zero = c("reference", "global", "none"),
  dejitter = c("none", "linear"),
  nominal_rates_hz = NULL,
  merge = c("none", "nearest"),
  tolerance_s = NULL
)
```

## Arguments

- streams:

  Named list of imported streams.

- reference:

  Name of the reference stream.

- time_cols:

  Optional named time-column vector or list.

- clock_offsets_s:

  Values added to stream timestamps to place them in the reference clock
  domain.

- known_lags_s:

  Known acquisition latencies subtracted from timestamps.

- relative_zero:

  Origin for relative synchronized time.

- dejitter:

  Optional transparent linear timestamp regularization.

- nominal_rates_hz:

  Optional named nominal sampling frequencies.

- merge:

  Whether to return separate streams or a nearest-neighbour merged table
  on the reference stream.

- tolerance_s:

  Optional nearest-neighbour tolerance.

## Value

A `"gazepoint_lsl_sync"` object.

## See also

[`import_gazepoint_lsl_xdf()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/import_gazepoint_lsl_xdf.md)
