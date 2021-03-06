#' This function will return all ClassificationBank data pertaining to a 
#' particular ClassificationBankID
#' 
#' @import httr XML RCurl plyr
#' @param hierarchiesID (string) - ClassificationBank identifier for the record you 
#'    wish to receive
#' @param childrenFlag (0 or 1) to include the taxon's children taxa
#' @param ancestryFlag (0 or 1) to include the taxon's taxonomic ancestry
#' @param justificationsFlag (0 or 1) to include the bibliographic references
#' @param synonymsFlag (0 or 1) to include the taxon's synonymous taxa
#' @param keyCode Your uBio API key; loads from .Rprofile. If you don't have 
#'    one, obtain one at http://www.ubio.org/index.php?pagename=form.
#' @param callopts Parameters passed on to httr::GET call.
#' @return A list of four data.frame's, one for the name itself, one for synonyms, 
#' one for vernacular names, and one for citations.
#' @examples \dontrun{
#' ubio_classification(hierarchiesID = 2483153)
#' ubio_classification(hierarchiesID = 2483153, childrenFlag=1)
#' ubio_classification(hierarchiesID = 2483153, ancestryFlag=1)
#' }
#' @export
ubio_classification <- function(hierarchiesID = NULL, childrenFlag = 0, 
  ancestryFlag = 0, justificationsFlag = 0, synonymsFlag = 0,
  keyCode = NULL, callopts=list())
{
  url <- "http://www.ubio.org/webservices/service.php"
  keyCode <- getkey(keyCode, "ubioApiKey")
  args <- compact(list(
    'function' = 'classificationbank_object', hierarchiesID = hierarchiesID, 
    childrenFlag = childrenFlag, ancestryFlag = ancestryFlag, 
    justificationsFlag = justificationsFlag, synonymsFlag = synonymsFlag, keyCode = keyCode))
  tmp <- GET(url, query=args, callopts)
  stop_for_status(tmp)
  tt <- content(tmp)  
  toget <- c("classificationData/classificationTitleID", "classificationData/classificationTitle", 
             "classificationData/classificationRoot", "rankName", "rankID", "classificationsID", 
             "recordedName/namebankID", "recordedName/nameString")
  temp <- lapply(toget, function(x) sapply(xpathApply(tt, paste("/results/", x, sep="")), xmlValue))
  temp[c(2,8)] <- sapply(temp[c(2,8)], base64Decode)
  out <- data.frame(do.call(cbind, temp))
  names(out) <- c("classificationTitleID", "classificationTitle", 
                  "classificationRoot", "rankName", "rankID", "classificationsID", 
                  "namebankID", "nameString")
  tolowerfxn <- function(x){
    if(is.null(x)){ NULL } else {
      names(x) <- tolower(names(x))
      return( x )
    }
  }
  out <- tolowerfxn(out)
  child <- ifelsedata(tt, childrenFlag, "children", 4)
  child <- tolowerfxn(child)
  ancestry <- ifelsedata(tt, ancestryFlag, "ancestry", 4)
  ancestry <- tolowerfxn(ancestry)
  synonyms <- ifelsedata(tt, synonymsFlag, "synonyms", 4)
  synonyms <- tolowerfxn(synonyms)
  refs <- ifelsedata(tt, justificationsFlag, "citations", 4)
  refs <- tolowerfxn(refs)
  list(data=out, children=child, ancestry=ancestry, synonyms=synonyms, refs=refs)
}

#' Function to parse xml data, decode strings, and return NULL if logical is zero.
#' @export
#' @keywords internal
ifelsedata <- function(a, x, y, z)
{
  if(x == 1){
    taxize_ldfast(getxmldata(obj=a, node=y, todecode=z), convertvec=TRUE) 
  } else { NULL }
}