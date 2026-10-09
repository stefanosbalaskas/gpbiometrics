#' Estimation graphics for two-group biometric comparisons
#'
#' Design-aware, original ggplot interpretation of DABEST's Cumming estimation
#' graphics. Raw participant-level observations (or paired slopegraph) and a
#' bootstrap difference are shown in separate free-scale facets.
#' This is not an implementation of DABEST BCa confidence intervals.
#'
#' @param data Data frame with one row per independent unit and condition.
#' @param group Group column name; factor levels set contrast order.
#' @param outcome Numeric measurement column name.
#' @param id Participant identifier column for paired data.
#' @param paired Whether complete pairs are required.
#' @param n_boot Number of participant-level bootstrap replicates, >=99.
#' @param seed Integer random seed, restored after estimation.
#' @return A list with `plot`, `summary`, `draws`, and `limitations`.
#' @export
plot_gazepoint_estimation <- function(
    data, group, outcome, id = NULL, paired = FALSE,
    n_boot = 999L, seed = 2026L) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Install optional ggplot2 for estimation graphics.", call. = FALSE)
  }
  cols <- c(group, outcome, id)
  if (!is.data.frame(data) || !nrow(data) ||
      !is.character(group) || length(group) != 1L ||
      !is.character(outcome) || length(outcome) != 1L ||
      !all(cols %in% names(data))) {
    stop("Supply valid group and outcome column names.", call. = FALSE)
  }
  if (!is.logical(paired) || length(paired) != 1L || is.na(paired) ||
      (paired && (is.null(id) || !id %in% names(data)))) {
    stop("Paired comparison requires a declared participant id.", call. = FALSE)
  }
  if (!is.numeric(n_boot) || length(n_boot) != 1L ||
      !is.finite(n_boot) || n_boot < 99 || n_boot != floor(n_boot) ||
      !is.numeric(seed) || length(seed) != 1L ||
      !is.finite(seed) || seed != floor(seed)) {
    stop("n_boot >= 99 and integer seed are required.", call. = FALSE)
  }
  d <- data.frame(
    condition = as.character(data[[group]]),
    value = data[[outcome]],
    participant_id = if (is.null(id)) as.character(seq_len(nrow(data))) else
      as.character(data[[id]])
  )
  if (!is.numeric(d$value) || anyNA(d) ||
      any(!is.finite(d$value)) ||
      any(!nzchar(d$condition)) ||
      any(!nzchar(d$participant_id))) {
    stop("Complete finite measurements and IDs required.", call. = FALSE)
  }
  levels <- if (is.factor(data[[group]])) {
    levels(droplevels(data[[group]]))
  } else unique(d$condition)
  if (length(levels) != 2L) {
    stop("Exactly two observed conditions required.", call. = FALSE)
  }
  if (any(duplicated(d[c("condition", "participant_id")]))) {
    stop("Aggregate repeated rows to participant-condition observations first.", call. = FALSE)
  }
  ids <- split(d$condition, d$participant_id)
  if (paired) {
    if (length(ids) < 3L ||
        any(!vapply(ids, function(x) setequal(x, levels), logical(1)))) {
      stop("At least three complete participant pairs are required.", call. = FALSE)
    }
    unique_ids <- unique(d$participant_id)
    keys <- paste(d$participant_id, d$condition, sep = "\r")
    x <- d$value[match(paste(unique_ids, levels[1L], sep = "\r"), keys)]
    y <- d$value[match(paste(unique_ids, levels[2L], sep = "\r"), keys)]
  } else {
    if (any(vapply(ids, length, integer(1)) != 1L)) {
      stop("IDs in both groups require paired=TRUE.", call. = FALSE)
    }
    x <- d$value[d$condition == levels[1L]]
    y <- d$value[d$condition == levels[2L]]
    if (length(x) < 3L || length(y) < 3L) {
      stop("At least three independent units per group required.", call. = FALSE)
    }
  }
  old_exists <- exists(".Random.seed", envir = .GlobalEnv, inherits = FALSE)
  if (old_exists) old <- get(".Random.seed", envir = .GlobalEnv)
  on.exit({
    if (old_exists) assign(".Random.seed", old, envir = .GlobalEnv)
    else if (exists(".Random.seed", envir = .GlobalEnv, inherits = FALSE)) {
      rm(".Random.seed", envir = .GlobalEnv)
    }
  }, add = TRUE)
  set.seed(as.integer(seed))
  draws <- replicate(as.integer(n_boot), {
    if (paired) {
      ix <- sample.int(length(x), replace = TRUE)
      mean(y[ix] - x[ix])
    } else {
      mean(sample(y, length(y), replace = TRUE)) -
        mean(sample(x, length(x), replace = TRUE))
    }
  })
  difference <- mean(y) - mean(x)
  limits <- as.numeric(stats::quantile(draws, c(.025, .975), names = FALSE))
  raw <- data.frame(
    panel = "Participant observations",
    condition = factor(d$condition, levels = c(levels, "Difference")),
    value = d$value,
    participant_id = d$participant_id
  )
  boot <- data.frame(
    panel = "Mean-difference uncertainty",
    condition = factor(rep("Difference", length(draws)),
                       levels = levels(raw$condition)),
    value = as.numeric(draws)
  )
  raw$panel <- factor(raw$panel, levels = c(
    "Participant observations", "Mean-difference uncertainty"
  ))
  boot$panel <- factor(boot$panel, levels = levels(raw$panel))
  g <- ggplot2::ggplot() +
    ggplot2::geom_point(
      data = raw, ggplot2::aes(x = condition, y = value),
      position = ggplot2::position_jitter(
        width = if (paired) 0 else .07, height = 0, seed = as.integer(seed)
      ), alpha = .65, size = 1.5
    ) +
    ggplot2::geom_violin(
      data = boot, ggplot2::aes(x = condition, y = value),
      fill = "#81ADB5", alpha = .45, width = .5
    ) +
    ggplot2::geom_pointrange(
      data = data.frame(
        panel = factor("Mean-difference uncertainty", levels = levels(raw$panel)),
        condition = factor("Difference", levels = levels(raw$condition)),
        value = difference, low = limits[1L], high = limits[2L]
      ),
      ggplot2::aes(x = condition, y = value, ymin = low, ymax = high),
      colour = "#245E69"
    ) +
    ggplot2::facet_wrap(~panel, ncol = 1L, scales = "free") +
    ggplot2::labs(
      title = "Participant-level estimation plot",
      subtitle = paste(levels[2L], "minus", levels[1L],
                       "with percentile bootstrap interval"),
      x = NULL, y = outcome
    ) + ggplot2::theme_minimal()
  if (paired) {
    g <- g + ggplot2::geom_line(
      data = raw,
      ggplot2::aes(x = condition, y = value, group = participant_id),
      colour = "#66818A", alpha = .35, linewidth = .4
    )
  }
  list(
    plot = g,
    summary = data.frame(
      comparison = paste(levels[2L], "minus", levels[1L]),
      estimate = difference, lower = limits[1L], upper = limits[2L],
      n_units = if (paired) length(x) else length(x) + length(y),
      paired = paired, interval = "percentile_bootstrap"
    ),
    draws = data.frame(effect = as.numeric(draws)),
    limitations = paste(
      "Independent participant-level units required; paired status explicit.",
      "Bootstrap percentile interval, not DABEST's default BCa interval.",
      "No adjustment, p value, equivalence or causal inference."
    )
  )
}
