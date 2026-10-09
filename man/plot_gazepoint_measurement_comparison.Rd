\name{plot_gazepoint_measurement_comparison}
\alias{plot_gazepoint_measurement_comparison}
\title{Plot association and agreement separately}
\usage{plot_gazepoint_measurement_comparison(audit)}
\arguments{\item{audit}{A measurement-equivalence audit object.}}
\description{Creates an identity-line scatterplot and descriptive
Bland-Altman-like plot of matched participant-phase means.
Requires optional ggplot2. The limits of agreement are not
inferential repeated-measure confidence intervals.}
\value{Named list with \code{association} and \code{agreement} ggplots.}
