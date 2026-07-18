arguments <- commandArgs(
  trailingOnly = TRUE
)

if (
  file.exists("DESCRIPTION") &&
  dir.exists("R")
) {
  if (!requireNamespace("devtools", quietly = TRUE)) {
    stop(
      "Running from package source requires `devtools`.",
      call. = FALSE
    )
  }

  devtools::load_all(
    ".",
    quiet = TRUE
  )
} else {
  library(gpbiometrics)
}

data_dir <- if (
  length(arguments) >= 1L &&
  nzchar(arguments[[1L]])
) {
  arguments[[1L]]
} else {
  Sys.getenv(
    "GPBIOMETRICS_SMOKE_DIR",
    unset = ""
  )
}

output_dir <- if (
  length(arguments) >= 2L &&
  nzchar(arguments[[2L]])
) {
  arguments[[2L]]
} else {
  Sys.getenv(
    "GPBIOMETRICS_SMOKE_OUTPUT",
    unset = file.path(
      tempdir(),
      "gpbiometrics-real-data-smoke"
    )
  )
}

dataset_mode <- Sys.getenv(
  "GPBIOMETRICS_SMOKE_DATASET_MODE",
  unset = "subdirectories"
)

recursive <- !identical(
  tolower(
    Sys.getenv(
      "GPBIOMETRICS_SMOKE_RECURSIVE",
      unset = "true"
    )
  ),
  "false"
)

stop_on_error <- identical(
  tolower(
    Sys.getenv(
      "GPBIOMETRICS_SMOKE_STOP_ON_ERROR",
      unset = "false"
    )
  ),
  "true"
)

smoke <- run_gazepoint_real_data_smoke(
  data_dir = data_dir,
  output_dir = output_dir,
  dataset_mode = dataset_mode,
  recursive = recursive,
  workflow_args = list(),
  stop_on_error = stop_on_error,
  write_results = TRUE,
  overwrite = TRUE,
  protect_repository = TRUE
)

print(smoke)

display_columns <- intersect(
  c(
    "dataset_id",
    "n_files",
    "n_csv_files",
    "n_rows",
    "n_participants",
    "n_trials",
    "n_events",
    "detected_schema",
    "active_signal_groups",
    "diagnostic_status",
    "smoke_status",
    "n_warnings",
    "elapsed_seconds",
    "error_stage",
    "error_message"
  ),
  names(smoke$results)
)

cat(
  "\nAggregate dataset results:\n"
)

print(
  smoke$results[
    ,
    display_columns,
    drop = FALSE
  ],
  row.names = FALSE
)

privacy <- attr(
  smoke,
  "privacy_audit"
)

cat(
  "\nPrivacy audit:\n"
)

print(
  privacy,
  row.names = FALSE
)

written_files <- attr(
  smoke,
  "written_files"
)

cat(
  "\nWritten aggregate files:\n"
)

cat(
  paste0(
    "  ",
    basename(written_files)
  ),
  sep = "\n"
)

cat("\n")

if (
  any(
    smoke$results$smoke_status ==
    "fail"
  )
) {
  quit(
    save = "no",
    status = 1L,
    runLast = FALSE
  )
}
