# Flag EDA artifacts with a user-supplied SVM-style model

Applies a user-supplied model or prediction function to segment-level
artifact features. No pretrained model is bundled, so this function
avoids pretending to reproduce any proprietary or externally trained
classifier.

## Usage

``` r
flag_gazepoint_artifacts_svm(
  x,
  model = NULL,
  feature_cols = NULL,
  probability_threshold = 0.5,
  ...
)
```

## Arguments

- x:

  Either raw EDA data or output from
  [`prepare_gazepoint_artifact_svm_features()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_artifact_svm_features.md).

- model:

  Optional model object or function. If `NULL`, features are returned
  with missing artifact predictions.

- feature_cols:

  Optional feature columns used by the model.

- probability_threshold:

  Threshold for artifact probability.

- ...:

  Passed to
  [`prepare_gazepoint_artifact_svm_features()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/prepare_gazepoint_artifact_svm_features.md)
  when `x` is raw data.

## Value

A data frame with artifact probabilities/classes where available.
