# Add small uniform noise to reduce quantization overlap

Adds uniform white noise with magnitude tied to hardware resolution.
This is intended only for nonlinear phase-space methods that are
sensitive to exact repeated values caused by coarse interval
quantization.

## Usage

``` r
denoise_gazepoint_quantization_noise(
  dat,
  signal_cols,
  resolution,
  group_cols = NULL,
  output_suffix = "_quantization_jittered",
  seed = NULL,
  overwrite = FALSE
)
```

## Arguments

- dat:

  A data frame.

- signal_cols:

  Numeric signal columns to jitter.

- resolution:

  Numeric scalar or named numeric vector giving measurement resolution
  for each column.

- group_cols:

  Optional grouping columns, retained in settings.

- output_suffix:

  Suffix for jittered columns.

- seed:

  Optional random seed.

- overwrite:

  Logical. If `FALSE`, existing output columns are protected.

## Value

A data frame with jittered columns and quantization-noise attributes.
