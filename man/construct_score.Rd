% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/construct_score.R
\name{construct_score}
\alias{construct_score}
\title{Construct a Simple Polygenic Risk Score}
\usage{
construct_score(file = NULL, assoc = NULL, alternate_weights = NULL,
  mode = "single", p = 0.05)
}
\arguments{
\item{file}{Path to converted raw plink file. This is a typical \code{plink} file which has been converted to an R readable format through \code{recodeA}. See \code{details} for specific conversion instructions.}

\item{assoc}{File path to summary statistics used for score construction. This file must contain a column named "P" or "pvalue" or "p-value" or something similar. If the beta coefficients are to be used from this file (as opposed to \code{alternate_weights}) then a column named "beta", "Beta", "B", or similar must be present. See \code{details} for more information.}

\item{alternate_weights}{File path to an alternate weighting scheme for use in cross-disorder PRS.}

\item{mode}{One of "single" or "multiple". For more details see \code{details}.}

\item{p}{P value cutoff for SNP inclusion in PRS.}
}
\value{
An S4 PRS object. Slots include: \cr
\itemize{
\item "score" - A data.frame with column 1 being FID, column 2 being IID, and column 3 being SCORE. Similar to \code{plink} output. 
}
}
\description{
Given input genetic files and association statistics, generate one of a number of polygenic risk scores.
}
\details{
This is helper code to construct a simple PRS in R. Note that it is currently unoptimized, meaning that it is currently implimented in R and not RcppArmadillo as it will be in the future. \cr 

In order to use this function, you must convert your genetic files to be \code{plink.raw} format. This serves several purposes:
\itemize{
	\item It allows this function to have a standard set of inputs which are predictable and easy to deal with. 
\item It is an efficient format which is easy to deal with computationally.
	\item Avoids any shell integration, which makes the functions more cross-platform.
} \cr
We understand that this represents an additional processing step, but we think that the reward is worth the time. If you've done this kind of thing before, please use the \code{--recodeA} flag to produce a single \code{plink.raw} file. If you have not, we have provided a vignette on data conversion and the same information in the package wiki online. \cr
If \code{mode == "single"}, then the function assumes that you wish to construct the scores using weighting coefficients from the *same disorder* (i.e. using the weights provided in the \code{assoc} file) and those P values for thresholding. If \code{mode == "multiple"} then the function assumes that you wish to use the original P values in \code{assoc} to perform SNP selection, but an alternate set of weights. Provide this alternate set of weights through \code{alternate_weights}.  \cr

The inclusion criteria for the score are provided with the \code{p} arguement. All variants with P < p will be included in the score.
}

