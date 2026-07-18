# Testing interoperability across external package versions

## Purpose

`gpbiometrics` prepares data and metadata for several external R and
Python ecosystems. These integrations can be affected when external
packages change their accepted columns, object structures, runtime
requirements, or supported versions.

The interoperability audit checks the contracts controlled by
`gpbiometrics`. It does not attempt to prove that external analytical
algorithms produce identical numerical results across releases.

The maintained checks focus on whether:

- declared bridge functions remain exported;
- optional dependencies are detected safely;
- installed versions can be recorded and compared with tested floors;
- Python runtime availability is reported explicitly;
- external-package absence does not prevent the core package from
  loading;
- compatibility findings can be written without source or participant
  data.

## Interoperability manifest

The manifest provides a machine-readable description of the maintained
integration surface.

``` r

manifest <- gazepoint_interoperability_manifest()

manifest[
  ,
  c(
    "target",
    "ecosystem",
    "dependency",
    "minimum_tested_version",
    "version_policy",
    "test_group",
    "optional"
  )
]
#>           target ecosystem    dependency minimum_tested_version
#> 1   eyetrackingR         R  eyetrackingR                   <NA>
#> 2  PupillometryR         R PupillometryR                   <NA>
#> 3          gazeR         R         gazer                   <NA>
#> 4     MNE-Python    Python           mne                 1.11.0
#> 5          pylsl    Python         pylsl                 1.16.2
#> 6        BioSPPy    Python       biosppy                  2.1.0
#> 7        HeartPy    Python       heartpy                  1.2.7
#> 8          pyHRV    Python         pyhrv                  0.4.1
#> 9           BIDS  Standard          BIDS                 1.11.1
#> 10         NumPy    Python         numpy                 1.26.4
#> 11        pandas    Python        pandas                  2.2.3
#>       version_policy        test_group optional
#> 1  current-installed     r-eye-bridges     TRUE
#> 2  current-installed     r-eye-bridges     TRUE
#> 3  current-installed     r-eye-bridges     TRUE
#> 4  floor-and-current           mne-lsl     TRUE
#> 5  floor-and-current           mne-lsl     TRUE
#> 6  floor-and-current python-physiology     TRUE
#> 7  floor-and-current python-physiology     TRUE
#> 8  floor-and-current python-physiology     TRUE
#> 9      specification       bids-export    FALSE
#> 10 floor-and-current    python-support     TRUE
#> 11 floor-and-current    python-support     TRUE
```

The manifest currently covers:

- `eyetrackingR`;
- `PupillometryR`;
- `gazeR`;
- MNE-Python;
- `pylsl`;
- BioSPPy;
- HeartPy;
- pyHRV;
- BIDS;
- NumPy;
- pandas.

A minimum tested version identifies the oldest version exercised by the
maintained compatibility workflow. It does not establish that every
earlier release is incompatible.

For R packages without a historical floor, the policy is
`"current-installed"`. Their installed versions are recorded, but no
claim is made about an untested lower boundary.

## Dependency-free audit

A dependency-free audit checks all bridge exports and records R-package
availability without initializing Python.

``` r

audit <- audit_gazepoint_interoperability_versions(
  include_python = FALSE,
  strict = TRUE
)

print(audit)
#> <gazepoint_interoperability_audit>
#> Targets: 11
#> Passed: 11
#> Failed: 0
#> Review: 10
#> Overall pass: TRUE
```

``` r

audit$summary
#>   n_targets n_pass n_fail n_review n_available n_missing_optional overall_pass
#> 1        11     11      0       10           4                  0         TRUE
```

A compact target-level view is usually sufficient for review.

``` r

audit$results[
  ,
  c(
    "target",
    "dependency",
    "installed_version",
    "minimum_tested_version",
    "status",
    "pass",
    "needs_review"
  )
]
#>           target    dependency installed_version minimum_tested_version
#> 1   eyetrackingR  eyetrackingR             0.2.2                   <NA>
#> 2  PupillometryR PupillometryR             0.0.7                   <NA>
#> 3          gazeR         gazer             0.2.4                   <NA>
#> 4     MNE-Python           mne              <NA>                 1.11.0
#> 5          pylsl         pylsl              <NA>                 1.16.2
#> 6        BioSPPy       biosppy              <NA>                  2.1.0
#> 7        HeartPy       heartpy              <NA>                  1.2.7
#> 8          pyHRV         pyhrv              <NA>                  0.4.1
#> 9           BIDS          BIDS            1.11.1                 1.11.1
#> 10         NumPy         numpy              <NA>                 1.26.4
#> 11        pandas        pandas              <NA>                  2.2.3
#>                status pass needs_review
#> 1  available_unpinned TRUE         TRUE
#> 2  available_unpinned TRUE         TRUE
#> 3  available_unpinned TRUE         TRUE
#> 4         not_checked TRUE         TRUE
#> 5         not_checked TRUE         TRUE
#> 6         not_checked TRUE         TRUE
#> 7         not_checked TRUE         TRUE
#> 8         not_checked TRUE         TRUE
#> 9            declared TRUE        FALSE
#> 10        not_checked TRUE         TRUE
#> 11        not_checked TRUE         TRUE
```

Typical statuses include:

- `available`: the installed dependency meets its declared tested floor;
- `available_unpinned`: the dependency is installed, but no historical
  floor has been declared;
- `declared`: a standard-level contract, such as BIDS, is registered;
- `not_checked`: Python inspection was deliberately disabled;
- `runtime_unavailable`: Python could not be initialized;
- `missing_dependency`: an optional dependency is absent;
- `below_minimum`: an installed dependency is below the declared tested
  floor;
- `missing_bridge`: a declared `gpbiometrics` bridge export is
  unavailable.

Missing optional dependencies and deliberately disabled Python checks
are review conditions rather than core-package failures. Missing bridge
exports and installed versions below declared floors fail the strict
audit.

## Python-enabled audit

A Python-enabled audit uses the active `reticulate` environment.

``` r

Sys.setenv(
  RETICULATE_PYTHON =
    "C:/path/to/python.exe"
)

python_audit <-
  audit_gazepoint_interoperability_versions(
    include_python = TRUE,
    strict = TRUE
  )

python_audit$summary

python_audit$results[
  python_audit$results$ecosystem == "Python",
  c(
    "target",
    "installed_version",
    "minimum_tested_version",
    "runtime_version",
    "status",
    "pass"
  )
]
```

Python distribution versions are queried through `importlib.metadata`.
The audit does not import every analytical package merely to obtain its
version.

Actual bridge tests remain responsible for checking object construction,
metadata preservation, input structure, time units, and safe failure
behaviour.

## Writing a compatibility report

Compatibility reports contain aggregate environment and target
information only.

``` r

output_dir <- tempfile(
  "gpbiometrics-interoperability-"
)

files <- write_gazepoint_interoperability_audit(
  audit,
  output_dir = output_dir
)

basename(files)
#> [1] "gpbiometrics-interoperability-results.csv"
#> [2] "gpbiometrics-interoperability-summary.csv"
#> [3] "gpbiometrics-interoperability-session.csv"
#> [4] "gpbiometrics-interoperability-manifest.csv"
```

The generated files contain:

- target-level results;
- an aggregate pass/review summary;
- R, Python, package, platform, and operating-system metadata;
- the manifest used by the audit.

They do not contain imported signals, participant identifiers, source
filenames, or input-data paths.

## Command-line audit

From the package repository, the maintained command-line runner can be
used without writing results into the repository.

``` r

system2(
  "Rscript",
  c(
    "tools/run-interoperability-version-audit.R",
    shQuote(
      "C:/external-output/gpbiometrics-interoperability"
    )
  )
)
```

The same location can be supplied through an environment variable.

``` r

Sys.setenv(
  GPBIOMETRICS_INTEROP_OUTPUT =
    "C:/external-output/gpbiometrics-interoperability",
  GPBIOMETRICS_INTEROP_PYTHON =
    "true"
)
```

## Continuous-integration matrix

The dedicated GitHub Actions workflow runs three R bridge jobs and two
Python profiles.

The R jobs exercise the eye-tracking bridge contracts on:

- Windows;
- Ubuntu;
- macOS.

The Python jobs exercise:

- a declared floor environment;
- a current-release environment.

The workflow stores compatibility CSV files as temporary GitHub Actions
artifacts. These artifacts provide an auditable runtime record without
adding generated compatibility files to the repository.

## Interpretation boundary

The audit supports statements such as:

- a declared input contract remains available;
- an optional dependency is installed or absent;
- a tested version floor is met;
- expected metadata and bridge exports remain present;
- a runtime environment requires review.

It does not support claims that:

- every version of an external package is compatible;
- external numerical implementations are equivalent across releases;
- successful object construction validates a scientific analysis;
- an absent optional dependency is a failure of the core package.

Interoperability findings should therefore be interpreted as
software-contract evidence rather than scientific equivalence evidence.
