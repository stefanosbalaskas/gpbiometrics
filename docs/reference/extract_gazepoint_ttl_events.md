# Extract Gazepoint TTL marker events

Extracts TTL marker events from Gazepoint Biometrics exports. The
function can return either rows where TTL marker values change or all
nonzero TTL rows. By default, rows are retained only when the TTL
validity column is present and greater than zero. This avoids treating
invalid placeholder TTL values as experimental events.

## Usage

``` r
extract_gazepoint_ttl_events(
  data,
  ttl_columns = NULL,
  group_columns = NULL,
  validity_column = "TTLV",
  require_validity = TRUE,
  mode = c("changes", "nonzero"),
  include_initial = TRUE
)
```

## Arguments

- data:

  A data frame or a path to a Gazepoint CSV export.

- ttl_columns:

  TTL marker columns. If `NULL`, the function uses all available columns
  from `TTL0` to `TTL6`.

- group_columns:

  Optional grouping columns within which TTL changes are detected, such
  as `source_participant`, `USER`, or `MEDIA_ID`.

- validity_column:

  Optional TTL validity column. Defaults to `"TTLV"`.

- require_validity:

  Logical. Should rows be retained only when `validity_column` is
  present and greater than zero? Defaults to `TRUE`.

- mode:

  Event extraction mode. `"changes"` returns rows where TTL values
  change. `"nonzero"` returns all rows with nonzero TTL values.

- include_initial:

  Should the first valid, non-missing TTL value within each group be
  treated as an event when `mode = "changes"`?

## Value

A data frame of TTL events.
