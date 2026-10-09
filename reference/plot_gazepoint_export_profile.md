# Plot a Gazepoint export-folder profile

Create compact plots for file extensions, detected column roles, mean
missingness, or numeric signal activity.

## Usage

``` r
plot_gazepoint_export_profile(
  profile,
  type = c("files", "roles", "missingness", "activity"),
  top_n = 20
)
```

## Arguments

- profile:

  Object returned by
  [`profile_gazepoint_export_folder()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/profile_gazepoint_export_folder.md).

- type:

  Plot type. One of `"files"`, `"roles"`, `"missingness"`, or
  `"activity"`.

- top_n:

  Number of columns or files to show for selected plots.

## Value

A `ggplot` object.
