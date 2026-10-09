# Compare ECG-HRV and PPG-PRV devices for one derived metric

Computes ICC(A,1), Lin's concordance correlation coefficient, and
Bland-Altman bias/95% limits. Agreement is deliberately scoped to the
supplied metric and acquisition configuration; it is not a global
ECG/PPG equivalence decision.

## Usage

``` r
compare_hrv_prv_devices(
  reference,
  candidate,
  metric,
  reference_source = "ECG-HRV",
  candidate_source = "PPG-PRV",
  reference_site = NA_character_,
  candidate_site = NA_character_
)
```

## Arguments

- reference, candidate:

  Paired numeric values.

- metric:

  Name of the derived metric (for example `"RMSSD"`).

- reference_source, candidate_source:

  Signal-source labels.

- reference_site, candidate_site:

  Optional sensor-site labels.

## Value

A metric-specific agreement record.
