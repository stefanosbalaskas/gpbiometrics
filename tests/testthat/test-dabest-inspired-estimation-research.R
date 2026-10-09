test_that("estimation plot preserves independent units and paired resampling", {
  skip_if_not_installed("ggplot2")
  d <- data.frame(
    id = rep(seq_len(8L), each = 2L),
    condition = rep(c("before", "after"), 8L),
    gsr = rep(seq_len(8L), each = 2L) + rep(c(0, .5), 8L)
  )
  ans <- plot_gazepoint_estimation(d, "condition", "gsr", id = "id",
                                   paired = TRUE, n_boot = 99, seed = 101)
  expect_s3_class(ans$plot, "ggplot")
  expect_equal(ans$summary$estimate, .5)
  expect_equal(nrow(ans$draws), 99L)
  expect_equal(ans$summary$n_units, 8L)
  expect_error(plot_gazepoint_estimation(
    d, "condition", "gsr", id = "id", paired = FALSE, n_boot = 99
  ), "Shared IDs|require paired")
  d <- rbind(d, d[1L, ])
  expect_error(plot_gazepoint_estimation(
    d, "condition", "gsr", id = "id", paired = TRUE, n_boot = 99
  ), "Aggregate")
})

test_that("unpaired intervals are seeded and do not disturb the RNG", {
  skip_if_not_installed("ggplot2")
  d <- data.frame(
    condition = rep(c("active", "passive"), each = 9L),
    gsr = c(seq_len(9L), seq_len(9L) + 1)
  )
  set.seed(88)
  previous <- .Random.seed
  a <- plot_gazepoint_estimation(d, "condition", "gsr", n_boot = 99)
  expect_identical(.Random.seed, previous)
  b <- plot_gazepoint_estimation(d, "condition", "gsr", n_boot = 99)
  expect_equal(a$draws, b$draws)
  expect_equal(a$summary$estimate, 1)
  expect_error(plot_gazepoint_estimation(
    d, "condition", "gsr", n_boot = 10
  ), "n_boot")
})
