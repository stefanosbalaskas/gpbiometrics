# Denoise PPG using a user-supplied autoencoder reconstruction model

Applies a user-supplied reconstruction function or model to fixed-length
PPG windows. No pretrained neural network is bundled. This function is
an interoperability bridge for validated user-supplied autoencoders.

## Usage

``` r
denoise_gazepoint_ppg_autoencoder(
  dat,
  ppg_col = "HRP",
  time_col = NULL,
  group_cols = NULL,
  model = NULL,
  window_samples = 128,
  output_col = NULL,
  overwrite = FALSE
)
```

## Arguments

- dat:

  A data frame.

- ppg_col:

  Numeric PPG/pulse column.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- model:

  A user-supplied function or model. If `NULL`, the original signal is
  copied and status records that no model was supplied.

- window_samples:

  Window length in samples.

- output_col:

  Optional output column.

- overwrite:

  Logical. If `FALSE`, existing output column is protected.

## Value

A data frame with reconstructed signal and denoising attributes.
