# Summarize beat-correction logs

Summarizes the correction log returned by
[`correct_gazepoint_beats()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/correct_gazepoint_beats.md).
The summary is intended for transparent reporting and does not imply
automatic exclusion or interpretive conclusions.

## Usage

``` r
summarize_gazepoint_beat_corrections(correction, by = NULL)
```

## Arguments

- correction:

  A `gazepoint_beat_correction` object or a correction log data frame.

- by:

  Optional character vector of grouping columns.

## Value

A data frame.
