\name{taxize_ldfast}
\alias{taxize_ldfast}
\title{Replacement function for ldply that should be faster in all cases.}
\usage{
taxize_ldfast(x, convertvec = FALSE)
}
\arguments{
  \item{x}{A list.}

  \item{convertvec}{Convert a vector to a data.frame before
  rbind is called.}
}
\description{
Replacement function for ldply that should be faster in all
cases.
}
\keyword{internal}

