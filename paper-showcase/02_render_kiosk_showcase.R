# Render the gpbiometrics synthetic kiosk showcase.

# Run from the package root:

# source("paper-showcase/02_render_kiosk_showcase.R")

if (!file.exists("DESCRIPTION")) {
  stop(
    "Run this script from the gpbiometrics package root.",
    call. = FALSE
  )
}

if (!requireNamespace("rmarkdown", quietly = TRUE)) {
  stop(
    "Package 'rmarkdown' is required to render the showcase.",
    call. = FALSE
  )
}

dir.create(
  file.path("paper-showcase", "output"),
  recursive = TRUE,
  showWarnings = FALSE
)

rmarkdown::render(
  input = file.path("paper-showcase", "01_gpbiometrics_kiosk_showcase.Rmd"),
  output_dir = file.path("paper-showcase", "output"),
  clean = TRUE,
  envir = new.env(parent = globalenv())
)
