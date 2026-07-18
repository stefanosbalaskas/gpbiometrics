# Prepare Gazepoint signals for Python BioSPPy

Converts Gazepoint EDA/GSR or PPG/BVP waveform data into grouped numeric
vectors suitable for transfer to Python BioSPPy. The function validates
the timebase, records missing-data handling, and can write headerless
one-column CSV files.

## Usage

``` r
prepare_gazepoint_biosppy_input(
  data,
  signal_type = c("auto", "eda", "ppg"),
  signal_col = NULL,
  time_col = NULL,
  group_cols = NULL,
  sampling_rate_hz = NULL,
  missing = c("error", "interpolate", "segments"),
  irregular = c("error", "allow"),
  sampling_tolerance = 0.05,
  min_segment_samples = 3L,
  signal_units = NULL,
  output_dir = NULL,
  prefix = "gazepoint_biosppy",
  write_manifest = TRUE,
  overwrite = FALSE
)
```

## Arguments

- data:

  A numeric signal vector or a data frame containing EDA/GSR or PPG/BVP
  samples.

- signal_type:

  Signal type: `"auto"`, `"eda"`, or `"ppg"`. Numeric-vector input
  requires an explicit signal type.

- signal_col:

  Signal column when `data` is a data frame. If `NULL`, common Gazepoint
  and biosignal column names are searched.

- time_col:

  Optional numeric time column expressed in seconds. If absent,
  `sampling_rate_hz` must be supplied and a time vector is generated.

- group_cols:

  Optional participant, session, trial, file, or other grouping columns.

- sampling_rate_hz:

  Optional positive sampling frequency in hertz. When omitted, it is
  inferred separately for each group from `time_col`.

- missing:

  Missing-signal handling: `"error"`, `"interpolate"`, or `"segments"`.

- irregular:

  Handling of irregular sampling intervals: `"error"` or `"allow"`.

- sampling_tolerance:

  Maximum relative deviation from the expected sample interval before an
  interval is marked irregular.

- min_segment_samples:

  Minimum number of samples retained when `missing = "segments"`.

- signal_units:

  Optional descriptive signal unit, such as `"microsiemens"` or
  `"arbitrary"`.

- output_dir:

  Optional directory for one-column CSV files and a manifest.

- prefix:

  Filename prefix used for exported files.

- write_manifest:

  Logical. Write a manifest when `output_dir` is supplied.

- overwrite:

  Logical. Permit replacement of existing output files.

## Value

An object of class `"gazepoint_biosppy_input"` containing:

- `samples`: row-level audit table;

- `vectors`: named Python-ready numeric signal vectors;

- `sampling_rates_hz`: sampling frequency for each vector;

- `manifest`: vector-level preparation summary;

- `files`: paths written to disk;

- `settings`: preparation settings and Python call templates.

## Details

The function prepares data only. It does not invoke Python or BioSPPy
and does not perform physiological interpretation.

BioSPPy signal functions assume a regularly sampled one-dimensional
signal and a sampling frequency in hertz. When a time column is
supplied, each group must be strictly increasing. Sampling irregularity
is assessed against the supplied or inferred sampling rate.

With `missing = "interpolate"`, non-finite signal values are replaced by
linear interpolation within each group. Edge values use the nearest
finite value. At least two finite samples are required.

With `missing = "segments"`, each contiguous finite run is exported as a
separate vector. Runs shorter than `min_segment_samples` are retained in
the audit table but excluded from the prepared vectors.

Exported signal files contain one numeric value per line without a
header, quotation marks, or row names.

## See also

[`run_gazepoint_biosppy_eda()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_biosppy_eda.md),
[`run_gazepoint_biosppy_ppg()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_biosppy_ppg.md)

## Examples

``` r
eda <- data.frame(
  participant = rep("P01", 4),
  time_s = c(0, 0.1, 0.2, 0.3),
  EDA = c(1.0, 1.1, 1.05, 1.2)
)

prepared <- prepare_gazepoint_biosppy_input(
  eda,
  signal_type = "eda",
  group_cols = "participant"
)

prepared$vectors$P01
#> [1] 1.00 1.10 1.05 1.20
prepared$sampling_rates_hz
#> P01
#>  10
```
