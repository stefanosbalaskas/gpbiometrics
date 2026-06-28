# Run pyHRV-style Gazepoint HRV analysis

Run pyHRV-style Gazepoint HRV analysis

## Usage

``` r
run_gazepoint_pyhrv_style(
  nni_ms = NULL,
  peaks = NULL,
  peak_time_col = "peak_time_s",
  time_unit = c("seconds", "milliseconds"),
  frequency_method = c("welch", "lomb", "ar")
)
```

## Arguments

- nni_ms:

  Numeric NN intervals in milliseconds.

- peaks:

  Optional peak timestamps/table. Used if nni_ms is missing.

- peak_time_col:

  Peak timestamp column if peaks is a data frame.

- time_unit:

  Unit for peaks.

- frequency_method:

  Frequency method.

## Value

List with time-domain, frequency-domain, nonlinear, and intervals.
