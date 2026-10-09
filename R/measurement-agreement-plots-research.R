#' Plot paired association and agreement as distinct figures
#'
#' @param audit Output of audit_gazepoint_measurement_equivalence().
#' @return A named list of two ggplot objects, `association` and
#'   `agreement`. These are descriptive, not equivalence tests.
#' @export
plot_gazepoint_measurement_comparison <- function(audit) {
  if (!is.list(audit) ||
      !is.data.frame(audit$paired_unit_means) ||
      !is.data.frame(audit$agreement)) {
    stop("Supply a measurement-equivalence audit.", call. = FALSE)
  }
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Install optional ggplot2 to plot measurement evidence.", call. = FALSE)
  }
  d <- audit$paired_unit_means
  d$average <- (d$reference + d$candidate) / 2
  d$difference <- d$candidate - d$reference
  a <- ggplot2::ggplot(d, ggplot2::aes(x = reference, y = candidate)) +
    ggplot2::geom_point(alpha = .65) +
    ggplot2::geom_abline(intercept = 0, slope = 1, linetype = 2) +
    ggplot2::labs(
      title = "Association is not interchangeability",
      x = "Reference measurement", y = "Candidate measurement"
    ) + ggplot2::theme_minimal()
  bias <- audit$agreement$candidate_minus_reference_bias[[1L]]
  p <- ggplot2::ggplot(d, ggplot2::aes(x = average, y = difference)) +
    ggplot2::geom_point(alpha = .65) +
    ggplot2::geom_hline(yintercept = bias, linewidth = .6) +
    ggplot2::geom_hline(
      yintercept = c(
        audit$agreement$descriptive_loa_lower[[1L]],
        audit$agreement$descriptive_loa_upper[[1L]]
      ), linetype = 2
    ) +
    ggplot2::labs(
      title = "Descriptive participant-phase agreement",
      subtitle = "Limits are not confidence intervals for repeated measures",
      x = "Paired-measurement average", y = "Candidate minus reference"
    ) + ggplot2::theme_minimal()
  list(association = a, agreement = p)
}
