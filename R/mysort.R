#' @name mysort
#'
#' @aliases mysort
#'
#' @title
#' Sort a multivariate data matrix according to patterns of missingness.
#'
#' @description
#' \code{mysort} sorts a multivariate data matrix so that records with
#' identical patterns of missingness are adjacent to one another.
#' \code{mysort} is a private function used inside of \code{mlest}.
#'
#' @param x  A multivariate data matrix.  Rows correspond to individual
#' records and columns correspond to components of the multivariate vector.
#'
#' @returns
#' \item{sorted.data}{A matrix of the same size as \code{x} but with the
#' rows re-arranged so that records with identical patterns of
#' missingness are adjacent to one another.}
#' \item{freq}{An integer vector giving the number of records in each
#' block of rows with a unique pattern of missingness.  The first
#' element in \code{freq} counts the number of rows in the top block
#' of \code{sorted.data}, and so on.}
#'
#' @seealso \code{\link{mlest}}
#'
#' @keywords multivariate
#'
#' @export
mysort<-function(x){
  # Sorts rows and cols of incoming dataframe x into/
  # an order for which it is easier to write the likelihood function
  nvars <- ncol(x)
  powers <- as.integer(2^((nvars-1):0))
  binrep <- ifelse(is.na(x), 0, 1)
  decrep <- binrep %*% powers
  sorted <- x[order(decrep), ]
  decrep <- decrep[order(decrep)]

  list(sorted.data = sorted, freq = as.vector(table(decrep)))
}
