# Estimate respiration from PPG

Compatibility alias for
[`estimate_gazepoint_respiration_from_ppg()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/estimate_gazepoint_respiration_from_ppg.md).
The returned value should be interpreted as an exploratory PPG-derived
respiration-rate estimate, not as a direct respiratory measurement.

## Usage

``` r
respiration_from_ppg(data, ...)
```

## Arguments

- data:

  Data frame or numeric PPG vector.

- ...:

  Additional arguments passed to
  [`estimate_gazepoint_respiration_from_ppg()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/estimate_gazepoint_respiration_from_ppg.md).

## Value

Output from
[`estimate_gazepoint_respiration_from_ppg()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/estimate_gazepoint_respiration_from_ppg.md).
