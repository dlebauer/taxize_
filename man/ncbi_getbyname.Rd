\name{ncbi_getbyname}
\alias{ncbi_getbyname}
\title{Retrieve gene sequences from NCBI by taxon name and gene names.}
\usage{
ncbi_getbyname(taxa, gene = "COI", seqrange = "1:3000",
  getrelated = FALSE, verbose = TRUE)
}
\arguments{
  \item{taxa}{Scientific name to search for (character).}

  \item{gene}{Gene (character) or genes (character vector)
  to search for.}

  \item{seqrange}{Sequence range, as e.g., "1:1000"
  (character).}

  \item{getrelated}{Logical, if TRUE, gets the longest
  sequences of a species in the same genus as the one
  searched for. If FALSE, get's nothing.}

  \item{verbose}{logical; If TRUE (default), informative
  messages printed.}
}
\value{
Data.frame of results.
}
\description{
Retrieve gene sequences from NCBI by taxon name and gene
names.
}
\details{
Removes predicted sequences so you don't have to remove
them.  Predicted sequences are those with accession numbers
that have "XM_" or "XR_" prefixes. This function retrieves
one sequences for each species, picking the longest
available for the given gene.
}
\examples{
\dontrun{
# A single species
ncbi_getbyname(taxa="Acipenser brevirostrum")

# Many species
species <- c("Colletes similis","Halictus ligatus","Perdita trisignata")
ncbi_getbyname(taxa=species, gene = c("coi", "co1"), seqrange = "1:2000")
}
}
\author{
Scott Chamberlain \email{myrmecocystus@gmail.com}
}
\seealso{
\code{\link[taxize]{ncbi_search}},
\code{\link[taxize]{ncbi_getbyid}}
}

