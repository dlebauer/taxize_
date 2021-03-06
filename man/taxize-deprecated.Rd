\name{taxize-deprecated}
\alias{taxize-deprecated}
\title{Deprecated functions in taxize}
\description{
\itemize{ \item \code{\link{col_classification}}: This
function is deprecated, and the function col_classification
will be removed in v0.2.0. See classification() \item
\code{\link{eol_hierarchy}}: This function is deprecated,
and the function eol_hierarchy will be removed in v0.2.0.
See classification() \item \code{\link{tp_classification}}:
This function is deprecated, and the function
tp_classification will be removed in v0.2.0. See
classification() }
}
\details{
The following functions have just changed names. The old
function names are still available to call, but simply
return a message directing the user to the new function
name.

\itemize{ \item \code{\link{get_seqs}}: This function has
changed name to ncbi_getbyname(). The function get_seqs
will be removed in v0.2.0.  \item \code{\link{get_genes}}:
This function has changed name to ncbi_getbyid(), The
function get_genes will be removed in v0.2.0.  \item
\code{\link{get_genes_avail}}: This function has changed
name to ncbi_search(), The function get_genes_avail will be
removed in v0.2.0.  \item \code{\link{tp_acceptednames}}:
This function has changed name to tp_accnames(), The
function tp_acceptednames will be removed in v0.2.0.  \item
\code{\link{tp_namedistributions}}: This function has
changed name to tp_dist(), The function
tp_namedistributions will be removed in v0.2.0.  \item
\code{\link{tp_namereferences}}: This function has changed
name to tp_refs(), The function tp_namereferences will be
removed in v0.2.0. }
}

