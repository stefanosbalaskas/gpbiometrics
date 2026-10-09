# Create a Gazepoint biometrics preregistration template

Creates a cautious preregistration template for Gazepoint Biometrics
EDA/GSR workflows.

## Usage

``` r
create_gazepoint_preregistration_template(
  study_title = "Gazepoint biometrics study",
  signal_standardization = c("within_participant_z", "range_correction", "none"),
  artifact_rules = c("kleckner_style", "custom", "none"),
  eda_min_us = 0.01,
  eda_max_us = 100,
  rapid_change_threshold = 20,
  output_file = NULL
)
```

## Arguments

- study_title:

  Study title.

- signal_standardization:

  Standardization plan.

- artifact_rules:

  Artifact-rule description.

- eda_min_us:

  Minimum conductance threshold.

- eda_max_us:

  Maximum conductance threshold.

- rapid_change_threshold:

  Maximum absolute percent change per second.

- output_file:

  Optional path to write the template as a text file.

## Value

A character string.
