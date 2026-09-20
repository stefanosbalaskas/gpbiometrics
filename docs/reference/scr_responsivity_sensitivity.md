# Retention-first SCR responsivity sensitivity

Preserves the conventional threshold/non-responder flag but estimates a
Beta-Binomial posterior response probability and retains low-reactive
participants for model-based sensitivity analyses.

## Usage

``` r
scr_responsivity_sensitivity(
  participant,
  amplitude,
  threshold = 0.02,
  prior_alpha = 1,
  prior_beta = 1
)
```

## Arguments

- participant:

  Participant identifiers.

- amplitude:

  Trial-level SCR amplitudes.

- threshold:

  Conventional response threshold in microsiemens.

- prior_alpha, prior_beta:

  Beta prior parameters.

## Value

A data frame with conventional and posterior responsivity summaries.
