# Import a generic Gazepoint-compatible event log

Reads a CSV/TSV event log and standardizes event identifiers,
timestamps, and labels for alignment with Gazepoint biometric or
eye-tracking data.

## Usage

``` r
import_gazepoint_event_log(
  path,
  time_col = NULL,
  event_col = NULL,
  id_col = NULL,
  sep = NULL,
  ...
)
```

## Arguments

- path:

  Path to a CSV/TSV file, or an existing data frame.

- time_col:

  Event time column.

- event_col:

  Event label column.

- id_col:

  Optional event identifier column.

- sep:

  Optional delimiter. If NULL, it is guessed from the first line.

- ...:

  Additional arguments passed to
  [`utils::read.table()`](https://rdrr.io/r/utils/read.table.html).

## Value

Data frame with `event_id`, `event_time`, and `event_label`.
