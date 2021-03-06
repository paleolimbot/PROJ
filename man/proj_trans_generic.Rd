% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/proj_trans_generic.R
\name{proj_trans_generic}
\alias{proj_trans_generic}
\alias{proj_trans}
\title{Transform a set of coordinates with 'PROJ'}
\usage{
proj_trans_generic(x, target, ..., source = NULL, z_ = 0, t_ = 0)

proj_trans(x, target, ..., source = NULL, z_ = NULL, t_ = NULL)
}
\arguments{
\item{x}{input coordinates (x,y, list or matrix see \code{z_} and \code{t_})}

\item{target}{projection for output coordinates}

\item{...}{ignored}

\item{source}{projection of input coordinates (must be named)}

\item{z_}{optional z coordinate vector}

\item{t_}{optional t coordinate vector}
}
\value{
list of transformed coordinates, with 4-elements \code{x_}, \code{y_}, \code{z_}, \code{t_}
}
\description{
A raw interface to 'proj_trans' in 'PROJ => 6', if it is available.
}
\details{
'proj_trans_generic()' and 'proj_trans()' have the same arguments, but differ
in the default values of \code{z_} and \code{t_}, \code{0} or \code{NULL}. 'proj_trans_generic()' always
returns a list for 4 elements, 'proj_trans()' will return 2 or 4 depending on the input.

'proj_trans_generic()' is a misnomer in that 'proj_trans' is the function from the PROJ
library that is now used.

Input 'x' is assumed to be 2-columns of "x", then "y" coordinates. If "z" or
"t" is required pass these in as named vectors with "z_" and "t_". For simplifying reasons
\code{z_} and \code{t_} must always match the length of \code{x} \code{y}. Both default to 0, and are automatically
recycled to the number of rows in \code{x} so it's pretty flexible.

Values that are detected out of bounds by library PROJ are allowed, we return \code{Inf} in this
case, rather than the error "tolerance condition error".
}
\examples{
if (ok_proj6()) {
 proj_trans_generic(cbind(147, -42), "+proj=laea", source = "epsg:4326")
 proj_trans_generic(cbind(147, -42), z_ = -2, "+proj=laea", source = "epsg:4326")
 proj_trans_generic(cbind(147, -42), z_ = -2, t_ = 1, "+proj=laea", source = "epsg:4326")
 }
}
\references{
see the \href{https://proj.org/development/reference/functions.html#coordinate-transformation}{PROJ library documentation}
for details on the underlying functionality
}
