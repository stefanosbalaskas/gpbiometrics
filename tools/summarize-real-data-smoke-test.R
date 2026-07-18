arguments <- commandArgs(
  trailingOnly = TRUE
)

if (length(arguments) == 0L) {
  stop(
    paste(
      "Supply one or more smoke-test output directories",
      "or `*-results.csv` files."
    ),
    call. = FALSE
  )
}

find_results_file <- function(value) {
  if (
    file.exists(value) &&
    !dir.exists(value)
  ) {
    return(
      normalizePath(
        value,
        winslash = "/",
        mustWork = TRUE
      )
    )
  }

  if (dir.exists(value)) {
    matches <- list.files(
      value,
      pattern =
        "gpbiometrics-real-data-smoke-results\\.csv$",
      full.names = TRUE,
      recursive = FALSE,
      ignore.case = TRUE
    )

    if (length(matches) != 1L) {
      stop(
        "Expected exactly one smoke results CSV in each directory.",
        call. = FALSE
      )
    }

    return(
      normalizePath(
        matches,
        winslash = "/",
        mustWork = TRUE
      )
    )
  }

  stop(
    "Input does not exist: ",
    value,
    call. = FALSE
  )
}

results_files <- vapply(
  arguments,
  find_results_file,
  character(1)
)

result_tables <- lapply(
  seq_along(results_files),
  function(index) {
    data <- utils::read.csv(
      results_files[[index]],
      stringsAsFactors = FALSE,
      na.strings = c(
        "",
        "NA"
      )
    )

    required <- c(
      "dataset_id",
      "smoke_status"
    )

    missing <- setdiff(
      required,
      names(data)
    )

    if (length(missing) > 0L) {
      stop(
        "A results file is missing columns: ",
        paste(
          missing,
          collapse = ", "
        ),
        ".",
        call. = FALSE
      )
    }

    forbidden <- intersect(
      tolower(
        names(data)
      ),
      c(
        "path",
        "file_path",
        "filename",
        "participant",
        "participant_id",
        "subject",
        "subject_id",
        "workflow"
      )
    )

    if (length(forbidden) > 0L) {
      stop(
        "Unsafe columns were found: ",
        paste(
          forbidden,
          collapse = ", "
        ),
        ".",
        call. = FALSE
      )
    }

    data$run_id <- sprintf(
      "smoke_run_%03d",
      index
    )

    data
  }
)

combined <- do.call(
  rbind,
  result_tables
)

rownames(combined) <- NULL

status_levels <- c(
  "pass",
  "review",
  "fail"
)

run_ids <- unique(
  combined$run_id
)

summary_rows <- lapply(
  run_ids,
  function(run_id) {
    data <- combined[
      combined$run_id == run_id,
      ,
      drop = FALSE
    ]

    counts <- table(
      factor(
        data$smoke_status,
        levels = status_levels
      )
    )

    data.frame(
      run_id = run_id,
      n_datasets = NROW(data),
      n_pass = unname(
        counts[["pass"]]
      ),
      n_review = unname(
        counts[["review"]]
      ),
      n_fail = unname(
        counts[["fail"]]
      ),
      total_files = if (
        "n_files" %in% names(data)
      ) {
        sum(
          data$n_files,
          na.rm = TRUE
        )
      } else {
        NA_real_
      },
      total_rows = if (
        "n_rows" %in% names(data)
      ) {
        sum(
          data$n_rows,
          na.rm = TRUE
        )
      } else {
        NA_real_
      },
      overall_pass = !any(
        data$smoke_status ==
          "fail"
      ),
      stringsAsFactors = FALSE
    )
  }
)

run_summary <- do.call(
  rbind,
  summary_rows
)

rownames(run_summary) <- NULL

output_dir <- Sys.getenv(
  "GPBIOMETRICS_SMOKE_SUMMARY_OUTPUT",
  unset = file.path(
    tempdir(),
    "gpbiometrics-smoke-summary"
  )
)

dir.create(
  output_dir,
  recursive = TRUE,
  showWarnings = FALSE
)

combined_path <- file.path(
  output_dir,
  "gpbiometrics-smoke-combined-results.csv"
)

summary_path <- file.path(
  output_dir,
  "gpbiometrics-smoke-run-summary.csv"
)

utils::write.csv(
  combined,
  combined_path,
  row.names = FALSE,
  na = ""
)

utils::write.csv(
  run_summary,
  summary_path,
  row.names = FALSE,
  na = ""
)

cat(
  "Combined smoke-test summary:\n"
)

print(
  run_summary,
  row.names = FALSE
)

cat(
  "\nWritten aggregate files:\n"
)

cat(
  paste0(
    "  ",
    basename(
      c(
        combined_path,
        summary_path
      )
    )
  ),
  sep = "\n"
)

cat("\n")
