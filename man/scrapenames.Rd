\name{scrapenames}
\alias{scrapenames}
\title{Resolve names using Global Names Recognition and Discovery.}
\usage{
scrapenames(url = NULL, file = NULL, text = NULL, engine = NULL,
  unique = NULL, verbatim = NULL, detect_language = NULL,
  all_data_sources = NULL, data_source_ids = NULL, callopts = list())
}
\arguments{
  \item{url}{An encoded URL for a web page, PDF, Microsoft
  Office document, or image file, see examples}

  \item{file}{When using multipart/form-data as the
  content-type, a file may be sent.  This should be a path
  to your file on your machine.}

  \item{text}{Type: string. Text content; best used with a
  POST request, see examples}

  \item{engine}{(optional) Type: integer, Default: 0.
  Either 1 for TaxonFinder, 2 for NetiNeti, or 0 for both.
  If absent, both engines are used.}

  \item{unique}{(optional) Type: boolean. If TRUE
  (default), response has unique names without offsets.}

  \item{verbatim}{(optional) Type: boolean, If TRUE
  (default to FALSE), response excludes verbatim strings.}

  \item{detect_language}{(optional) Type: boolean, When
  TRUE (default), NetiNeti is not used if the language of
  incoming text is determined not to be English. When
  'false', NetiNeti will be used if requested.}

  \item{all_data_sources}{(optional) Type: bolean. Resolve
  found names against all available Data Sources.}

  \item{data_source_ids}{(optional) Type: string. Pipe
  separated list of data source ids to resolve found names
  against. See list of Data Sources.}

  \item{callopts}{Further args passed to
  \code{\link[httr]{GET}}}
}
\value{
A list of length two, first is metadata, second is the data
as a data.frame.
}
\description{
Uses the Global Names Recognition and Discovery service,
see \url{http://gnrd.globalnames.org/}.
}
\details{
One of url, file, or text must be specified - and only one
of them.
}
\examples{
\dontrun{
# Get data from a website using its URL
scrapenames(url = 'http://en.wikipedia.org/wiki/Araneae')

# Scrape names from a pdf at a URL
scrapenames(url = 'http://www.mapress.com/zootaxa/2012/f/z03372p265f.pdf')

# With arguments
scrapenames(url = 'http://www.mapress.com/zootaxa/2012/f/z03372p265f.pdf',
unique=TRUE)
scrapenames(url = 'http://www.mapress.com/zootaxa/2012/f/z03372p265f.pdf', all_data_sources=TRUE)

# Get data from a file - NOT WORKING YET
scrapenames(file = '~/github/sac/joshwork/species_for_Scott.txt')

# Get data from text string as an R object
scrapenames(text='A spider named Pardosa moesta Banks, 1892')
}
}
\author{
Scott Chamberlain {myrmecocystus@gmail.com}
}

