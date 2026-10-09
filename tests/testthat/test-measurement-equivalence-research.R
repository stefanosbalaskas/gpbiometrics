test_that("measurement agreement is not inferred from high association", {
  d <- data.frame(
    participant_id = rep(paste0("p", 1:8), each = 3),
    phase = rep(c("baseline", "perturbation", "recovery"), times = 8),
    nuisance = rep(c("lit", "dark"), each = 12),
    ref = seq_len(24) * .1,
    test = seq_len(24) * .1 + 1.3
  )
  out <- audit_gazepoint_measurement_equivalence(
    d, reference = "ref", candidate = "test", nuisance = "nuisance"
  )
  expect_equal(out$agreement$candidate_minus_reference_bias, 1.3)
  expect_equal(out$agreement$pearson_r, 1)
  expect_equal(nrow(out$nuisance_strata), 2L)
  expect_match(out$limitations, "not agreement or equivalence")
  d$test[1] <- NA_real_
  missing <- audit_gazepoint_measurement_equivalence(
    d, reference = "ref", candidate = "test", nuisance = "nuisance"
  )
  expect_equal(missing$agreement$excluded_nonpaired_rows, 1L)
})

test_that("agreement plots keep comparison types separate", {
  skip_if_not_installed("ggplot2")
  d <- data.frame(
    participant_id = rep(paste0("p", 1:6), each = 2),
    phase = rep(c("baseline", "perturbation"), times = 6),
    ref = seq_len(12),
    test = seq_len(12) + .5
  )
  out <- audit_gazepoint_measurement_equivalence(
    d, reference = "ref", candidate = "test"
  )
  plots <- plot_gazepoint_measurement_comparison(out)
  expect_s3_class(plots$association, "ggplot")
  expect_s3_class(plots$agreement, "ggplot")
  expect_error(plot_gazepoint_measurement_comparison(list()), "audit")
})
