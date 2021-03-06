\name{tp_refs}
\alias{tp_refs}
\title{Return all reference records for for a taxon name with a given id.}
\usage{
tp_refs(id, format = "json", output = "df", key = NULL, verbose = TRUE)
}
\arguments{
  \item{id}{the taxon identifier code}

  \item{format}{return in json or xml format (defaults to
  json)}

  \item{output}{raw = json or xml; or df = data.frame}

  \item{key}{Your Tropicos API key; loads from .Rprofile.}

  \item{verbose}{Print messages (default) or not, logical}
}
\value{
List or dataframe.
}
\description{
Return all reference records for for a taxon name with a
given id.
}
\examples{
\dontrun{
# Raw json or xml
tp_refs(id = 25509881, output = 'raw')

# Output as data.frame
tp_refs(id = 25509881)
}
}

