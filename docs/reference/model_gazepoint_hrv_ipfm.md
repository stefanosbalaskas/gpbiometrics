# Model heartbeat timing using an IPFM-style impulse train

Builds an impulse-train representation of heartbeat timing from IBI/RR
intervals or beat times and computes a simple spectrum of the resulting
impulse train. This is an IPFM-style model-preparation helper, not a
perfect reconstruction of sinoatrial-node physiology.

## Usage

``` r
model_gazepoint_hrv_ipfm(
  dat,
  ibi_col = "IBI",
  beat_time_col = NULL,
  group_cols = NULL,
  ibi_units = c("auto", "seconds", "milliseconds"),
  output_sampling_rate = 4,
  max_frequency = 0.5
)
```

## Arguments

- dat:

  A data frame.

- ibi_col:

  Optional numeric IBI/RR interval column.

- beat_time_col:

  Optional explicit beat-time column.

- group_cols:

  Optional grouping columns.

- ibi_units:

  `"auto"`, `"seconds"`, or `"milliseconds"`.

- output_sampling_rate:

  Sampling rate for regular impulse train in Hz.

- max_frequency:

  Maximum frequency returned in spectrum.

## Value

A list with `overview`, `beat_table`, `impulse_table`, `spectrum_table`,
`summary`, and `settings`.
