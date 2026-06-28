# Print gpbiometrics reproducibility information

Returns package, R, platform, and session information useful for
manuscripts, reproducibility logs, and bug reports.

## Usage

``` r
gpbiometrics_info(print = TRUE, include_session = FALSE)
```

## Arguments

- print:

  If TRUE, print a compact summary.

- include_session:

  If TRUE, include
  [`utils::sessionInfo()`](https://rdrr.io/r/utils/sessionInfo.html) in
  the return object.

## Value

A list with package and session metadata.
