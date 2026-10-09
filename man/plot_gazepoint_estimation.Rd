\name{plot_gazepoint_estimation}
\alias{plot_gazepoint_estimation}
\title{Plot participant-level estimation evidence}
\usage{
plot_gazepoint_estimation(
  data, group, outcome, id = NULL, paired = FALSE,
  n_boot = 999L, seed = 2026L
)
}
\arguments{
\item{data}{Data frame with one row per independent unit and condition.}
\item{group}{Name of the grouping column with exactly two conditions.}
\item{outcome}{Name of numeric measured outcome.}
\item{id}{Optional participant identifier column; required for paired designs.}
\item{paired}{Use a complete-pair bootstrap and slopegraph.}
\item{n_boot}{Number of participant-level bootstrap replicates (>=99).}
\item{seed}{Integer resampling seed; the prior random state is restored.}
}
\description{
An original ggplot implementation inspired by DABEST/Cumming estimation
graphics. Shows raw observations and a percentile bootstrap of mean
differences; does not reproduce DABEST's default BCa intervals. Repeated
trials must be aggregated at the independent-unit level beforehand.
}
\value{A list containing \code{plot}, \code{summary}, \code{draws},
and \code{limitations}.}
