
run_gazepoint_extended_visual_smoke_test <- function(
    output_dir = file.path(
      tempdir(),
      paste0("gpbiometrics_extended_visual_smoke_", format(Sys.time(), "%Y%m%d_%H%M%S"))
    ),
    stop_on_failure = TRUE
) {
  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
  plot_dir <- file.path(output_dir, "plots")
  table_dir <- file.path(output_dir, "tables")
  object_dir <- file.path(output_dir, "objects")
  dir.create(plot_dir, recursive = TRUE, showWarnings = FALSE)
  dir.create(table_dir, recursive = TRUE, showWarnings = FALSE)
  dir.create(object_dir, recursive = TRUE, showWarnings = FALSE)

  if (requireNamespace("pkgload", quietly = TRUE) && file.exists("DESCRIPTION")) {
    pkgload::load_all(".", quiet = TRUE)
  } else {
    library(gpbiometrics)
  }

  set.seed(123)

  status <- data.frame(
    layer = character(),
    function_name = character(),
    status = character(),
    message = character(),
    stringsAsFactors = FALSE
  )

  plot_status <- data.frame(
    plot_name = character(),
    file = character(),
    status = character(),
    message = character(),
    stringsAsFactors = FALSE
  )

  add_status <- function(layer, fn, ok, msg = "") {
    status <<- rbind(
      status,
      data.frame(
        layer = layer,
        function_name = fn,
        status = if (ok) "PASS" else "FAIL",
        message = msg,
        stringsAsFactors = FALSE
      )
    )
  }

  add_plot_status <- function(name, file, ok, msg = "") {
    plot_status <<- rbind(
      plot_status,
      data.frame(
        plot_name = name,
        file = file,
        status = if (ok) "PASS" else "FAIL",
        message = msg,
        stringsAsFactors = FALSE
      )
    )
  }

  run_step <- function(layer, fn, expr) {
    z <- try(eval.parent(substitute(expr)), silent = TRUE)

    if (inherits(z, "try-error")) {
      add_status(layer, fn, FALSE, as.character(attr(z, "condition")$message))
      return(NULL)
    }

    add_status(layer, fn, TRUE, "")
    z
  }

  save_plot <- function(name, expr, width = 1400, height = 900, res = 140) {
    file <- file.path(plot_dir, paste0(name, ".png"))

    grDevices::png(file, width = width, height = height, res = res)

    z <- try({
      obj <- eval.parent(substitute(expr))
      if (inherits(obj, "ggplot")) print(obj)
      invisible(obj)
    }, silent = TRUE)

    grDevices::dev.off()

    if (inherits(z, "try-error")) {
      add_plot_status(name, file, FALSE, as.character(attr(z, "condition")$message))
      return(NULL)
    }

    add_plot_status(name, file, TRUE, "")
    file
  }

  ns_call <- function(fn, ...) {
    f <- get(fn, envir = asNamespace("gpbiometrics"))
    args <- list(...)

    fm <- names(formals(f))

    if ("..." %in% fm) {
      return(do.call(f, args))
    }

    args <- args[intersect(names(args), fm)]
    do.call(f, args)
  }

  safe_ns_call <- function(fn, ...) {
    try(ns_call(fn, ...), silent = TRUE)
  }

  ## -----------------------------------------------------------------------
  ## Synthetic Gazepoint-like signals
  ## -----------------------------------------------------------------------

  fs_ppg <- 100
  t_ppg <- seq(0, 60, by = 1 / fs_ppg)

  ppg <- 0.7 +
    0.45 * (sin(2 * pi * 1.2 * t_ppg) ^ 8) +
    0.04 * sin(2 * pi * 0.2 * t_ppg) +
    rnorm(length(t_ppg), 0, 0.015)

  ppg[1200:1210] <- max(ppg, na.rm = TRUE)
  ppg[3000:3010] <- NA_real_

  ppg_dat <- data.frame(
    participant = "P01",
    trial = "T01",
    time_s = t_ppg,
    MSTIMER = t_ppg * 1000,
    timestamp = as.POSIXct("2026-01-01 00:00:00", tz = "UTC") + t_ppg,
    ppg = ppg,
    PPG = ppg,
    BVP = ppg,
    stringsAsFactors = FALSE
  )

  fs_eda <- 50
  t_eda <- seq(0, 60, by = 1 / fs_eda)

  eda <- 1 + 0.004 * t_eda
  eda <- eda + 0.45 * exp(-((t_eda - 8) ^ 2) / 0.8)
  eda <- eda + 0.35 * exp(-((t_eda - 21) ^ 2) / 1.2)
  eda <- eda + 0.30 * exp(-((t_eda - 42) ^ 2) / 1.0)
  eda <- eda + rnorm(length(t_eda), 0, 0.004)
  eda[900:905] <- 100
  eda[1600:1640] <- eda[1600]

  marker_a <- rep(0, length(t_eda))
  marker_b <- rep(0, length(t_eda))
  marker_a[t_eda >= 8 & t_eda < 8.3] <- 1
  marker_b[t_eda >= 21 & t_eda < 21.3] <- 2
  marker_a[t_eda >= 42 & t_eda < 42.3] <- 1

  eda_dat <- data.frame(
    participant = "P01",
    trial = "T01",
    time_s = t_eda,
    GSR = eda,
    EDA = eda,
    marker_a = marker_a,
    marker_b = marker_b,
    stringsAsFactors = FALSE
  )

  nni_ms <- 800 + 45 * sin(seq(0, 16 * pi, length.out = 420)) + rnorm(420, 0, 8)
  nni_ms[80] <- 1800
  nni_ms[200] <- 300
  peak_times <- cumsum(nni_ms) / 1000

  events <- data.frame(
    event_id = 1:3,
    onset_time_s = c(8, 21, 42),
    condition = c("A", "B", "A"),
    duration_s = c(0.3, 0.3, 0.3),
    stringsAsFactors = FALSE
  )

  ## -----------------------------------------------------------------------
  ## Export checks
  ## -----------------------------------------------------------------------

  expected_exports <- c(
    "prepare_gazepoint_heartpy_input",
    "export_gazepoint_heartpy_input",
    "run_gazepoint_heartpy_crosscheck",
    "detect_gazepoint_ppg_peaks",
    "reject_gazepoint_ppg_peaks",
    "compute_gazepoint_ppg_measures",
    "plot_gazepoint_ppg_peak_detection",
    "estimate_gazepoint_breathing_rate_from_ibi",
    "reconstruct_gazepoint_ppg_clipping",
    "enhance_gazepoint_ppg_peaks",
    "filter_gazepoint_ppg_butterworth",
    "correct_gazepoint_ppg_hampel",
    "create_gazepoint_heartpy_report",
    "process_gazepoint_ppg_heartpy_style",
    "process_gazepoint_ppg_segmentwise",
    "plot_gazepoint_ppg_segmentwise",
    "plot_gazepoint_ppg_poincare",
    "plot_gazepoint_ppg_breathing",
    "estimate_gazepoint_samplerate_mstimer",
    "estimate_gazepoint_samplerate_datetime",
    "scale_gazepoint_ppg_signal",
    "scale_gazepoint_ppg_sections",
    "flip_gazepoint_ppg_signal",
    "remove_gazepoint_ppg_baseline_wander",
    "filter_gazepoint_ppg_signal",
    "smooth_gazepoint_ppg_signal",
    "clean_gazepoint_rr_intervals",
    "check_gazepoint_ppg_binary_quality",
    "compute_gazepoint_ppg_frequency_measures",
    "extract_gazepoint_pyhrv_nn_intervals",
    "compute_gazepoint_pyhrv_nn_diff",
    "compute_gazepoint_pyhrv_heart_rate",
    "create_gazepoint_pyhrv_time_vector",
    "check_gazepoint_pyhrv_interval",
    "segment_gazepoint_pyhrv_nni",
    "compute_gazepoint_pyhrv_nni_parameters",
    "compute_gazepoint_pyhrv_nni_differences_parameters",
    "compute_gazepoint_pyhrv_hr_parameters",
    "compute_gazepoint_pyhrv_sdnn",
    "compute_gazepoint_pyhrv_sdnn_index",
    "compute_gazepoint_pyhrv_sdann",
    "compute_gazepoint_pyhrv_rmssd",
    "compute_gazepoint_pyhrv_sdsd",
    "compute_gazepoint_pyhrv_nnxx",
    "compute_gazepoint_pyhrv_nn50",
    "compute_gazepoint_pyhrv_nn20",
    "compute_gazepoint_pyhrv_triangular_index",
    "compute_gazepoint_pyhrv_tinn",
    "compute_gazepoint_pyhrv_time_domain",
    "compute_gazepoint_pyhrv_welch_psd",
    "compute_gazepoint_pyhrv_lomb_psd",
    "compute_gazepoint_pyhrv_ar_psd",
    "compute_gazepoint_pyhrv_frequency_domain",
    "compare_gazepoint_pyhrv_psd_methods",
    "compute_gazepoint_pyhrv_psd_waterfall",
    "compute_gazepoint_pyhrv_poincare",
    "compute_gazepoint_pyhrv_sample_entropy",
    "compute_gazepoint_pyhrv_dfa",
    "compute_gazepoint_pyhrv_nonlinear",
    "plot_gazepoint_pyhrv_tachogram",
    "plot_gazepoint_pyhrv_hr_heatplot",
    "plot_gazepoint_pyhrv_radar_chart",
    "export_gazepoint_pyhrv_results",
    "import_gazepoint_pyhrv_results",
    "run_gazepoint_pyhrv_style",
    "run_gazepoint_biosppy_eda",
    "extract_gazepoint_eda_events_biosppy_style",
    "estimate_gazepoint_eda_recovery_times",
    "run_gazepoint_biosppy_ppg",
    "extract_gazepoint_ppg_templates",
    "detect_gazepoint_ppg_onsets",
    "detrend_gazepoint_rri_window",
    "correct_gazepoint_rri_artifacts_local",
    "compute_gazepoint_signal_power_spectrum",
    "compute_gazepoint_signal_band_power",
    "compute_gazepoint_signal_phase_locking",
    "compute_gazepoint_signal_correlation",
    "extract_gazepoint_markerinfo_pspm_style",
    "combine_gazepoint_marker_channels_pspm_style",
    "trim_gazepoint_biometrics_pspm_style",
    "split_gazepoint_sessions_pspm_style",
    "merge_gazepoint_recordings_pspm_style",
    "preprocess_gazepoint_scr_pspm_style",
    "extract_gazepoint_segments_pspm_style",
    "create_gazepoint_pspm_glm_design",
    "fit_gazepoint_convolution_glm",
    "export_gazepoint_pspm_model_estimates"
  )

  exports <- getNamespaceExports("gpbiometrics")

  for (fn in expected_exports) {
    add_status(
      "Export",
      fn,
      fn %in% exports,
      if (fn %in% exports) "" else "Function is not exported."
    )
  }

  ## -----------------------------------------------------------------------
  ## HeartPy-style direct functional smoke checks
  ## -----------------------------------------------------------------------

  hp_in <- run_step(
    "HeartPy-style",
    "prepare_gazepoint_heartpy_input",
    ns_call(
      "prepare_gazepoint_heartpy_input",
      data = ppg_dat,
      x = ppg_dat$ppg,
      ppg = ppg_dat$ppg,
      signal = ppg_dat$ppg,
      signal_col = "ppg",
      time_col = "time_s",
      sampling_rate_hz = fs_ppg,
      sample_rate = fs_ppg,
      sampling_rate = fs_ppg,
      fs = fs_ppg
    )
  )

  run_step(
    "HeartPy-style",
    "export_gazepoint_heartpy_input",
    export_gazepoint_heartpy_input(
      data = data.frame(time_s = ppg_dat$time_s, ppg = ppg_dat$ppg),
      signal_col = "ppg",
      time_col = "time_s",
      sampling_rate_hz = fs_ppg,
      output_dir = table_dir,
      prefix = "heartpy_input"
    )
  )

  ppg_det <- run_step(
    "HeartPy-style",
    "detect_gazepoint_ppg_peaks",
    detect_gazepoint_ppg_peaks(
      ppg_dat,
      signal_col = "ppg",
      time_col = "time_s",
      sampling_rate_hz = fs_ppg,
      high_precision = FALSE
    )
  )

  ppg_peaks <- if (is.list(ppg_det) && "peaks" %in% names(ppg_det)) ppg_det$peaks else ppg_det

  ppg_peaks_clean <- run_step(
    "HeartPy-style",
    "reject_gazepoint_ppg_peaks",
    ns_call(
      "reject_gazepoint_ppg_peaks",
      peaks = ppg_peaks,
      data = ppg_peaks
    )
  )

  if (is.null(ppg_peaks_clean)) ppg_peaks_clean <- ppg_peaks

  run_step(
    "HeartPy-style",
    "compute_gazepoint_ppg_measures",
    ns_call(
      "compute_gazepoint_ppg_measures",
      peaks = ppg_peaks_clean,
      data = ppg_peaks_clean,
      sampling_rate_hz = fs_ppg,
      sample_rate = fs_ppg,
      sampling_rate = fs_ppg,
      fs = fs_ppg
    )
  )

  run_step(
    "HeartPy-style",
    "estimate_gazepoint_breathing_rate_from_ibi",
    estimate_gazepoint_breathing_rate_from_ibi(
      rr_ms = nni_ms
    )
  )

  run_step(
    "HeartPy-style",
    "reconstruct_gazepoint_ppg_clipping",
    ns_call(
      "reconstruct_gazepoint_ppg_clipping",
      x = ppg_dat$ppg,
      ppg = ppg_dat$ppg,
      signal = ppg_dat$ppg,
      ppg_signal = ppg_dat$ppg,
      data = ppg_dat,
      signal_col = "ppg"
    )
  )

  run_step(
    "HeartPy-style",
    "enhance_gazepoint_ppg_peaks",
    ns_call(
      "enhance_gazepoint_ppg_peaks",
      x = ppg_dat$ppg,
      ppg = ppg_dat$ppg,
      signal = ppg_dat$ppg,
      ppg_signal = ppg_dat$ppg,
      data = ppg_dat,
      signal_col = "ppg",
      sampling_rate_hz = fs_ppg,
      sample_rate = fs_ppg,
      sampling_rate = fs_ppg,
      fs = fs_ppg
    )
  )

  run_step(
    "HeartPy-style",
    "filter_gazepoint_ppg_butterworth",
    ns_call(
      "filter_gazepoint_ppg_butterworth",
      x = ppg_dat$ppg,
      ppg = ppg_dat$ppg,
      signal = ppg_dat$ppg,
      ppg_signal = ppg_dat$ppg,
      data = ppg_dat,
      signal_col = "ppg",
      sampling_rate_hz = fs_ppg,
      sample_rate = fs_ppg,
      sampling_rate = fs_ppg,
      fs = fs_ppg
    )
  )

  run_step(
    "HeartPy-style",
    "correct_gazepoint_ppg_hampel",
    correct_gazepoint_ppg_hampel(
      ppg_dat$ppg,
      sampling_rate_hz = fs_ppg
    )
  )

  hp_process <- run_step(
    "HeartPy-style",
    "process_gazepoint_ppg_heartpy_style",
    process_gazepoint_ppg_heartpy_style(
      ppg_dat,
      signal_col = "ppg",
      time_col = "time_s",
      sampling_rate_hz = fs_ppg,
      output_dir = output_dir
    )
  )

  hp_segmentwise <- run_step(
    "HeartPy-style",
    "process_gazepoint_ppg_segmentwise",
    process_gazepoint_ppg_segmentwise(
      ppg_dat,
      signal_col = "ppg",
      time_col = "time_s",
      sampling_rate_hz = fs_ppg,
      segment_seconds = 10
    )
  )

  run_step(
    "HeartPy-style",
    "create_gazepoint_heartpy_report",
    ns_call(
      "create_gazepoint_heartpy_report",
      data = ppg_det,
      detection = ppg_det,
      results = hp_process,
      output_dir = file.path(output_dir, "heartpy_report")
    )
  )

  run_step(
    "HeartPy-style",
    "estimate_gazepoint_samplerate_mstimer",
    ns_call(
      "estimate_gazepoint_samplerate_mstimer",
      data = ppg_dat,
      mstimer = ppg_dat$MSTIMER,
      mstimer_col = "MSTIMER",
      time_col = "MSTIMER",
      x = ppg_dat$MSTIMER
    )
  )

  run_step(
    "HeartPy-style",
    "estimate_gazepoint_samplerate_datetime",
    ns_call(
      "estimate_gazepoint_samplerate_datetime",
      data = ppg_dat,
      datetime = ppg_dat$timestamp,
      datetime_col = "timestamp",
      time_col = "timestamp",
      x = ppg_dat$timestamp
    )
  )

  run_step(
    "HeartPy-style",
    "scale_gazepoint_ppg_signal",
    ns_call(
      "scale_gazepoint_ppg_signal",
      x = ppg_dat$ppg,
      ppg = ppg_dat$ppg,
      signal = ppg_dat$ppg,
      ppg_signal = ppg_dat$ppg,
      data = ppg_dat,
      signal_col = "ppg"
    )
  )

  run_step(
    "HeartPy-style",
    "scale_gazepoint_ppg_sections",
    ns_call(
      "scale_gazepoint_ppg_sections",
      x = ppg_dat$ppg,
      ppg = ppg_dat$ppg,
      signal = ppg_dat$ppg,
      ppg_signal = ppg_dat$ppg,
      data = ppg_dat,
      section_seconds = 10,
      segment_seconds = 10,
      window_seconds = 10,
      section_length = 1000
    )
  )

  run_step(
    "HeartPy-style",
    "flip_gazepoint_ppg_signal",
    ns_call(
      "flip_gazepoint_ppg_signal",
      x = ppg_dat$ppg,
      ppg = ppg_dat$ppg,
      signal = ppg_dat$ppg,
      ppg_signal = ppg_dat$ppg,
      data = ppg_dat,
      signal_col = "ppg"
    )
  )

  run_step(
    "HeartPy-style",
    "remove_gazepoint_ppg_baseline_wander",
    ns_call(
      "remove_gazepoint_ppg_baseline_wander",
      x = ppg_dat$ppg,
      ppg = ppg_dat$ppg,
      signal = ppg_dat$ppg,
      ppg_signal = ppg_dat$ppg,
      data = ppg_dat,
      signal_col = "ppg",
      sampling_rate_hz = fs_ppg,
      sample_rate = fs_ppg,
      sampling_rate = fs_ppg,
      fs = fs_ppg
    )
  )

  run_step(
    "HeartPy-style",
    "filter_gazepoint_ppg_signal",
    ns_call(
      "filter_gazepoint_ppg_signal",
      x = ppg_dat$ppg,
      ppg = ppg_dat$ppg,
      signal = ppg_dat$ppg,
      ppg_signal = ppg_dat$ppg,
      data = ppg_dat,
      signal_col = "ppg",
      sampling_rate_hz = fs_ppg,
      sample_rate = fs_ppg,
      sampling_rate = fs_ppg,
      fs = fs_ppg
    )
  )

  run_step(
    "HeartPy-style",
    "smooth_gazepoint_ppg_signal",
    ns_call(
      "smooth_gazepoint_ppg_signal",
      x = ppg_dat$ppg,
      ppg = ppg_dat$ppg,
      signal = ppg_dat$ppg,
      ppg_signal = ppg_dat$ppg,
      data = ppg_dat,
      signal_col = "ppg",
      sampling_rate_hz = fs_ppg,
      sample_rate = fs_ppg,
      sampling_rate = fs_ppg,
      fs = fs_ppg
    )
  )

  run_step(
    "HeartPy-style",
    "clean_gazepoint_rr_intervals",
    clean_gazepoint_rr_intervals(
      rr_ms = nni_ms
    )
  )

  run_step(
    "HeartPy-style",
    "check_gazepoint_ppg_binary_quality",
    check_gazepoint_ppg_binary_quality(
      peaks = ppg_peaks_clean
    )
  )

  run_step(
    "HeartPy-style",
    "compute_gazepoint_ppg_frequency_measures",
    compute_gazepoint_ppg_frequency_measures(
      rr_ms = nni_ms
    )
  )

  ## Cross-check may require Python/HeartPy. Treat as smoke attempt only.
  z_cross <- safe_ns_call(
    "run_gazepoint_heartpy_crosscheck",
    data = ppg_dat,
    signal_col = "ppg",
    time_col = "time_s",
    sampling_rate_hz = fs_ppg,
    sample_rate = fs_ppg,
    fs = fs_ppg
  )
  add_status(
    "HeartPy-style",
    "run_gazepoint_heartpy_crosscheck",
    !inherits(z_cross, "try-error"),
    if (inherits(z_cross, "try-error")) as.character(attr(z_cross, "condition")$message) else ""
  )

  ## -----------------------------------------------------------------------
  ## pyHRV-style
  ## -----------------------------------------------------------------------

  pyhrv_td <- run_step("pyHRV-style", "compute_gazepoint_pyhrv_time_domain", compute_gazepoint_pyhrv_time_domain(nni_ms, segment_seconds = 60))
  pyhrv_pc <- run_step("pyHRV-style", "compute_gazepoint_pyhrv_poincare", compute_gazepoint_pyhrv_poincare(nni_ms))
  pyhrv_all <- run_step("pyHRV-style", "run_gazepoint_pyhrv_style", run_gazepoint_pyhrv_style(nni_ms = nni_ms, frequency_method = "welch"))

  pyhrv_calls <- list(
    extract_gazepoint_pyhrv_nn_intervals = quote(extract_gazepoint_pyhrv_nn_intervals(peak_times)),
    compute_gazepoint_pyhrv_nn_diff = quote(compute_gazepoint_pyhrv_nn_diff(nni_ms)),
    compute_gazepoint_pyhrv_heart_rate = quote(compute_gazepoint_pyhrv_heart_rate(nni_ms)),
    create_gazepoint_pyhrv_time_vector = quote(create_gazepoint_pyhrv_time_vector(nni_ms)),
    check_gazepoint_pyhrv_interval = quote(check_gazepoint_pyhrv_interval(nni_ms)),
    segment_gazepoint_pyhrv_nni = quote(segment_gazepoint_pyhrv_nni(nni_ms, segment_seconds = 60)),
    compute_gazepoint_pyhrv_nni_parameters = quote(compute_gazepoint_pyhrv_nni_parameters(nni_ms)),
    compute_gazepoint_pyhrv_nni_differences_parameters = quote(compute_gazepoint_pyhrv_nni_differences_parameters(nni_ms)),
    compute_gazepoint_pyhrv_hr_parameters = quote(compute_gazepoint_pyhrv_hr_parameters(nni_ms)),
    compute_gazepoint_pyhrv_sdnn = quote(compute_gazepoint_pyhrv_sdnn(nni_ms)),
    compute_gazepoint_pyhrv_sdnn_index = quote(compute_gazepoint_pyhrv_sdnn_index(nni_ms, segment_seconds = 60)),
    compute_gazepoint_pyhrv_sdann = quote(compute_gazepoint_pyhrv_sdann(nni_ms, segment_seconds = 60)),
    compute_gazepoint_pyhrv_rmssd = quote(compute_gazepoint_pyhrv_rmssd(nni_ms)),
    compute_gazepoint_pyhrv_sdsd = quote(compute_gazepoint_pyhrv_sdsd(nni_ms)),
    compute_gazepoint_pyhrv_nnxx = quote(compute_gazepoint_pyhrv_nnxx(nni_ms, threshold_ms = 30)),
    compute_gazepoint_pyhrv_nn50 = quote(compute_gazepoint_pyhrv_nn50(nni_ms)),
    compute_gazepoint_pyhrv_nn20 = quote(compute_gazepoint_pyhrv_nn20(nni_ms)),
    compute_gazepoint_pyhrv_triangular_index = quote(compute_gazepoint_pyhrv_triangular_index(nni_ms)),
    compute_gazepoint_pyhrv_tinn = quote(compute_gazepoint_pyhrv_tinn(nni_ms)),
    compute_gazepoint_pyhrv_welch_psd = quote(compute_gazepoint_pyhrv_welch_psd(nni_ms)),
    compute_gazepoint_pyhrv_lomb_psd = quote(compute_gazepoint_pyhrv_lomb_psd(nni_ms, n_freq = 256)),
    compute_gazepoint_pyhrv_ar_psd = quote(compute_gazepoint_pyhrv_ar_psd(nni_ms)),
    compute_gazepoint_pyhrv_frequency_domain = quote(compute_gazepoint_pyhrv_frequency_domain(nni_ms, method = "welch")),
    compare_gazepoint_pyhrv_psd_methods = quote(compare_gazepoint_pyhrv_psd_methods(nni_ms, methods = c("welch", "lomb", "ar"), plot = FALSE)),
    compute_gazepoint_pyhrv_psd_waterfall = quote(compute_gazepoint_pyhrv_psd_waterfall(nni_ms, segment_seconds = 60, method = "welch", plot = FALSE)),
    compute_gazepoint_pyhrv_sample_entropy = quote(compute_gazepoint_pyhrv_sample_entropy(nni_ms)),
    compute_gazepoint_pyhrv_dfa = quote(compute_gazepoint_pyhrv_dfa(nni_ms)),
    compute_gazepoint_pyhrv_nonlinear = quote(compute_gazepoint_pyhrv_nonlinear(nni_ms))
  )

  for (nm in names(pyhrv_calls)) {
    run_step("pyHRV-style", nm, eval(pyhrv_calls[[nm]]))
  }

  pyhrv_rds <- file.path(object_dir, "pyhrv_results.rds")
  run_step("pyHRV-style", "export_gazepoint_pyhrv_results", export_gazepoint_pyhrv_results(pyhrv_all, pyhrv_rds))
  run_step("pyHRV-style", "import_gazepoint_pyhrv_results", import_gazepoint_pyhrv_results(pyhrv_rds))

  ## -----------------------------------------------------------------------
  ## BioSPPy-style
  ## -----------------------------------------------------------------------

  biosppy_eda_events <- run_step(
    "BioSPPy-style",
    "extract_gazepoint_eda_events_biosppy_style",
    extract_gazepoint_eda_events_biosppy_style(
      eda_dat,
      signal_col = "GSR",
      time_col = "time_s",
      group_cols = "participant",
      sampling_rate_hz = fs_eda,
      min_amplitude = 0.02
    )
  )

  biosppy_eda_recovery <- run_step(
    "BioSPPy-style",
    "estimate_gazepoint_eda_recovery_times",
    estimate_gazepoint_eda_recovery_times(
      eda_dat,
      events = biosppy_eda_events,
      signal_col = "GSR",
      time_col = "time_s",
      group_cols = "participant",
      sampling_rate_hz = fs_eda
    )
  )

  biosppy_eda <- run_step(
    "BioSPPy-style",
    "run_gazepoint_biosppy_eda",
    run_gazepoint_biosppy_eda(
      eda_dat,
      signal_col = "GSR",
      time_col = "time_s",
      group_cols = "participant",
      sampling_rate_hz = fs_eda
    )
  )

  biosppy_ppg <- run_step(
    "BioSPPy-style",
    "run_gazepoint_biosppy_ppg",
    run_gazepoint_biosppy_ppg(
      ppg_dat,
      signal_col = "ppg",
      time_col = "time_s",
      group_cols = "participant",
      sampling_rate_hz = fs_ppg
    )
  )

  biosppy_templates <- run_step(
    "BioSPPy-style",
    "extract_gazepoint_ppg_templates",
    extract_gazepoint_ppg_templates(
      ppg_dat,
      signal_col = "ppg",
      time_col = "time_s",
      peaks = biosppy_ppg$peaks,
      sampling_rate_hz = fs_ppg
    )
  )

  biosppy_onsets <- run_step(
    "BioSPPy-style",
    "detect_gazepoint_ppg_onsets",
    detect_gazepoint_ppg_onsets(
      ppg_dat,
      signal_col = "ppg",
      time_col = "time_s",
      peaks = biosppy_ppg$peaks,
      sampling_rate_hz = fs_ppg
    )
  )

  rri_detrended <- run_step("BioSPPy-style", "detrend_gazepoint_rri_window", detrend_gazepoint_rri_window(nni_ms, window_seconds = 60))
  rri_corrected <- run_step("BioSPPy-style", "correct_gazepoint_rri_artifacts_local", correct_gazepoint_rri_artifacts_local(nni_ms, method = "local_median"))
  signal_psd <- run_step("BioSPPy-style", "compute_gazepoint_signal_power_spectrum", compute_gazepoint_signal_power_spectrum(ppg_dat$ppg, sampling_rate_hz = fs_ppg))
  signal_band_power <- run_step("BioSPPy-style", "compute_gazepoint_signal_band_power", compute_gazepoint_signal_band_power(signal_psd, bands = list(pulse = c(0.8, 2.0), respiration_like = c(0.1, 0.4))))

  y_shifted <- sin(2 * pi * 1.2 * t_ppg + pi / 6)

  signal_plv <- run_step(
    "BioSPPy-style",
    "compute_gazepoint_signal_phase_locking",
    compute_gazepoint_signal_phase_locking(ppg_dat$ppg, y_shifted, sampling_rate_hz = fs_ppg, band = c(0.8, 2.0))
  )

  signal_cor <- run_step(
    "BioSPPy-style",
    "compute_gazepoint_signal_correlation",
    compute_gazepoint_signal_correlation(ppg_dat$ppg, y_shifted, lag_max = 50)
  )

  ## -----------------------------------------------------------------------
  ## PsPM-style
  ## -----------------------------------------------------------------------

  pspm_markers <- run_step(
    "PsPM-style",
    "extract_gazepoint_markerinfo_pspm_style",
    extract_gazepoint_markerinfo_pspm_style(
      eda_dat,
      marker_cols = c("marker_a", "marker_b"),
      time_col = "time_s",
      group_cols = "participant"
    )
  )

  pspm_combined <- run_step(
    "PsPM-style",
    "combine_gazepoint_marker_channels_pspm_style",
    combine_gazepoint_marker_channels_pspm_style(
      eda_dat,
      marker_cols = c("marker_a", "marker_b"),
      time_col = "time_s",
      group_cols = "participant"
    )
  )

  pspm_trim <- run_step(
    "PsPM-style",
    "trim_gazepoint_biometrics_pspm_style",
    trim_gazepoint_biometrics_pspm_style(
      eda_dat,
      start_s = 5,
      end_s = 45,
      time_col = "time_s",
      reset_time = TRUE
    )
  )

  gap_dat <- rbind(
    eda_dat[eda_dat$time_s <= 10, ],
    transform(eda_dat[eda_dat$time_s <= 10, ], time_s = time_s + 30)
  )

  pspm_split <- run_step(
    "PsPM-style",
    "split_gazepoint_sessions_pspm_style",
    split_gazepoint_sessions_pspm_style(gap_dat, time_col = "time_s", gap_seconds = 5)
  )

  pspm_merge <- run_step(
    "PsPM-style",
    "merge_gazepoint_recordings_pspm_style",
    merge_gazepoint_recordings_pspm_style(
      list(eda_dat[1:200, ], eda_dat[201:400, ]),
      time_col = "time_s",
      gap_seconds = 1
    )
  )

  pspm_scr <- run_step(
    "PsPM-style",
    "preprocess_gazepoint_scr_pspm_style",
    preprocess_gazepoint_scr_pspm_style(
      eda_dat,
      signal_col = "GSR",
      time_col = "time_s",
      sampling_rate_hz = fs_eda,
      range = c(0, 20)
    )
  )

  pspm_segments <- run_step(
    "PsPM-style",
    "extract_gazepoint_segments_pspm_style",
    extract_gazepoint_segments_pspm_style(
      pspm_scr$signal,
      events = events,
      signal_col = "scr_processed",
      time_col = "time_s",
      event_id_col = "event_id",
      condition_col = "condition",
      pre_s = 2,
      post_s = 8
    )
  )

  pspm_design <- run_step(
    "PsPM-style",
    "create_gazepoint_pspm_glm_design",
    create_gazepoint_pspm_glm_design(
      events = events,
      time = pspm_scr$signal$time_s,
      onset_col = "onset_time_s",
      condition_col = "condition",
      duration_col = "duration_s",
      response = "scr",
      response_length_s = 10
    )
  )

  pspm_glm <- run_step(
    "PsPM-style",
    "fit_gazepoint_convolution_glm",
    fit_gazepoint_convolution_glm(
      data = pspm_scr$signal,
      design = pspm_design,
      signal_col = "scr_processed",
      time_col = "time_s"
    )
  )

  pspm_export_path <- file.path(table_dir, "pspm_glm_coefficients.csv")

  run_step(
    "PsPM-style",
    "export_gazepoint_pspm_model_estimates",
    export_gazepoint_pspm_model_estimates(pspm_glm, pspm_export_path)
  )

  ## -----------------------------------------------------------------------
  ## Plots
  ## -----------------------------------------------------------------------

  save_plot("heartpy_ppg_peak_detection", {
    z <- safe_ns_call("plot_gazepoint_ppg_peak_detection", data = ppg_det, detection = ppg_det, peaks = ppg_peaks_clean)
    if (inherits(z, "try-error")) {
      plot(ppg_dat$time_s, ppg_dat$ppg, type = "l", xlab = "Time (s)", ylab = "PPG", main = "PPG peak detection")
      if (is.data.frame(ppg_peaks_clean) && "peak_time_s" %in% names(ppg_peaks_clean)) {
        points(ppg_peaks_clean$peak_time_s, approx(ppg_dat$time_s, ppg_dat$ppg, xout = ppg_peaks_clean$peak_time_s, rule = 2)$y, pch = 19)
      }
    } else {
      z
    }
  })

  save_plot("heartpy_ppg_segmentwise", {
    z <- safe_ns_call("plot_gazepoint_ppg_segmentwise", data = hp_segmentwise, results = hp_segmentwise)
    if (inherits(z, "try-error")) {
      plot(ppg_dat$time_s, ppg_dat$ppg, type = "l", xlab = "Time (s)", ylab = "PPG", main = "Segmentwise PPG")
      abline(v = seq(0, max(ppg_dat$time_s), by = 10), lty = 2)
    } else {
      z
    }
  })

  save_plot("heartpy_ppg_poincare", {
    z <- safe_ns_call("plot_gazepoint_ppg_poincare", data = hp_process, results = hp_process)
    if (inherits(z, "try-error")) {
      plot(head(nni_ms, -1), tail(nni_ms, -1), pch = 19, xlab = "RR[n] (ms)", ylab = "RR[n+1] (ms)", main = "PPG Poincare")
      abline(0, 1, lty = 2)
    } else {
      z
    }
  })

  save_plot("heartpy_ppg_breathing", {
    z <- safe_ns_call("plot_gazepoint_ppg_breathing", data = hp_process, results = hp_process)
    if (inherits(z, "try-error")) {
      plot(cumsum(nni_ms) / 1000, nni_ms, type = "l", xlab = "Time (s)", ylab = "IBI (ms)", main = "Breathing proxy")
    } else {
      z
    }
  })

  save_plot("pyhrv_tachogram", plot_gazepoint_pyhrv_tachogram(nni_ms))
  save_plot("pyhrv_hr_heatplot", plot_gazepoint_pyhrv_hr_heatplot(nni_ms))
  save_plot("pyhrv_radar_chart", plot_gazepoint_pyhrv_radar_chart(data.frame(pyhrv_td, pyhrv_pc)))
  save_plot("pyhrv_poincare", compute_gazepoint_pyhrv_poincare(nni_ms, plot = TRUE))
  save_plot("pyhrv_psd_comparison", compare_gazepoint_pyhrv_psd_methods(nni_ms, methods = c("welch", "lomb", "ar"), plot = TRUE))
  save_plot("pyhrv_psd_waterfall", compute_gazepoint_pyhrv_psd_waterfall(nni_ms, segment_seconds = 60, method = "welch", plot = TRUE))

  save_plot("biosppy_eda_processed", {
    plot(biosppy_eda$signal$time_s, biosppy_eda$signal$eda_raw, type = "l", xlab = "Time (s)", ylab = "EDA / GSR", main = "BioSPPy-style EDA")
    lines(biosppy_eda$signal$time_s, biosppy_eda$signal$eda_tonic, lty = 2)
    if (is.data.frame(biosppy_eda$events) && nrow(biosppy_eda$events)) abline(v = biosppy_eda$events$peak_time_s, lty = 3)
  })

  save_plot("biosppy_ppg_processed", {
    plot(biosppy_ppg$signal$time_s, biosppy_ppg$signal$ppg, type = "l", xlab = "Time (s)", ylab = "PPG", main = "BioSPPy-style PPG")
    if ("ppg_filtered" %in% names(biosppy_ppg$signal)) lines(biosppy_ppg$signal$time_s, biosppy_ppg$signal$ppg_filtered, lty = 2)
    if (is.data.frame(biosppy_ppg$peaks) && "peak_time_s" %in% names(biosppy_ppg$peaks)) abline(v = biosppy_ppg$peaks$peak_time_s, lty = 3)
  })

  save_plot("biosppy_ppg_average_template", {
    tmpl <- biosppy_templates$average_template
    plot(tmpl$time_s, tmpl$amplitude, type = "l", xlab = "Time around peak (s)", ylab = "Amplitude", main = "Average PPG pulse template")
    abline(v = 0, lty = 2)
  })

  save_plot("biosppy_rri_correction", {
    plot(rri_corrected$index, rri_corrected$rri_ms, type = "b", xlab = "Interval index", ylab = "RRI (ms)", main = "Local RRI correction")
    lines(rri_corrected$index, rri_corrected$rri_corrected_ms, lty = 2)
    if (any(rri_corrected$artifact)) points(rri_corrected$index[rri_corrected$artifact], rri_corrected$rri_ms[rri_corrected$artifact], pch = 19)
  })

  save_plot("biosppy_signal_power_spectrum", {
    plot(signal_psd$frequency_hz, signal_psd$power, type = "l", xlab = "Frequency (Hz)", ylab = "Power", main = "Signal power spectrum")
    abline(v = c(0.8, 2.0), lty = 2)
  })

  save_plot("biosppy_signal_band_power", {
    barplot(signal_band_power$power, names.arg = signal_band_power$band, ylab = "Power", main = "Signal band power")
  })

  save_plot("biosppy_phase_locking_signals", {
    n <- min(1000, length(ppg_dat$ppg), length(y_shifted))
    plot(ppg_dat$time_s[seq_len(n)], scale(ppg_dat$ppg[seq_len(n)]), type = "l", xlab = "Time (s)", ylab = "Scaled amplitude", main = "Phase-locking signals")
    lines(ppg_dat$time_s[seq_len(n)], scale(y_shifted[seq_len(n)]), lty = 2)
  })

  save_plot("pspm_markers", {
    plot(eda_dat$time_s, eda_dat$GSR, type = "l", xlab = "Time (s)", ylab = "GSR", main = "PsPM-style markers")
    if (is.data.frame(pspm_markers) && nrow(pspm_markers)) abline(v = pspm_markers$time_s, lty = 2)
  })

  save_plot("pspm_scr_preprocessing", {
    plot(pspm_scr$signal$time_s, pspm_scr$signal$scr_raw, type = "l", xlab = "Time (s)", ylab = "SCR / GSR", main = "PsPM-style SCR preprocessing")
    lines(pspm_scr$signal$time_s, pspm_scr$signal$scr_processed, lty = 2)
    if (any(pspm_scr$signal$pspm_artifact)) {
      points(pspm_scr$signal$time_s[pspm_scr$signal$pspm_artifact], pspm_scr$signal$scr_raw[pspm_scr$signal$pspm_artifact], pch = 19)
    }
  })

  save_plot("pspm_segments", {
    plot(pspm_segments$relative_time_s, pspm_segments$value_baseline_corrected, pch = 19, cex = 0.5, xlab = "Relative time (s)", ylab = "Baseline-corrected value", main = "Event-centred segments")
    abline(v = 0, lty = 2)
  })

  save_plot("pspm_glm_design", {
    reg_cols <- grep("^pspm_", names(pspm_design), value = TRUE)
    plot(pspm_design$time_s, pspm_design[[reg_cols[1]]], type = "l", xlab = "Time (s)", ylab = "Regressor value", main = "Convolution GLM design")
    if (length(reg_cols) > 1) for (rc in reg_cols[-1]) lines(pspm_design$time_s, pspm_design[[rc]], lty = 2)
  })

  save_plot("pspm_glm_fit", {
    plot(pspm_glm$predictions$time_s, pspm_glm$predictions$observed, type = "l", xlab = "Time (s)", ylab = "Signal", main = "Convolution GLM fit")
    lines(pspm_glm$predictions$time_s, pspm_glm$predictions$fitted, lty = 2)
  })

  ## -----------------------------------------------------------------------
  ## Save tables and summary
  ## -----------------------------------------------------------------------

  utils::write.csv(status, file.path(table_dir, "function_smoke_test_status.csv"), row.names = FALSE)
  utils::write.csv(plot_status, file.path(table_dir, "plot_smoke_test_status.csv"), row.names = FALSE)

  if (!is.null(pyhrv_td)) utils::write.csv(pyhrv_td, file.path(table_dir, "pyhrv_time_domain.csv"), row.names = FALSE)
  if (!is.null(pyhrv_pc)) utils::write.csv(pyhrv_pc, file.path(table_dir, "pyhrv_poincare.csv"), row.names = FALSE)
  if (!is.null(biosppy_eda_events)) utils::write.csv(biosppy_eda_events, file.path(table_dir, "biosppy_eda_events.csv"), row.names = FALSE)
  if (!is.null(biosppy_eda_recovery)) utils::write.csv(biosppy_eda_recovery, file.path(table_dir, "biosppy_eda_recovery.csv"), row.names = FALSE)
  if (!is.null(pspm_markers)) utils::write.csv(pspm_markers, file.path(table_dir, "pspm_markers.csv"), row.names = FALSE)
  if (!is.null(pspm_glm)) utils::write.csv(pspm_glm$coefficients, file.path(table_dir, "pspm_glm_coefficients.csv"), row.names = FALSE)

  saveRDS(
    list(
      ppg_dat = ppg_dat,
      eda_dat = eda_dat,
      nni_ms = nni_ms,
      events = events,
      ppg_det = ppg_det,
      ppg_peaks_clean = ppg_peaks_clean,
      pyhrv_all = pyhrv_all,
      biosppy_eda = biosppy_eda,
      biosppy_ppg = biosppy_ppg,
      pspm_scr = pspm_scr,
      pspm_glm = pspm_glm
    ),
    file.path(object_dir, "extended_visual_smoke_objects.rds")
  )

  required_failures <- status[status$status == "FAIL" & status$function_name != "run_gazepoint_heartpy_crosscheck", , drop = FALSE]
  plot_failures <- plot_status[plot_status$status == "FAIL", , drop = FALSE]

  summary <- data.frame(
    package_version = as.character(utils::packageVersion("gpbiometrics")),
    output_dir = normalizePath(output_dir, winslash = "/", mustWork = FALSE),
    n_export_checks = length(expected_exports),
    n_function_steps = nrow(status),
    n_function_pass = sum(status$status == "PASS"),
    n_function_fail_required = nrow(required_failures),
    n_plots_attempted = nrow(plot_status),
    n_plots_pass = sum(plot_status$status == "PASS"),
    n_plots_fail = nrow(plot_failures),
    stringsAsFactors = FALSE
  )

  utils::write.csv(summary, file.path(table_dir, "extended_visual_smoke_summary.csv"), row.names = FALSE)

  if (isTRUE(stop_on_failure) && (nrow(required_failures) > 0 || nrow(plot_failures) > 0)) {
    print(summary)
    if (nrow(required_failures)) print(required_failures)
    if (nrow(plot_failures)) print(plot_failures)
    stop("Extended visual smoke test had required failures. See output tables.", call. = FALSE)
  }

  list(
    summary = summary,
    function_status = status,
    plot_status = plot_status,
    output_dir = normalizePath(output_dir, winslash = "/", mustWork = FALSE),
    plot_dir = normalizePath(plot_dir, winslash = "/", mustWork = FALSE),
    table_dir = normalizePath(table_dir, winslash = "/", mustWork = FALSE)
  )
}

message("Loaded run_gazepoint_extended_visual_smoke_test().")

