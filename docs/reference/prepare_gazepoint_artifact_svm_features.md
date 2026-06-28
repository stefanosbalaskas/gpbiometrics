# Prepare EDA artifact-classifier segment features

Creates segment-level features that can be passed to a user-supplied
artifact classifier such as an SVM. No pretrained classifier is bundled.

## Usage

``` r
prepare_gazepoint_artifact_svm_features(
  dat,
  eda_col = "GSR_US",
  time_col = NULL,
  group_cols = NULL,
  segment_seconds = 5,
  samples_per_segment = NULL,
  sampling_rate = NULL
)
```

## Arguments

- dat:

  A data frame.

- eda_col:

  EDA/conductance column.

- time_col:

  Optional time column.

- group_cols:

  Optional grouping columns.

- segment_seconds:

  Segment length in seconds when `time_col` is supplied.

- samples_per_segment:

  Segment length in samples when no usable time column or sampling rate
  is available.

- sampling_rate:

  Optional sampling rate in Hz.

## Value

A segment-level feature data frame.
