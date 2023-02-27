#' @name getclf
#'
#' @aliases getclf
#'
#' @title
#' Create likelihood function for multivariate data with missing values.
#'
#' @description
#' \code{getclf} returns a function proportional to twice the negative
#' log likelihood function for multivariate normal data with missing
#' values.  This is a private function used in \code{mlest}.
#'
#' @param data A data frame sorted so that records with identical patterns of missingness are grouped together.
#' @param freq An integer vector specifying the number of records in each block of data with identical patterns of missingness.
#'
#' @details
#' The argument of the returned function is the vector of parameters.
#' The parameterization is: mean vector first, followed
#' by the log of the diagonal elements of the inverse of the Cholesky
#' factor, and then the elements of the inverse of the Cholesky
#' factor above the main diagonal.  These off-diagonal elements are
#' ordered by column (left to right), and then by row within column
#' (top to bottom).
#'
#' @returns
#' A function proportional to twice the negative log likelihood of the parameters given the data.
#'
#' @references
#' Little, R. J. A., and Rubin, D. B. (1987) \emph{Statistical Analysis with Missing Data}. New York: Wiley, ISBN:0471802549.
#'
#' @seealso \code{\link{mlest}}
#'
#' @keywords multivariate
#'
#' @useDynLib mvnmle
#'
#' @export
getclf <- function(data, freq){
  # Takes a sorted data frame and returns a likelihood function to be minimized
  nvars <- ncol(data)
  pars <- double(nvars + nvars * (nvars + 1) / 2)
  testdata <- data[cumsum(freq), ]
  presabs <- ifelse(is.na(testdata), 0, 1)

  data <- t(data)   # convert data to vectors that can be passed to C
  presabs <- t(presabs)
  dim(presabs) <- NULL
  dim(data) <- NULL
  data <- data[!is.na(data)]

  # if(!is.loaded(symbol.C("evallf"))) {
  #   cat("loading object code...\n")
  #   dyn.load("st771/libs/st771.so")
  # }

  function(pars){
    .C("evallf", as.double(data), as.integer(nvars), as.integer(freq),
       as.integer(x = length(freq)), as.integer(presabs), as.double(pars), val = double(1), PACKAGE = "mvnmle")$val;
  }
}
