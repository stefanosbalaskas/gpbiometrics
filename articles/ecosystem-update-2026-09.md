# Ecosystem update — September 2026

## Python-native extension outside the frozen R contract

The companion Python package **gpbiometricspy** now includes a fully
exact-main-certified crossed participant–item Gaussian hierarchical
location–scale model with **one location random slope for each crossed
factor**.

This addition is intentionally outside the frozen `gpbiometrics 2.0.0`
semantic-parity contract. It does **not** add a new R export, modify the
`gpbiometrics` API, or change the scientific/release record of this R
package. The frozen R surface remains the reference against which
gpbiometricspy preserves **406/406** semantic parity; the crossed
random-slope model is later additive Python-native development.

The new method estimates participant- and item-specific heterogeneity in
conditional associations while retaining crossed residual-scale
heterogeneity, explicit population-versus-conditional prediction
semantics, fail-closed design checks, and deterministic reproducibility
certificates. It is not a causal model, artifact detector,
sensor-validity score, or latent-state inference engine.

Certified gpbiometricspy PR \#129 is pinned to merge SHA
`d078e0366ace49c3ebeb2f6800bad6394d70631e`: 14/14 exact-main push
workflow families, 12/12 OS/Python matrix lanes, 782/782 tests,
14,015/14,015 statements, and 6,757/6,776 raw branches (99.7196%). The
19 remaining branch arcs are the unchanged audited structural-debt set,
with zero unexpected, stale, or unaudited debt.

- [Crossed participant–item random-slope
  guide](https://stefanosbalaskas.github.io/gpbiometricspy/methods/crossed-random-slopes-location-scale/)
- [gpbiometricspy PR
  \#129](https://github.com/stefanosbalaskas/gpbiometricspy/pull/129)
