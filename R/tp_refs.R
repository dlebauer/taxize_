#' Return all reference records for for a taxon name with a given id.
#' 
#' @import XML RCurl RJSONIO plyr
#' @param id the taxon identifier code 
#' @param format return in json or xml format (defaults to json)
#' @param output raw = json or xml; or df = data.frame 
#' @param key Your Tropicos API key; loads from .Rprofile.
#' @param verbose Print messages (default) or not, logical
#' @return List or dataframe.
#' @examples \dontrun{
#' # Raw json or xml
#' tp_refs(id = 25509881, output = 'raw')
#' 
#' # Output as data.frame
#' tp_refs(id = 25509881)
#' }
#' @export
tp_refs <- function(id, format = 'json', output = 'df', key = NULL, verbose=TRUE) 
{
  url = 'http://services.tropicos.org/Name/'
	key <- getkey(key, "tropicosApiKey")
  if (format == 'json') {
    urlget <- paste(url, id, '/References?apikey=', key, '&format=json', sep="")
    mssg(verbose, urlget)
    searchresults <- fromJSON(urlget)
    } 
  else {
    urlget <- paste(url, id, '/References?apikey=', key, '&format=xml', sep="")
    mssg(verbose, urlget)
    xmlout <- getURL(urlget)
    searchresults <- xmlToList(xmlTreeParse(xmlout))
    }
  if(output == 'df') { 
    getdata <- function(x) {
      ref <- ldply(x[[1]])
      names(ref) <- c('variable','value')
      ref$variable <- as.factor(ref$variable)
      ref
    }
    ldply(searchresults, getdata)
  } else { searchresults }
}

#' Return all reference records for for a taxon name with a given id.
#' 
#' Function name changed to tp_refs.
#' 
#' @param id the taxon identifier code 
#' @param format return in json or xml format (defaults to json)
#' @param output raw = json or xml; or df = data.frame 
#' @param key Your Tropicos API key; loads from .Rprofile.
#' @param verbose Print messages (default) or not, logical
#' @export
tp_namereferences <- function(id, format = 'json', output = 'df', key = NULL, verbose=TRUE) 
{
  .Deprecated("tp_refs", "taxize", "Function name changed. See tp_refs", "tp_namereferences") 
}