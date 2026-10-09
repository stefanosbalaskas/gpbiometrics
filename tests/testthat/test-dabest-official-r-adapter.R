test_that("official DABEST adapter requires optional package", {
  if (!requireNamespace("dabestr", quietly = TRUE)) {
    expect_error(plot_gazepoint_dabest(
      data.frame(x = 1:10, y = 1:10), group = "x", outcome = "y"
    ), "optional dabestr")
  } else {
    d <- data.frame(
      subject = rep(seq_len(12), each = 2),
      Condition = rep(c("baseline", "treatment"), 12),
      SCR = rep(seq_len(12), each = 2) +
        as.vector(rbind(rep(0, 12), c(.10, .40, .25, .80, .30, .70,
                                       .15, .50, .20, .90, .35, .60)))
    )
    result <- plot_gazepoint_dabest(
      d, group = "Condition", outcome = "SCR",
      id = "subject", paired = TRUE, resamples = 500,
      float_contrast = FALSE
    )
    expect_true(is.list(result))
    expect_false(is.null(result$plot))
    expect_match(result$assumptions, "BCa")
    expect_error(plot_gazepoint_dabest(
      d, "Condition", "SCR", id = "subject", paired = FALSE,
      resamples = 500
    ), "require paired")
  }
})
