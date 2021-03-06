\name{itis_getrecord}
\alias{itis_getrecord}
\title{Get full ITIS record for one or more ITIS TSN's or lsid's.}
\usage{
itis_getrecord(values = NULL, by = "tsn", ...)
}
\arguments{
  \item{values}{One or more TSN's (taxonomic serial number)
  or lsid's for a taxonomic group (character)}

  \item{by}{By "tsn" or "lsid"}

  \item{...}{Further arguments passed on to
  getpublicationsfromtsn}
}
\description{
Get full ITIS record for one or more ITIS TSN's or lsid's.
}
\details{
You can only enter values in tsn parameter or lsid, not
both.
}
\examples{
\dontrun{
# by TSN
itis_getrecord(202385)
itis_getrecord(c(202385,70340))

# by lsid
itis_getrecord("urn:lsid:itis.gov:itis_tsn:180543", "lsid")

# suppress message
itis_getrecord(202385, verbose=FALSE)
}
}

