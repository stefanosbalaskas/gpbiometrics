# Diagnose synchronization drift between two time bases

Estimates lag and linear drift between matched timestamps or event
markers. A fixed lag has a near-zero drift slope; a changing lag has a
non-zero slope.

## Usage

``` r
diagnose_gazepoint_sync_drift(
  reference,
  target = NULL,
  reference_time_col = NULL,
  target_time_col = NULL,
  max_pairs = NULL
)
```

## Arguments

- reference:

  Reference timestamps or data frame.

- target:

  Target timestamps or data frame.

- reference_time_col:

  Optional reference time column.

- target_time_col:

  Optional target time column.

- max_pairs:

  Optional maximum number of matched pairs.

## Value

List with `summary` and `lag_table`.
