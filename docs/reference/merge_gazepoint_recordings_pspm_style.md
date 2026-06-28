# Merge multiple Gazepoint recordings PsPM-style

Merge multiple Gazepoint recordings PsPM-style

## Usage

``` r
merge_gazepoint_recordings_pspm_style(
  recordings,
  time_col = NULL,
  gap_seconds = 1,
  recording_col = "pspm_recording",
  reset_first_time = TRUE
)
```

## Arguments

- recordings:

  List of data frames.

- time_col:

  Time column.

- gap_seconds:

  Gap inserted between recordings.

- recording_col:

  Output recording-id column.

- reset_first_time:

  If TRUE, each input time starts from zero before offsetting.

## Value

Merged data frame.
