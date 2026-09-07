# Measurement-accountability additions motivated by the September 2026 methods tranche.

#' Compare ECG-HRV and PPG-PRV devices for one derived metric
#'
#' Computes ICC(A,1), Lin's concordance correlation coefficient, and
#' Bland-Altman bias/95% limits. Agreement is deliberately scoped to the supplied
#' metric and acquisition configuration; it is not a global ECG/PPG equivalence
#' decision.
#'
#' @param reference,candidate Paired numeric values.
#' @param metric Name of the derived metric (for example `"RMSSD"`).
#' @param reference_source,candidate_source Signal-source labels.
#' @param reference_site,candidate_site Optional sensor-site labels.
#' @return A metric-specific agreement record.
#' @export
compare_hrv_prv_devices <- function(reference, candidate, metric,
                                    reference_source = "ECG-HRV",
                                    candidate_source = "PPG-PRV",
                                    reference_site = NA_character_,
                                    candidate_site = NA_character_) {
  if (length(reference) != length(candidate)) stop("Inputs must be paired.", call. = FALSE)
  keep <- is.finite(reference) & is.finite(candidate)
  x <- as.numeric(reference[keep]); y <- as.numeric(candidate[keep]); n <- length(x)
  if (n < 3L) stop("At least 3 paired finite observations are required.", call. = FALSE)
  mx <- mean(x); my <- mean(y); vx <- stats::var(x); vy <- stats::var(y); cv <- stats::cov(x, y)
  ccc_den <- vx + vy + (mx - my)^2
  ccc <- if (ccc_den > 0) 2 * cv / ccc_den else NA_real_
  d <- x - y; bias <- mean(d); sd_d <- stats::sd(d)
  grand <- mean(c(x, y)); row_means <- (x + y) / 2
  msr <- 2 * sum((row_means - grand)^2) / (n - 1)
  msc <- n * ((mx - grand)^2 + (my - grand)^2)
  sse <- sum((x - row_means - mx + grand)^2 + (y - row_means - my + grand)^2)
  mse <- sse / (n - 1)
  den <- msr + mse + 2 * (msc - mse) / n
  icc <- if (den != 0) (msr - mse) / den else NA_real_
  structure(list(
    metric = as.character(metric), n = n, icc_a1 = icc, lin_ccc = ccc,
    bland_altman_bias = bias,
    bland_altman_loa95 = c(lower = bias - 1.96 * sd_d, upper = bias + 1.96 * sd_d),
    mean_paired_difference = bias,
    reference = list(source = reference_source, site = reference_site),
    candidate = list(source = candidate_source, site = candidate_site),
    interpretation = "Agreement applies to this derived metric and acquisition configuration; it does not establish global ECG/PPG interchangeability."
  ), class = "gazepoint_hrv_prv_agreement")
}

#' Retention-first SCR responsivity sensitivity
#'
#' Preserves the conventional threshold/non-responder flag but estimates a
#' Beta-Binomial posterior response probability and retains low-reactive
#' participants for model-based sensitivity analyses.
#'
#' @param participant Participant identifiers.
#' @param amplitude Trial-level SCR amplitudes.
#' @param threshold Conventional response threshold in microsiemens.
#' @param prior_alpha,prior_beta Beta prior parameters.
#' @return A data frame with conventional and posterior responsivity summaries.
#' @export
scr_responsivity_sensitivity <- function(participant, amplitude, threshold = 0.02,
                                         prior_alpha = 1, prior_beta = 1) {
  if (length(participant) != length(amplitude)) stop("Inputs must have equal length.", call. = FALSE)
  dat <- data.frame(participant = participant, amplitude = suppressWarnings(as.numeric(amplitude)), stringsAsFactors = FALSE)
  dat <- dat[is.finite(dat$amplitude), , drop = FALSE]
  split_dat <- split(dat$amplitude, dat$participant, drop = TRUE)
  rows <- lapply(names(split_dat), function(id) {
    vals <- pmax(0, split_dat[[id]]); n <- length(vals); r <- sum(vals >= threshold)
    a <- prior_alpha + r; b <- prior_beta + n - r
    data.frame(participant = id, n_trials = n, responses = r, response_rate = r / n,
      posterior_response_probability = a / (a + b), posterior_alpha = a, posterior_beta = b,
      conventional_nonresponder = stats::median(vals) < threshold,
      retain_for_modeling = TRUE, stringsAsFactors = FALSE)
  })
  do.call(rbind, rows)
}

#' Build a multimodal physiology validation ladder
#'
#' @param acquisition_qc,analytical_qc,construct_check,within_person,held_out_person
#'   Stage statuses: `pass`, `warning`, `fail`, or `not_assessed`.
#' @param claim Claim type. `generalizable` requires held-out-person evidence.
#' @return A structured validation result.
#' @export
physiology_validation_ladder <- function(acquisition_qc = "not_assessed", analytical_qc = "not_assessed",
                                         construct_check = "not_assessed", within_person = "not_assessed",
                                         held_out_person = "not_assessed", claim = "descriptive") {
  stages <- tolower(gsub("-", "_", c(acquisition_qc = acquisition_qc, analytical_qc = analytical_qc,
    construct_check = construct_check, within_person = within_person, held_out_person = held_out_person)))
  valid <- c("pass", "warning", "fail", "not_assessed")
  if (any(!stages %in% valid)) stop("Invalid stage status.", call. = FALSE)
  general <- tolower(gsub("-", "_", claim)) %in% c("generalizable", "generalization", "population", "out_of_person")
  held <- unname(stages["held_out_person"]) == "pass"
  status <- if (any(stages == "fail") || (general && !held)) "not_supported" else if (any(stages %in% c("warning", "not_assessed"))) "qualified" else "supported"
  structure(list(stages = stages, claim = claim, claim_status = status,
    held_out_person_generalization = held,
    interpretation = "Within-person prediction is personalized/calibrated evidence unless held-out-participant validation passes."),
    class = "gazepoint_validation_ladder")
}

.gpb_mst_edges <- function(points) {
  n <- nrow(points); if (n < 2L) return(numeric())
  used <- rep(FALSE, n); used[1] <- TRUE; edges <- numeric(n - 1L)
  for (step in seq_len(n - 1L)) {
    best <- Inf; best_j <- NA_integer_
    for (i in which(used)) for (j in which(!used)) {
      d <- sqrt(sum((points[i, ] - points[j, ])^2))
      if (d < best) { best <- d; best_j <- j }
    }
    edges[step] <- best; used[best_j] <- TRUE
  }
  edges
}

#' Experimental topology-aware PPG morphology features
#'
#' Uses H0 persistence lifetimes, represented by Euclidean minimum-spanning-tree
#' edge lengths over a delay embedding. The output is explicitly a structural
#' waveform descriptor, not a direct physiological surrogate.
#'
#' @param signal Numeric PPG signal.
#' @param delay Embedding delay in samples.
#' @param dimension Embedding dimension.
#' @param max_points Maximum embedded points used by the diagnostic.
#' @return A named list of topology-aware structural summaries.
#' @export
ppg_topology_features <- function(signal, delay = 2L, dimension = 3L, max_points = 300L) {
  x <- suppressWarnings(as.numeric(signal)); x <- x[is.finite(x)]
  delay <- as.integer(delay); dimension <- as.integer(dimension); max_points <- as.integer(max_points)
  if (delay < 1L || dimension < 2L || max_points < 2L) stop("Invalid embedding settings.", call. = FALSE)
  start <- (dimension - 1L) * delay + 1L
  if (length(x) < start + 1L) stop("Signal is too short for requested embedding.", call. = FALSE)
  idx <- start:length(x)
  points <- t(vapply(idx, function(i) x[i - (0:(dimension - 1L)) * delay], numeric(dimension)))
  if (nrow(points) > max_points) points <- points[unique(round(seq(1, nrow(points), length.out = max_points))), , drop = FALSE]
  edges <- .gpb_mst_edges(points); total <- sum(edges)
  probs <- if (total > 0) edges[edges > 0] / total else numeric()
  structure(list(
    n_embedding_points = nrow(points), delay = delay, dimension = dimension,
    h0_lifetime_mean = mean(edges), h0_lifetime_sd = stats::sd(edges),
    h0_lifetime_median = stats::median(edges),
    h0_lifetime_q25 = unname(stats::quantile(edges, .25)), h0_lifetime_q75 = unname(stats::quantile(edges, .75)),
    h0_lifetime_max = max(edges), h0_entropy = if (length(probs)) -sum(probs * log(probs)) else 0,
    h0_energy = sum(edges^2), descriptor_status = "experimental_structural_descriptor",
    ml_guardrail = "Use participant-grouped validation for any out-of-person prediction claim."
  ), class = "gazepoint_ppg_topology_features")
}
