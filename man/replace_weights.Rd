% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/replace_weights.R
\name{replace_weights}
\alias{replace_weights}
\title{Replace the effect sizes in an assoc file with those found in another assoc file.}
\usage{
replace_weights(assoc1, assoc2, file)
}
\arguments{
\item{assoc1}{Path to first assoc file.}

\item{assoc2}{Path to the second assoc file.}

\item{file}{Path to write the resulting assoc file.}
}
\value{
Nothing, used for side effects.
}
\description{
Useful for weighting according to the betas of a different trait while keeping the inclusion criteria given by the P values.
}

