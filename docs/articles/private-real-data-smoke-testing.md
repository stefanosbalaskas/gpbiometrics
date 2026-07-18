# Running private real-data smoke tests safely

## Purpose

Synthetic package tests are necessary for reproducibility, but genuine
Gazepoint exports may contain irregular schemas, missing channels,
timestamp resets, unexpected warnings, or study-specific folder
structures that synthetic fixtures do not reproduce.

[`run_gazepoint_real_data_smoke()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_real_data_smoke.md)
provides a controlled way to execute the standard `gpbiometrics`
workflow on private exports while retaining only deidentified aggregate
findings.

A smoke test establishes whether the workflow can process a dataset and
produce interpretable diagnostics. It is not a complete scientific
analysis and does not establish that every signal is suitable for
inferential use.

## Privacy model

The smoke harness is designed around four restrictions:

1.  private inputs remain outside the package repository;
2.  generated outputs remain outside the package repository;
3.  source folder names and filenames are replaced by sequential
    identifiers;
4.  raw workflows and participant-level data are not retained.

Returned dataset identifiers use neutral labels such as:

``` text
smoke_001
smoke_002
smoke_003
```

Warnings, messages, and errors are sanitized before they are stored. The
sanitizer removes or replaces:

- absolute paths;
- supplied private directory values;
- CSV filenames;
- email addresses;
- quoted values;
- identifier-like text.

## Recommended private directory structure

A practical external structure is:

``` text
C:/Research/private/gpbiometrics_smoke/
├── complete_recording/
├── inactive_eda/
├── timestamp_reset/
├── dropout_heavy/
└── event_mismatch/
```

Each immediate subdirectory is treated as one dataset when
`dataset_mode = "subdirectories"`.

The data directory should not be located under the package repository.

## Configure external locations

Use environment variables instead of embedding personal paths in
scripts.

``` r

Sys.setenv(
  GPBIOMETRICS_SMOKE_DIR =
    "C:/Research/private/gpbiometrics_smoke",
  GPBIOMETRICS_SMOKE_OUTPUT =
    "C:/Research/private/gpbiometrics_smoke_results"
)
```

The package reads the source directory from `GPBIOMETRICS_SMOKE_DIR` by
default.

## Run the standard workflow

The normal private-data run uses the package workflow, workflow summary,
and workflow diagnostic.

``` r

smoke <- run_gazepoint_real_data_smoke(
  data_dir =
    Sys.getenv("GPBIOMETRICS_SMOKE_DIR"),
  output_dir =
    Sys.getenv("GPBIOMETRICS_SMOKE_OUTPUT"),
  dataset_mode = "subdirectories",
  recursive = TRUE,
  workflow_args = list(),
  diagnostic_args = list(),
  stop_on_error = FALSE,
  write_results = TRUE,
  overwrite = TRUE,
  protect_repository = TRUE
)

print(smoke)
```

The default workflow runner is
[`run_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_biometrics_workflow.md).
Its result is used temporarily to produce the aggregate summary and
diagnostic, but the raw workflow object is not retained in the returned
smoke object.

## Reproducible contract demonstration

The harness can be demonstrated without genuine participant data by
supplying controlled runner functions.

``` r

private_root <- tempfile(
  "gpbiometrics-private-smoke-"
)

dir.create(
  file.path(
    private_root,
    "complete_recording"
  ),
  recursive = TRUE
)

dir.create(
  file.path(
    private_root,
    "review_recording"
  ),
  recursive = TRUE
)

utils::write.csv(
  data.frame(
    TIME = seq(
      0,
      0.4,
      by = 0.1
    ),
    GSR = c(
      0.10,
      0.11,
      0.12,
      0.11,
      0.13
    ),
    HR = c(
      70,
      71,
      70,
      72,
      71
    )
  ),
  file.path(
    private_root,
    "complete_recording",
    "recording.csv"
  ),
  row.names = FALSE
)

utils::write.csv(
  data.frame(
    TIME = seq(
      0,
      0.4,
      by = 0.1
    ),
    GSR = c(
      NA,
      NA,
      0.12,
      NA,
      0.13
    ),
    HR = c(
      70,
      NA,
      70,
      NA,
      71
    )
  ),
  file.path(
    private_root,
    "review_recording",
    "recording.csv"
  ),
  row.names = FALSE
)
```

The controlled workflow runner returns a temporary object. The summary
and diagnostic runners return aggregate values only.

``` r

mock_workflow_runner <- function(
    path,
    ...) {
  list(
    completed = TRUE,
    temporary_source = path
  )
}

mock_summary_runner <- function(
    workflow) {
  data.frame(
    n_rows = 120,
    n_participants = 2,
    n_trials = 4,
    n_events = 8,
    detected_schema =
      "Gazepoint Biometrics",
    active_signal_groups = 3,
    stringsAsFactors = FALSE
  )
}

mock_diagnostic_runner <- function(
    workflow,
    ...) {
  data.frame(
    status = "pass",
    stringsAsFactors = FALSE
  )
}
```

``` r

mock_smoke <- run_gazepoint_real_data_smoke(
  data_dir = private_root,
  dataset_mode = "subdirectories",
  workflow_runner =
    mock_workflow_runner,
  summary_runner =
    mock_summary_runner,
  diagnostic_runner =
    mock_diagnostic_runner,
  protect_repository = TRUE
)

print(mock_smoke)
#> <gazepoint_real_data_smoke>
#> Datasets: 2
#> Pass: 2
#> Review: 0
#> Fail: 0
#> Private data retained: FALSE
```

``` r

mock_smoke$results[
  ,
  c(
    "dataset_id",
    "n_files",
    "n_csv_files",
    "n_rows",
    "n_participants",
    "n_trials",
    "n_events",
    "detected_schema",
    "smoke_status",
    "n_warnings",
    "elapsed_seconds"
  )
]
#>   dataset_id n_files n_csv_files n_rows n_participants n_trials n_events
#> 1  smoke_001       1           1    120              2        4        8
#> 2  smoke_002       1           1    120              2        4        8
#>        detected_schema smoke_status n_warnings elapsed_seconds
#> 1 Gazepoint Biometrics         pass          0               0
#> 2 Gazepoint Biometrics         pass          0               0
```

Neither the original subdirectory names nor the source filename is
retained in the aggregate result.

## Understanding smoke statuses

Each dataset receives one of three statuses:

- `pass`: workflow, summary, and diagnostic completed without a failure
  or review condition;
- `review`: processing completed, but the diagnostic or captured
  warnings require inspection;
- `fail`: the workflow, summary, diagnostic, or explicit readiness
  decision failed.

Errors are assigned to a processing stage:

- `workflow`;
- `summary`;
- `diagnostic`.

`stop_on_error = FALSE` allows later datasets to continue after an
earlier failure. This is usually preferable for an inventory-style smoke
test.

## Inspect captured conditions

Sanitized warnings, messages, and errors are retained separately.

``` r

mock_smoke$conditions
#> [1] dataset_id      stage           condition_type  condition_class
#> [5] message
#> <0 rows> (or 0-length row.names)
```

This table contains:

- anonymous dataset identifier;
- processing stage;
- condition type;
- condition class;
- sanitized message.

It does not contain a raw workflow object or source data.

## Audit the retained object

The privacy audit can be rerun explicitly.

``` r

privacy <- audit_gazepoint_smoke_privacy(
  mock_smoke
)

privacy
#>                        check status
#> 1        required_components   pass
#> 2 aggregate_data_frames_only   pass
#> 3       no_forbidden_columns   pass
#> 4          no_absolute_paths   pass
#> 5          no_private_values   pass
#> 6    no_raw_workflow_objects   pass
#>                                                           message
#> 1                  All required aggregate components are present.
#> 2              All retained components are aggregate data frames.
#> 3 No participant, filename, path, or raw-data columns were found.
#> 4                        No absolute path-like values were found.
#> 5                          No supplied private values were found.
#> 6                          No raw workflow objects were retained.
```

The checks cover:

- presence of the required aggregate components;
- aggregate data-frame-only retention;
- absence of participant, filename, path, and raw-data columns;
- absence of absolute paths;
- absence of supplied private values;
- absence of retained workflow objects.

All checks must pass before the writer accepts a smoke-test result.

## Write aggregate outputs

``` r

output_dir <- tempfile(
  "gpbiometrics-smoke-output-"
)

files <- write_gazepoint_real_data_smoke(
  mock_smoke,
  output_dir = output_dir
)

basename(files)
#> [1] "gpbiometrics-real-data-smoke-results.csv"
#> [2] "gpbiometrics-real-data-smoke-conditions.csv"
#> [3] "gpbiometrics-real-data-smoke-session.csv"
#> [4] "gpbiometrics-real-data-smoke-settings.csv"
```

The writer creates:

- aggregate dataset results;
- sanitized conditions;
- runtime metadata;
- non-sensitive execution settings.

Private source paths and raw data are not written.

## Command-line runner

From the repository:

``` r

system2(
  "Rscript",
  "tools/run-real-data-smoke-test.R"
)
```

The runner reads:

``` text
GPBIOMETRICS_SMOKE_DIR
GPBIOMETRICS_SMOKE_OUTPUT
GPBIOMETRICS_SMOKE_DATASET_MODE
GPBIOMETRICS_SMOKE_RECURSIVE
GPBIOMETRICS_SMOKE_STOP_ON_ERROR
```

It writes only aggregate output files and returns a non-zero exit status
when at least one dataset fails.

## Combining multiple smoke runs

The summary tool can combine result files from different local runs.

``` r

system2(
  "Rscript",
  c(
    "tools/summarize-real-data-smoke-test.R",
    shQuote(
      "C:/Research/private/run_01"
    ),
    shQuote(
      "C:/Research/private/run_02"
    )
  )
)
```

Combined runs receive anonymous identifiers such as:

``` text
smoke_run_001
smoke_run_002
```

The combined output does not retain the supplied source directories.

## Repository safeguards

The package `.gitignore` excludes common private-data and
generated-output locations:

``` text
real-data/
private-data/
smoke-test-output/
local-smoke-results/
*.private.csv
*.private.rds
```

These rules provide an additional safeguard, but private exports should
still remain outside the repository rather than relying only on ignore
patterns.

After every private smoke run, verify repository cleanliness:

``` r

system(
  "git status --short"
)
```

The command should not show private files or smoke-test output
directories.

## Interpretation boundary

A successful smoke test supports the conclusion that:

- files were discoverable;
- the workflow completed;
- aggregate summaries and diagnostics were generated;
- warnings and failures were handled audibly;
- no private source information was retained by the harness.

It does not demonstrate that:

- every signal is scientifically valid;
- every participant should be retained;
- physiological measures are clinically interpretable;
- downstream statistical assumptions are satisfied;
- the absence of a workflow error implies absence of data-quality
  problems.

Smoke results should therefore be reviewed alongside the package’s
quality, dropout, event, design, synchronization, and reporting audits.
