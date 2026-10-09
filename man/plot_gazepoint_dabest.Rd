\name{plot_gazepoint_dabest}
\alias{plot_gazepoint_dabest}
\title{Produce official DABEST plots for participant-level Gazepoint data}
\usage{
plot_gazepoint_dabest(
  data, group, outcome, id = NULL, paired = FALSE,
  float_contrast = TRUE, resamples = 5000L
)
}
\arguments{
\item{data}{Participant-level or participant-by-condition data frame.}
\item{group}{Name of a two-condition group column.}
\item{outcome}{Name of the numeric outcome column.}
\item{id}{Participant identity column for paired designs.}
\item{paired}{Whether to demand complete participant pairs.}
\item{float_contrast}{TRUE for Gardner-Altman; FALSE for Cumming plots.}
\item{resamples}{Number of dabestr resamples, at least 100.}
}
\description{
Validates independent observational units and delegates the estimation
plot and its BCa confidence intervals to the optional official R
\pkg{dabestr} package. This wrapper does not replace hierarchical
modeling, causal inference or measurement equivalence.
}
\value{A list with \code{plot}, \code{effect},
\code{dabest_input}, and \code{assumptions}.}
