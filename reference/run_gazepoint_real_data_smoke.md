# Run privacy-safe smoke tests on private Gazepoint exports

Runs the standard gpbiometrics workflow, workflow summary, and workflow
diagnostic on one or more private Gazepoint export folders. Raw data,
participant-level values, source filenames, and private paths are never
retained in the returned object.

## Usage

``` r
run_gazepoint_real_data_smoke(
  data_dir = Sys.getenv("GPBIOMETRICS_SMOKE_DIR", unset = ""),
  output_dir = NULL,
  dataset_mode = c("subdirectories", "root"),
  pattern = "\\.csv$",
  recursive = TRUE,
  workflow_args = list(),
  diagnostic_args = list(),
  workflow_runner = NULL,
  summary_runner = NULL,
  diagnostic_runner = NULL,
  stop_on_error = FALSE,
  write_results = FALSE,
  overwrite = FALSE,
  protect_repository = TRUE
)
```

## Arguments

- data_dir:

  Private external data directory. Defaults to
  `Sys.getenv("GPBIOMETRICS_SMOKE_DIR")`.

- output_dir:

  Optional directory for aggregate smoke-test outputs. This should
  remain outside the package repository.

- dataset_mode:

  How datasets are identified. `"subdirectories"` treats each immediate
  subdirectory containing matching files as one dataset. `"root"` treats
  `data_dir` as one dataset.

- pattern:

  Regular expression used to identify candidate input files.

- recursive:

  Search recursively within each dataset directory?

- workflow_args:

  Named list of additional arguments passed to
  [`run_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_biometrics_workflow.md).

- diagnostic_args:

  Named list of additional arguments passed to
  [`diagnose_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/diagnose_gazepoint_biometrics_workflow.md).

- workflow_runner:

  Optional workflow function. Defaults to
  [`run_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_biometrics_workflow.md).
  This argument primarily supports controlled testing.

- summary_runner:

  Optional summary function. Defaults to
  [`summarise_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/summarise_gazepoint_biometrics_workflow.md).

- diagnostic_runner:

  Optional diagnostic function. Defaults to
  [`diagnose_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/diagnose_gazepoint_biometrics_workflow.md).

- stop_on_error:

  Stop after the first failed dataset?

- write_results:

  Write aggregate CSV outputs to `output_dir`?

- overwrite:

  Permit replacement of existing aggregate output files?

- protect_repository:

  Reject private input or generated output directories located inside
  the current package repository?

## Value

An object of class `"gazepoint_real_data_smoke"` containing only
privacy-safe aggregate results, condition summaries, runtime metadata,
and non-sensitive settings.

## Details

The source directory should normally be outside the package repository
and supplied through the `GPBIOMETRICS_SMOKE_DIR` environment variable.

## Examples

``` r
private_dir <- Sys.getenv("GPBIOMETRICS_SMOKE_DIR")

if (nzchar(private_dir) && dir.exists(private_dir)) {
  smoke <- run_gazepoint_real_data_smoke(
    data_dir = private_dir
  )

  smoke$results
}
```
