test_that("HRV/PRV agreement is metric specific", {
  out <- gpbiometrics:::compare_hrv_prv_devices(c(20,30,40,50), c(21,29,42,48), metric = "RMSSD")
  expect_equal(out$metric, "RMSSD")
  expect_true(is.finite(out$lin_ccc))
  expect_length(out$bland_altman_loa95, 2)
})

test_that("SCR nonresponders are retained for sensitivity modelling", {
  out <- gpbiometrics:::scr_responsivity_sensitivity(c("p1","p1","p2","p2"), c(.03,.04,0,0))
  p2 <- out[out$participant == "p2", ]
  expect_true(p2$conventional_nonresponder)
  expect_true(p2$retain_for_modeling)
  expect_true(p2$posterior_response_probability > 0)
})

test_that("generalization requires held-out participants", {
  out <- gpbiometrics:::physiology_validation_ladder("pass","pass","pass","pass","not_assessed", claim="generalizable")
  expect_equal(out$claim_status, "not_supported")
})

test_that("PPG topology stays a structural descriptor", {
  out <- gpbiometrics:::ppg_topology_features(sin(seq(0, 10, length.out = 80)))
  expect_equal(out$descriptor_status, "experimental_structural_descriptor")
  expect_match(out$ml_guardrail, "participant-grouped")
})
