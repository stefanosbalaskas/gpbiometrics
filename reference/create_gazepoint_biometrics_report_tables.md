# Create Gazepoint Biometrics report tables

Creates compact report-ready tables from a Gazepoint Biometrics workflow
object or from separate workflow components. The function does not write
files. It returns cleaned tables that can be printed, exported, or
inserted into reports and supplementary materials.

## Usage

``` r
create_gazepoint_biometrics_report_tables(
  workflow = NULL,
  validation = NULL,
  quality = NULL,
  sampling = NULL,
  diagnostics = NULL,
  exclusion_recommendations = NULL,
  ttl_events = NULL,
  max_ttl_events = 20
)
```

## Arguments

- workflow:

  Optional workflow object produced by
  [`run_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/run_gazepoint_biometrics_workflow.md).

- validation:

  Optional validation object produced by
  [`validate_gazepoint_biometrics()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/validate_gazepoint_biometrics.md).

- quality:

  Optional quality-audit table.

- sampling:

  Optional sampling/timing audit table produced by
  [`audit_gazepoint_biometric_sampling()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/audit_gazepoint_biometric_sampling.md).

- diagnostics:

  Optional diagnostic table produced by
  [`diagnose_gazepoint_biometrics_workflow()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/diagnose_gazepoint_biometrics_workflow.md).

- exclusion_recommendations:

  Optional object produced by
  [`recommend_gazepoint_biometric_exclusions()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/recommend_gazepoint_biometric_exclusions.md).

- ttl_events:

  Optional TTL event table produced by
  [`extract_gazepoint_ttl_events()`](https://stefanosbalaskas.github.io/gpbiometrics/reference/extract_gazepoint_ttl_events.md).

- max_ttl_events:

  Maximum number of TTL events to include in the compact TTL event
  table.

## Value

A list of report-ready tables.
