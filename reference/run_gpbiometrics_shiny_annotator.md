# Launch a lightweight gpbiometrics Shiny peak/artifact annotator

Launches a local Shiny app for manual EDA peak/artifact annotation. The
app lets users upload a Gazepoint CSV, inspect a selected signal, enter
manual peak/artifact intervals, and download annotation CSVs.

## Usage

``` r
run_gpbiometrics_shiny_annotator()
```

## Value

A Shiny application object, launched for interactive use.

## Details

This is an optional local GUI helper. It does not replace automated
scoring or infer emotion, stress, cognition, trust, preference, or
diagnosis.
