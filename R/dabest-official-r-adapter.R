#' Produce canonical DABEST estimation graphics from Gazepoint summaries
#'
#' Optional, design-guarded adapter to the maintained R dabestr package.
#' Requires independent participant-level rows, or one row per participant
#' and condition in paired designs. Unlike the native plotting alternative,
#' the actual BCa bootstrap and figure are owned by dabestr.
#'
#' @param data Participant-level tidy data frame.
#' @param group Name of the two-condition group column.
#' @param outcome Numeric measurement column name.
#' @param id Participant identity column; required for paired data.
#' @param paired Whether to require complete matched pairs.
#' @param float_contrast TRUE for Gardner-Altman, FALSE for Cumming layout.
#' @param resamples Number of dabestr bootstrap resamples (>=100).
#' @return A list containing the canonical dabestr plot, effect size object,
#'   input data and explicit independent-unit assumptions.
#' @export
plot_gazepoint_dabest <- function(
    data, group, outcome, id = NULL, paired = FALSE,
    float_contrast = TRUE, resamples = 5000L) {
  if (!requireNamespace("dabestr", quietly = TRUE)) {
    stop("Install the optional dabestr R package for official DABEST graphics.", call. = FALSE)
  }
  if (!is.data.frame(data) || nrow(data) < 6L ||
      !is.character(group) || length(group) != 1L ||
      !is.character(outcome) || length(outcome) != 1L ||
      !all(c(group, outcome, id) %in% names(data))) {
    stop("Require participant-level data and existing group/outcome columns.", call. = FALSE)
  }
  if (!is.logical(paired) || length(paired) != 1L || is.na(paired) ||
      !is.logical(float_contrast) || length(float_contrast) != 1L ||
      is.na(float_contrast)) {
    stop("paired and float_contrast must be TRUE or FALSE.", call. = FALSE)
  }
  if (!is.numeric(resamples) || length(resamples) != 1L ||
      !is.finite(resamples) || resamples < 100 ||
      resamples != floor(resamples)) {
    stop("resamples must be an integer >=100.", call. = FALSE)
  }
  if (paired && (is.null(id) || !id %in% names(data))) {
    stop("Paired DABEST estimation requires a participant identity column.", call. = FALSE)
  }
  measurement <- data[[outcome]]
  conditions <- as.character(data[[group]])
  identities <- if (is.null(id)) as.character(seq_len(nrow(data))) else
    as.character(data[[id]])
  if (!is.numeric(measurement) || any(!is.finite(measurement)) ||
      anyNA(conditions) || any(!nzchar(conditions)) ||
      anyNA(identities) || any(!nzchar(identities))) {
    stop("Measurements, condition labels and identities must be finite and complete.", call. = FALSE)
  }
  group_levels <- if (is.factor(data[[group]])) {
    levels(droplevels(data[[group]]))
  } else unique(conditions)
  if (length(group_levels) != 2L) {
    stop("Exactly two observed group levels are required.", call. = FALSE)
  }
  d <- data.frame(
    Group = factor(conditions, levels = group_levels),
    Measurement = measurement,
    ID = identities
  )
  if (any(duplicated(d[c("Group", "ID")]))) {
    stop("Aggregate multiple trials to one participant-condition row.", call. = FALSE)
  }
  observed <- split(as.character(d$Group), d$ID)
  if (paired) {
    if (length(observed) < 3L ||
        any(!vapply(observed, function(x) setequal(x, group_levels), logical(1)))) {
      stop("Paired data require >=3 participants observed in both groups.", call. = FALSE)
    }
    loaded <- dabestr::load(
      data = d, x = Group, y = Measurement,
      idx = group_levels, paired = "baseline",
      id_col = ID, resamples = as.integer(resamples)
    )
  } else {
    if (any(vapply(observed, length, integer(1)) != 1L)) {
      stop("Repeated participants across conditions require paired=TRUE.", call. = FALSE)
    }
    if (min(table(d$Group)) < 3L) {
      stop("At least three independent participants per group required.", call. = FALSE)
    }
    loaded <- dabestr::load(
      data = d, x = Group, y = Measurement,
      idx = group_levels, resamples = as.integer(resamples)
    )
  }
  effect <- dabestr::mean_diff(loaded)
  plot <- dabestr::dabest_plot(effect, float_contrast = float_contrast)
  list(
    plot = plot,
    effect = effect,
    dabest_input = loaded,
    assumptions = paste(
      "Independent participant-level rows; matched pairing explicitly checked.",
      "Uses dabestr's effect-size methods and BCa uncertainty.",
      "Not a mixed model, adjusted contrast, physiological equivalence test",
      "or independent publication qualification."
    )
  )
}
