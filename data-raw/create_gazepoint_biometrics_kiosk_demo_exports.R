# Synthetic Gazepoint Biometrics kiosk demo exports
# Public-safe synthetic dataset for gpbiometrics examples, vignettes, and paper showcase.
# The data are fully artificial and are not derived from real participants.

set.seed(20260624)

output_dir <- file.path(
  "inst",
  "extdata",
  "gazepoint_biometrics_kiosk_demo_exports"
)

dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

old_files <- list.files(output_dir, full.names = TRUE)
if (length(old_files) > 0) {
  unlink(old_files, recursive = TRUE, force = TRUE)
}

n_participants <- 36
sampling_rate <- 60
task_seconds <- 8
samples_per_task <- task_seconds * sampling_rate

conditions <- expand.grid(
  interface_complexity = c("simple", "dense"),
  feedback_clarity = c("clear", "ambiguous"),
  stringsAsFactors = FALSE
)

aoi_centres <- data.frame(
  AOI = c(
    "instruction_panel",
    "task_form",
    "feedback_message",
    "error_message",
    "help_panel",
    "confirmation_button",
    "progress_indicator"
  ),
  x = c(0.25, 0.50, 0.50, 0.50, 0.78, 0.72, 0.18),
  y = c(0.18, 0.48, 0.30, 0.30, 0.50, 0.78, 0.82),
  stringsAsFactors = FALSE
)

clip <- function(x, lower, upper) {
  pmin(pmax(x, lower), upper)
}

scr_kernel <- function(time, onset, amplitude, tau_slow = 3.0, tau_fast = 0.7) {
  dt <- pmax(0, time - onset)
  response <- exp(-dt / tau_slow) - exp(-dt / tau_fast)
  response[response < 0] <- 0

  if (max(response) > 0) {
    response <- response / max(response)
  }

  amplitude * response
}

gaussian_bump <- function(time, centre, amplitude, width = 0.55) {
  amplitude * exp(-0.5 * ((time - centre) / width)^2)
}

sample_aoi <- function(phase, complexity, clarity) {
  if (phase == "instruction") {
    return(sample(
      c("instruction_panel", "progress_indicator", "task_form"),
      size = 1,
      prob = c(0.70, 0.15, 0.15)
    ))
  }

  if (phase == "form") {
    if (complexity == "dense") {
      return(sample(
        c("task_form", "help_panel", "progress_indicator"),
        size = 1,
        prob = c(0.68, 0.22, 0.10)
      ))
    }

    return(sample(
      c("task_form", "confirmation_button", "progress_indicator"),
      size = 1,
      prob = c(0.78, 0.12, 0.10)
    ))
  }

  if (phase == "feedback") {
    if (clarity == "ambiguous") {
      return(sample(
        c("feedback_message", "error_message", "help_panel", "task_form"),
        size = 1,
        prob = c(0.35, 0.30, 0.25, 0.10)
      ))
    }

    return(sample(
      c("feedback_message", "confirmation_button", "progress_indicator"),
      size = 1,
      prob = c(0.65, 0.25, 0.10)
    ))
  }

  if (phase == "confirmation") {
    if (clarity == "ambiguous") {
      return(sample(
        c("confirmation_button", "help_panel", "error_message", "task_form"),
        size = 1,
        prob = c(0.50, 0.25, 0.15, 0.10)
      ))
    }

    return(sample(
      c("confirmation_button", "progress_indicator", "task_form"),
      size = 1,
      prob = c(0.70, 0.20, 0.10)
    ))
  }

  sample(
    c("confirmation_button", "progress_indicator"),
    size = 1,
    prob = c(0.60, 0.40)
  )
}

simulate_kiosk_task <- function(participant_index,
                                participant_id,
                                task_order,
                                media_id,
                                media_name,
                                interface_complexity,
                                feedback_clarity,
                                participant_baselines) {
  time <- seq(0, by = 1 / sampling_rate, length.out = samples_per_task)
  n <- length(time)

  phase <- ifelse(
    time < 1.2,
    "instruction",
    ifelse(
      time < 4.2,
      "form",
      ifelse(time < 5.3, "feedback", ifelse(time < 7.2, "confirmation", "submit"))
    )
  )

  aoi <- vapply(
    phase,
    sample_aoi,
    character(1),
    complexity = interface_complexity,
    clarity = feedback_clarity
  )

  centres <- aoi_centres[match(aoi, aoi_centres$AOI), ]

  gaze_noise <- ifelse(interface_complexity == "dense", 0.035, 0.025)
  gaze_x <- clip(stats::rnorm(n, centres$x, gaze_noise), 0.02, 0.98)
  gaze_y <- clip(stats::rnorm(n, centres$y, gaze_noise), 0.02, 0.98)

  blink_seed <- stats::runif(n)
  invalid <- blink_seed < 0.015

  if (interface_complexity == "dense") {
    invalid <- invalid | stats::runif(n) < 0.005
  }

  if (feedback_clarity == "ambiguous") {
    invalid <- invalid | (time > 4.2 & time < 5.6 & stats::runif(n) < 0.006)
  }

  valid <- as.integer(!invalid)

  dense_effect <- ifelse(interface_complexity == "dense", 1, 0)
  ambiguous_effect <- ifelse(feedback_clarity == "ambiguous", 1, 0)

  feedback_onset <- 4.25
  confirmation_onset <- 5.45

  pupil_base <- participant_baselines$pupil +
    0.08 * dense_effect +
    0.05 * ambiguous_effect

  pupil_response <- gaussian_bump(time, feedback_onset, 0.08 + 0.05 * ambiguous_effect) +
    gaussian_bump(time, confirmation_onset, 0.04 + 0.03 * dense_effect)

  left_pupil <- pupil_base + pupil_response + stats::rnorm(n, 0, 0.035)
  right_pupil <- pupil_base + pupil_response + stats::rnorm(n, 0, 0.035)

  lpmv <- valid
  rpmv <- valid

  left_pupil[valid == 0] <- 0
  right_pupil[valid == 0] <- 0

  tonic <- participant_baselines$eda +
    0.0007 * time +
    0.035 * dense_effect +
    0.025 * ambiguous_effect

  phasic <- scr_kernel(
    time,
    feedback_onset + 0.7,
    amplitude = 0.09 + 0.05 * ambiguous_effect + 0.02 * dense_effect
  ) +
    scr_kernel(
      time,
      confirmation_onset + 0.5,
      amplitude = 0.045 + 0.025 * ambiguous_effect
    )

  gsr_us <- tonic + phasic + stats::rnorm(n, 0, 0.008)
  gsr_us <- pmax(gsr_us, 0.05)

  gsr_us_tonic <- tonic
  gsr_us_phasic <- phasic + stats::rnorm(n, 0, 0.003)

  gsr_valid <- valid
  gsr_us[gsr_valid == 0] <- 0
  gsr_us_tonic[gsr_valid == 0] <- 0
  gsr_us_phasic[gsr_valid == 0] <- 0

  gsr_raw <- ifelse(gsr_valid == 1, 1000000 / gsr_us, 0)

  hr_base <- participant_baselines$hr +
    1.4 * dense_effect +
    2.2 * ambiguous_effect

  hr <- hr_base +
    gaussian_bump(time, feedback_onset + 0.9, 2.5 + 1.2 * ambiguous_effect) +
    gaussian_bump(time, confirmation_onset + 0.6, 1.2 + 0.8 * dense_effect) +
    stats::rnorm(n, 0, 0.8)

  hr <- clip(hr, 48, 125)
  ibi <- 60 / hr

  hr_valid <- valid
  hr[hr_valid == 0] <- 0
  ibi[hr_valid == 0] <- 0

  # In Gazepoint exports, HRV is treated here as a validity-like field, not as an HRV metric.
  hrv_validity <- hr_valid

  pulse_phase <- cumsum(ifelse(hr > 0, hr, hr_base) / 60) / sampling_rate
  hrp <- 1500 + 1100 * (sin(2 * pi * pulse_phase)^8) +
    120 * sin(2 * pi * 0.25 * time) +
    stats::rnorm(n, 0, 40)

  hrp[hr_valid == 0] <- 0

  dial <- 0.35 +
    0.12 * dense_effect +
    0.18 * ambiguous_effect +
    0.05 * sin(2 * pi * time / task_seconds) +
    stats::rnorm(n, 0, 0.025)

  dial <- clip(dial, 0, 1)
  dial_valid <- valid
  dial[dial_valid == 0] <- 0

  ttl0 <- ifelse(
    phase == "instruction",
    1000 + media_id,
    ifelse(
      phase == "form",
      2000 + 100 * dense_effect + media_id,
      ifelse(
        phase == "feedback",
        3000 + 100 * ambiguous_effect + media_id,
        ifelse(phase == "confirmation", 4000 + media_id, 5000 + media_id)
      )
    )
  )

  ttl1 <- as.integer(time >= feedback_onset)
  ttl2 <- as.integer(ambiguous_effect == 1 & time >= feedback_onset)
  ttl3 <- as.integer(dense_effect == 1)
  ttl4 <- task_order
  ttl5 <- participant_index
  ttl6 <- media_id
  ttlv <- valid

  fixation_id <- cumsum(c(TRUE, aoi[-1] != aoi[-length(aoi)]))
  fixation_start <- ave(time, fixation_id, FUN = min)
  fixation_duration <- ave(time, fixation_id, FUN = function(x) max(x) - min(x) + 1 / sampling_rate)

  saccade_mag <- c(0, sqrt(diff(gaze_x)^2 + diff(gaze_y)^2))
  saccade_dir <- c(0, atan2(diff(gaze_y), diff(gaze_x)))

  gaze_x[valid == 0] <- 0
  gaze_y[valid == 0] <- 0

  data.frame(
    MEDIA_ID = media_id,
    MEDIA_NAME = media_name,
    CNT = seq_len(n) - 1,
    TIME = round(time, 5),
    TIME_TICK = as.numeric(10000000 * time) + 1000000000 + participant_index * 1000000,
    FPOGX = round(gaze_x, 5),
    FPOGY = round(gaze_y, 5),
    FPOGS = round(fixation_start, 5),
    FPOGD = round(fixation_duration, 5),
    FPOGID = fixation_id,
    FPOGV = valid,
    BPOGX = round(clip(gaze_x + stats::rnorm(n, 0, 0.015), 0, 1), 5),
    BPOGY = round(clip(gaze_y + stats::rnorm(n, 0, 0.015), 0, 1), 5),
    BPOGV = valid,
    CX = round(clip(gaze_x + stats::rnorm(n, 0, 0.01), 0, 1), 5),
    CY = round(clip(gaze_y + stats::rnorm(n, 0, 0.01), 0, 1), 5),
    CS = sample(0:4, n, replace = TRUE),
    KB = NA,
    KBS = 0,
    USER = participant_id,
    LPCX = round(clip(0.33 + stats::rnorm(n, 0, 0.004), 0, 1), 5),
    LPCY = round(clip(0.49 + stats::rnorm(n, 0, 0.004), 0, 1), 5),
    LPD = round(18 + 2 * left_pupil + stats::rnorm(n, 0, 0.15), 5),
    LPS = round(1.3 + stats::rnorm(n, 0, 0.03), 5),
    LPV = lpmv,
    RPCX = round(clip(0.75 + stats::rnorm(n, 0, 0.004), 0, 1), 5),
    RPCY = round(clip(0.48 + stats::rnorm(n, 0, 0.004), 0, 1), 5),
    RPD = round(20 + 2 * right_pupil + stats::rnorm(n, 0, 0.15), 5),
    RPS = round(1.3 + stats::rnorm(n, 0, 0.03), 5),
    RPV = rpmv,
    BKID = 0,
    BKDUR = 0,
    BKPMIN = 10,
    LPMM = round(left_pupil, 5),
    LPMMV = lpmv,
    RPMM = round(right_pupil, 5),
    RPMMV = rpmv,
    DIAL = round(dial, 5),
    DIALV = dial_valid,
    GSR = round(gsr_raw, 5),
    GSR_US = round(gsr_us, 5),
    GSR_US_TONIC = round(gsr_us_tonic, 5),
    GSR_US_PHASIC = round(gsr_us_phasic, 5),
    GSRV = gsr_valid,
    HR = round(hr, 5),
    HRV = hrv_validity,
    HRP = round(hrp, 5),
    IBI = round(ibi, 5),
    TTL0 = as.integer(ttl0),
    TTL1 = as.integer(ttl1),
    TTL2 = as.integer(ttl2),
    TTL3 = as.integer(ttl3),
    TTL4 = as.integer(ttl4),
    TTL5 = as.integer(ttl5),
    TTL6 = as.integer(ttl6),
    TTLV = ttlv,
    PIXS = 0,
    PIXV = 0,
    AOI = aoi,
    SACCADE_MAG = round(saccade_mag, 5),
    SACCADE_DIR = round(saccade_dir, 5),
    VID_FRAME = floor(time * 30),
    participant_id = participant_id,
    task_order = task_order,
    interface_complexity = interface_complexity,
    feedback_clarity = feedback_clarity,
    synthetic_scenario = "public_service_kiosk_usability",
    stringsAsFactors = FALSE
  )
}

trial_design <- data.frame()

for (p in seq_len(n_participants)) {
  participant_id <- sprintf("synthetic_kiosk_p%03d", p)

  participant_baselines <- list(
    eda = stats::runif(1, 0.85, 1.35),
    hr = stats::runif(1, 66, 82),
    pupil = stats::runif(1, 3.35, 3.95)
  )

  participant_conditions <- conditions[sample(seq_len(nrow(conditions))), ]

  participant_rows <- vector("list", nrow(participant_conditions))

  for (i in seq_len(nrow(participant_conditions))) {
    complexity <- participant_conditions$interface_complexity[i]
    clarity <- participant_conditions$feedback_clarity[i]

    media_name <- paste(
      "kiosk",
      complexity,
      clarity,
      "task",
      sep = "_"
    )

    participant_rows[[i]] <- simulate_kiosk_task(
      participant_index = p,
      participant_id = participant_id,
      task_order = i,
      media_id = i,
      media_name = media_name,
      interface_complexity = complexity,
      feedback_clarity = clarity,
      participant_baselines = participant_baselines
    )

    trial_design <- rbind(
      trial_design,
      data.frame(
        participant_id = participant_id,
        task_order = i,
        MEDIA_ID = i,
        MEDIA_NAME = media_name,
        interface_complexity = complexity,
        feedback_clarity = clarity,
        sampling_rate_hz = sampling_rate,
        task_seconds = task_seconds,
        rows = samples_per_task,
        synthetic_scenario = "public_service_kiosk_usability",
        stringsAsFactors = FALSE
      )
    )
  }

  participant_data <- do.call(rbind, participant_rows)

  file_name <- sprintf(
    "synthetic_kiosk_p%03d_all_gaze.csv",
    p
  )

  utils::write.csv(
    participant_data,
    file = file.path(output_dir, file_name),
    row.names = FALSE,
    na = ""
  )
}

utils::write.csv(
  trial_design,
  file = file.path(output_dir, "synthetic_kiosk_trial_design.csv"),
  row.names = FALSE
)

readme_lines <- c(
  "Synthetic Gazepoint Biometrics kiosk demo exports",
  "",
  "This folder contains fully synthetic Gazepoint-like all-gaze exports for gpbiometrics examples.",
  "The data are artificial and are not derived from real participants.",
  "",
  "Scenario:",
  "Participants complete public-service touchscreen kiosk tasks.",
  "The synthetic design crosses interface complexity (simple/dense) and feedback clarity (clear/ambiguous).",
  "",
  "Files:",
  "- synthetic_kiosk_p001_all_gaze.csv ... synthetic_kiosk_p036_all_gaze.csv",
  "- synthetic_kiosk_trial_design.csv",
  "",
  "Signals include gaze, AOI labels, pupil diameter, GSR/EDA, HR, IBI, pulse waveform, engagement dial, and TTL markers.",
  "",
  "Interpretation:",
  "Known synthetic signal patterns are included for demonstration only.",
  "Do not interpret these data as real physiology, emotion, stress, cognition, health status, or diagnosis."
)

writeLines(
  readme_lines,
  con = file.path(output_dir, "README.txt"),
  useBytes = TRUE
)

overview <- data.frame(
  participants = n_participants,
  tasks_per_participant = nrow(conditions),
  total_rows = n_participants * nrow(conditions) * samples_per_task,
  sampling_rate_hz = sampling_rate,
  task_seconds = task_seconds,
  all_gaze_files = n_participants,
  scenario = "public_service_kiosk_usability",
  status = "synthetic_kiosk_demo_exports_created",
  stringsAsFactors = FALSE
)

utils::write.csv(
  overview,
  file = file.path(output_dir, "synthetic_kiosk_overview.csv"),
  row.names = FALSE
)

print(overview)
message("Synthetic kiosk demo exports written to: ", normalizePath(output_dir, winslash = "/"))
