\name{getgeographicdivisionsfromtsn}
\alias{getgeographicdivisionsfromtsn}
\title{Get geographic divisions from tsn}
\usage{
getgeographicdivisionsfromtsn(tsn = NA, ..., curl = getCurlHandle())
}
\arguments{
  \item{tsn}{TSN for a taxonomic group (numeric)}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\description{
Get geographic divisions from tsn
}
\examples{
\dontrun{
getgeographicdivisionsfromtsn(tsn = 180543)
}
}
\keyword{internal}

