# Create a compact Gazepoint quality dashboard object

Combines audit, missingness, synchronization, and event-locked summary
objects into a reviewer-friendly quality dashboard. If `output_dir` is
supplied, core dashboard tables are exported as CSV/text files.

## Usage

``` r
create_gazepoint_quality_dashboard(
  data = NULL,
  audit = NULL,
  missingness = NULL,
  alignment = NULL,
  eventlocked = NULL,
  title = "Gazepoint quality dashboard",
  output_dir = NULL
)
```

## Arguments

- data:

  Optional data frame used to compute audit and missingness when
  explicit objects are not supplied.

- audit:

  Optional object from
  [`audit_gazepoint_biometrics_file()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_biometrics_file.md).

- missingness:

  Optional object from
  [`summarize_gazepoint_missingness()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarize_gazepoint_missingness.md).

- alignment:

  Optional object from
  [`align_gazepoint_streams_by_events()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/align_gazepoint_streams_by_events.md).

- eventlocked:

  Optional object from
  [`summarize_gazepoint_eventlocked_multimodal()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarize_gazepoint_eventlocked_multimodal.md).

- title:

  Dashboard title.

- output_dir:

  Optional directory where dashboard tables are written.

## Value

Object of class `gazepoint_quality_dashboard`.
