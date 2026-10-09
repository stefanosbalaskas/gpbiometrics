# Compute PPG beat-template similarity

Extracts peak-centered PPG windows, builds a median beat template, and
computes per-beat correlation with the template as an interpretable
quality metric.

## Usage

``` r
compute_gazepoint_ppg_template_similarity(
  data,
  time_col = NULL,
  ppg_col = NULL,
  peaks = NULL,
  window_s = c(-0.25, 0.45),
  sampling_rate_hz = NULL,
  n_grid = 101,
  similarity_threshold = 0.8
)
```

## Arguments

- data:

  PPG data frame or numeric PPG vector.

- time_col:

  Time column for data-frame input.

- ppg_col:

  PPG/BVP signal column for data-frame input.

- peaks:

  Optional peak indices or peak times.

- window_s:

  Two-element window around each peak in seconds.

- sampling_rate_hz:

  Sampling rate for vector input or when time is absent.

- n_grid:

  Number of points in the normalized beat template.

- similarity_threshold:

  Correlation threshold for `quality_ok`.

## Value

List with `beats`, `template`, `summary`, and `settings`.
