test_that("official DABEST adapter requires optional package", {
  if (!requireNamespace("dabestr", quietly = TRUE)) {
    expect_error(plot_gazepoint_dabest(
      data.frame(x = 1:10, y = 1:10), group = "x", outcome = "y"
    ), "optional dabestr")
  } else {
    d <- data.frame(
      subject = rep(seq_len(6), each = 2),
      Condition = rep(c("baseline", "treatment"), 6),
      SCR = rep(seq_len(6), each = 2) + rep(c(0, .3), 6)
    )
    result <- plot_gazepoint_dabest(
      d, group = "Condition", outcome = "SCR",
      id = "subject", paired = TRUE, resamples = 100,
      float_contrast = FALSE
    )
    expect_true(is.list(result))
    expect_false(is.null(result$plot))
    expect_match(result$assumptions, "BCa")
    expect_error(plot_gazepoint_dabest(
      d, "Condition", "SCR", id = "subject", paired = FALSE,
      resamples = 100
    ), "require paired")
  }
})
