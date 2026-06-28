# Create HeartPy-style report tables for Gazepoint pulse/PPG data

Create HeartPy-style report tables for Gazepoint pulse/PPG data

## Usage

``` r
create_gazepoint_heartpy_report(
  detection,
  output_dir = NULL,
  prefix = "gazepoint_heartpy"
)
```

## Arguments

- detection:

  Detection object returned by detect_gazepoint_ppg_peaks().

- output_dir:

  Optional output directory. If NULL, no files are written.

- prefix:

  File prefix when output_dir is supplied.

## Value

A list with peaks, measures, diagnostics, and paths.
