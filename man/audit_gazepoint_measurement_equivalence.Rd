\name{audit_gazepoint_measurement_equivalence}
\alias{audit_gazepoint_measurement_equivalence}
\title{Audit paired physiological measurement agreement}
\usage{
audit_gazepoint_measurement_equivalence(
  data, reference, candidate, participant = "participant_id",
  phase = "phase", nuisance = NULL
)
}
\arguments{
\item{data}{Data frame of paired measurements and measurement provenance.}
\item{reference}{Reference measurement column.}
\item{candidate}{Candidate measurement column.}
\item{participant}{Participant identifier column.}
\item{phase}{Experimental phase column.}
\item{nuisance}{Optional categorical nuisance-condition column.}
}
\description{
Produces explicitly separate association, descriptive agreement,
condition means, and nuisance-stratified mean difference summaries.
Correlation is not evidence of instrument interchangeability.
}
\value{List with \code{agreement}, \code{nuisance_strata},
\code{phase_means}, \code{paired_unit_means} and \code{limitations}.}
