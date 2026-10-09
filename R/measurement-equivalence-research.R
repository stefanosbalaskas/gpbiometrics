#' Audit two paired physiological measurements without claiming equivalence
#'
#' Association, descriptive agreement, condition responsiveness and
#' nuisance strata are evaluated as distinct types of evidence. This
#' prevents correlation alone from being labeled interchangeability.
#'
#' @param data Data frame with paired reference and candidate measurements.
#' @param reference Reference-device column name.
#' @param candidate Candidate-device column name.
#' @param participant Participant identity column name.
#' @param phase Experimental phase column name.
#' @param nuisance Optional grouping variable representing a nuisance condition.
#' @return List with `agreement`, `strata`, `phase_means`,
#'   `paired_unit_means`, and limitations.
#' @export
audit_gazepoint_measurement_equivalence <- function(
    data, reference, candidate, participant = "participant_id",
    phase = "phase", nuisance = NULL) {
  names_in <- c(reference, candidate, participant, phase, nuisance)
  if (!is.data.frame(data) || nrow(data) < 3L ||
      anyDuplicated(names_in) ||
      !all(names_in %in% names(data))) {
    stop("Nonempty paired data and distinct existing column names required.", call. = FALSE)
  }
  x <- data[[reference]]
  y <- data[[candidate]]
  if (!is.numeric(x) || !is.numeric(y)) {
    stop("Reference and candidate must be numeric measurements.", call. = FALSE)
  }
  ids <- as.character(data[[participant]])
  ph <- as.character(data[[phase]])
  nvals <- if (is.null(nuisance)) rep("not_declared", length(ids)) else
    as.character(data[[nuisance]])
  if (anyNA(ids) || anyNA(ph) || anyNA(nvals) ||
      any(!nzchar(ids)) || any(!nzchar(ph)) || any(!nzchar(nvals))) {
    stop("Participant, phase and nuisance identities cannot be missing.", call. = FALSE)
  }
  keep <- is.finite(x) & is.finite(y)
  if (sum(keep) < 3L || length(unique(ids[keep])) < 2L) {
    stop("At least three complete paired readings across two people required.", call. = FALSE)
  }
  cleaned <- data.frame(
    participant_id = ids[keep], phase = ph[keep],
    nuisance = nvals[keep], reference = x[keep], candidate = y[keep]
  )
  # No sample-level pseudo-replication in descriptive agreement: collapse
  # within the explicitly supplied participant x phase x nuisance cells.
  unit <- stats::aggregate(
    cbind(reference, candidate) ~ participant_id + phase + nuisance,
    data = cleaned, FUN = mean
  )
  if (nrow(unit) < 3L) {
    stop("At least three participant-phase-nuisance matched cells required.", call. = FALSE)
  }
  difference <- unit$candidate - unit$reference
  bias <- mean(difference)
  spread <- stats::sd(difference)
  cor_pearson <- if (stats::sd(unit$reference) > 0 &&
                     stats::sd(unit$candidate) > 0) {
    stats::cor(unit$reference, unit$candidate, method = "pearson")
  } else NA_real_
  cor_spearman <- if (length(unique(unit$reference)) > 1L &&
                      length(unique(unit$candidate)) > 1L) {
    suppressWarnings(stats::cor(
      unit$reference, unit$candidate, method = "spearman"
    ))
  } else NA_real_
  ccc_denom <- stats::var(unit$reference) + stats::var(unit$candidate) +
    (mean(unit$reference) - mean(unit$candidate))^2
  ccc <- if (is.finite(ccc_denom) && ccc_denom > 0) {
    2 * stats::cov(unit$reference, unit$candidate) / ccc_denom
  } else NA_real_
  overall <- data.frame(
    n_participant_phase_cells = nrow(unit),
    n_participants = length(unique(unit$participant_id)),
    excluded_nonpaired_rows = sum(!keep),
    pearson_r = cor_pearson,
    spearman_rho = cor_spearman,
    concordance_correlation = ccc,
    candidate_minus_reference_bias = bias,
    descriptive_loa_lower = bias - 1.96 * spread,
    descriptive_loa_upper = bias + 1.96 * spread
  )
  split_nuisance <- split(unit, unit$nuisance)
  by_nuisance <- do.call(rbind, lapply(names(split_nuisance), function(nm) {
    d <- split_nuisance[[nm]]
    data.frame(
      nuisance = nm,
      n_cells = nrow(d),
      n_participants = length(unique(d$participant_id)),
      mean_difference = mean(d$candidate - d$reference)
    )
  }))
  rownames(by_nuisance) <- NULL
  phase_means <- stats::aggregate(
    cbind(reference, candidate) ~ phase, data = unit, FUN = mean
  )
  list(
    agreement = overall,
    nuisance_strata = by_nuisance,
    phase_means = phase_means,
    paired_unit_means = unit,
    limitations = paste(
      "Correlation is not agreement or equivalence. Bland-Altman limits",
      "are descriptive participant-phase cell limits, not repeated-measures",
      "confidence intervals. Nuisance strata do not establish a causal",
      "device-by-nuisance interaction without a separately fitted model."
    )
  )
}
