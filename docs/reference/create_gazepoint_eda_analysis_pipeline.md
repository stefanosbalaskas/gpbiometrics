# Create a Gazepoint EDA analysis pipeline guide

Creates a structured six-phase analysis pipeline for Gazepoint
Biometrics EDA/GSR workflows. The helper maps each phase to native
`gpbiometrics` functions, optional external-method bridges, and optional
downstream model templates for `brms` and `lme4`.

## Usage

``` r
create_gazepoint_eda_analysis_pipeline(
  include_external_bridges = TRUE,
  include_model_templates = TRUE,
  include_reporting_guidance = TRUE,
  style = c("compact", "detailed")
)
```

## Arguments

- include_external_bridges:

  Logical. If `TRUE`, include NeuroKit2, Ledalab-style, PsPM-style,
  cvxEDA-style, RHRV, and pyPPG bridge helpers.

- include_model_templates:

  Logical. If `TRUE`, include text templates for downstream `brms`
  hurdle models and `lme4` mixed-effects models.

- include_reporting_guidance:

  Logical. If `TRUE`, include reporting and interpretation guardrails.

- style:

  Output style. `"compact"` returns concise phase descriptions;
  `"detailed"` returns fuller phase notes.

## Value

A list with `overview`, `phases`, `function_map`, `model_templates`,
`reporting_guidance`, `interpretation_guardrails`, and `settings`.

## Details

This function does not fit statistical models, does not run external
software, and does not infer emotion, valence, stress, trust,
preference, cognition, or diagnosis. It is a reproducible planning and
reporting aid.
