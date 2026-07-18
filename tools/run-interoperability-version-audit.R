arguments <- commandArgs(
  trailingOnly = TRUE
)

if (
  file.exists("DESCRIPTION") &&
  dir.exists("R")
) {
  if (!requireNamespace("devtools", quietly = TRUE)) {
    stop(
      "Running from source requires the `devtools` package.",
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

output_dir <- if (
  length(arguments) >= 1L &&
  nzchar(arguments[[1L]])
) {
  arguments[[1L]]
} else {
  Sys.getenv(
    "GPBIOMETRICS_INTEROP_OUTPUT",
    unset = file.path(
      tempdir(),
      "gpbiometrics-interoperability"
    )
  )
}

include_python <- !identical(
  tolower(
    Sys.getenv(
      "GPBIOMETRICS_INTEROP_PYTHON",
      unset = "true"
    )
  ),
  "false"
)

audit <- audit_gazepoint_interoperability_versions(
  include_python = include_python,
  strict = FALSE
)

print(audit)

files <- write_gazepoint_interoperability_audit(
  audit,
  output_dir = output_dir,
  overwrite = TRUE
)

cat(
  "\nWritten compatibility files:\n",
  paste0(
    "  ",
    unname(files)
  ),
  sep = "\n"
)

cat(
  "\n"
)

if (
  !isTRUE(
    audit$summary$overall_pass[[1L]]
  )
) {
  quit(
    save = "no",
    status = 1L,
    runLast = FALSE
  )
}
