# Export PsPM-style Gazepoint model estimates

Export PsPM-style Gazepoint model estimates

## Usage

``` r
export_gazepoint_pspm_model_estimates(
  model,
  path,
  format = NULL,
  include_predictions = TRUE
)
```

## Arguments

- model:

  Model object from fit_gazepoint_convolution_glm().

- path:

  Output path. Use .csv, .rds, or .json.

- format:

  Optional format. If NULL, inferred from path extension.

- include_predictions:

  If TRUE, CSV export also writes predictions.

## Value

Data frame of written files.
