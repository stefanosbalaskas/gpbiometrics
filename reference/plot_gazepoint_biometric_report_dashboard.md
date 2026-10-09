# Create a lightweight Gazepoint biometric QC plot dashboard

Creates a lightweight dashboard object containing QC plots for signal
activity and time-reset diagnostics. This is a structured list of ggplot
objects, not a Shiny application. The dashboard is intended for report
preparation and manual QC review.

## Usage

``` r
plot_gazepoint_biometric_report_dashboard(
  data = NULL,
  signal_activity = NULL,
  time_resets = NULL,
  signal_cols = NULL,
  group_cols = NULL,
  time_col = NULL,
  include_signal_activity = TRUE,
  include_time_resets = TRUE,
  max_groups = 30,
  continue_on_error = TRUE,
  title_prefix = "Gazepoint biometric QC"
)
```

## Arguments

- data:

  Optional Gazepoint biometric data frame.

- signal_activity:

  Optional result from
  [`audit_gazepoint_signal_activity()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_signal_activity.md).

- time_resets:

  Optional result from
  [`audit_gazepoint_time_resets()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_time_resets.md).

- signal_cols:

  Optional signal columns used when computing signal activity from
  `data`.

- group_cols:

  Optional grouping columns.

- time_col:

  Optional time or counter column.

- include_signal_activity:

  If `TRUE`, include a signal-activity plot.

- include_time_resets:

  If `TRUE`, include a time-reset plot.

- max_groups:

  Maximum number of groups to display in each plot.

- continue_on_error:

  If `TRUE`, plot failures are recorded in `errors` rather than stopping
  the dashboard.

- title_prefix:

  Optional title prefix.

## Value

A list with `overview`, `plots`, `errors`, `inputs`, and `settings`.
