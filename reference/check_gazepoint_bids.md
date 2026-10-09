# Check a Gazepoint dataset for a BIDS-like layout

Performs a conservative, Gazepoint-oriented audit of a dataset folder
that follows, or approximately follows, a BIDS-like organization. This
function is not a full BIDS validator and does not convert data. It
checks only simple, reviewable layout features such as dataset-level
metadata files, subject folders, Gazepoint-like export files, and
optional JSON sidecars.

## Usage

``` r
check_gazepoint_bids(
  root,
  subject_pattern = "^sub-[A-Za-z0-9]+$",
  recursive = TRUE,
  expected_files = c("dataset_description.json", "participants.tsv"),
  gazepoint_patterns = c("all[_-]?gaze", "fixation", "summary", "biometric", "eda",
    "gsr", "ecg", "ppg", "hr", "ibi")
)
```

## Arguments

- root:

  Character scalar. Path to the dataset root folder.

- subject_pattern:

  Regular expression used to identify subject folders. Defaults to
  folders such as `sub-001`.

- recursive:

  Logical. Whether to search for Gazepoint export files recursively
  under `root`.

- expected_files:

  Character vector of optional dataset-level files to check.

- gazepoint_patterns:

  Character vector of case-insensitive filename patterns used to
  identify Gazepoint-derived exports.

## Value

A list with class `gazepoint_bids_layout_audit` containing the root
path, check table, discovered files, and summary counts.
