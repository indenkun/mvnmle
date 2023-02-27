#' @name getstartvals
#'
#' @aliases getstartvals
#'
#' @title Obtain starting values for maximum likelihood estimation.
#'
#' @description
#' Calculates the starting values to be passed to \code{nlm} for
#' minimization of the negative log-likelihood for multivariate normal
#' data with missing values.  This function is private to \code{mlest}.
#'
#' @param x Multivariate data, potentially with missing values.
#' @param eps All eigenvalues of the variance-covariance matrix less than
#'            \code{eps} times the smallest positive eigenvalue are set to
#'            \code{eps} times the smallest positive eigenvalue.
#'
#' @details
#' Starting values for the mean vector are simply sample means.  Starting
#' values for the variance-covariance matrix are derived from the sample
#' variance-covariance matrix, after setting eigenvalues less than
#' \code{eps} times the smallest positive eigenvalue equal to \code{eps}
#' times the smallest positive eigenvalue to enforce positive definiteness.
#'
#' @returns
#' A numeric vector, containing the mean vector first, followed
#' by the log of the diagonal elements of the inverse of the Cholesky
#' factor of the adjusted sample variance-covariance matrix, and then
#' the elements of the inverse of the Cholesky factor above the main diagonal.  These off-diagonal elements are
#' ordered by column (left to right), and then by row within column
#' (top to bottom).
#'
#' @seealso \code{\link{mlest}}
#'
#' @keywords multivariate
#'
#' @export
getstartvals <- function(x, eps = 1e-03){
  # Returns starting values for the relative precision matrix delta
  n <- ncol(x)
  startvals <- double(n + n * (n + 1) / 2)
  startvals[1:n] <- apply(x, 2, mean, na.rm=TRUE)

  sampmat <- stats::cov(x, use = "p") # sample var-cov matrix
  eig <- eigen(sampmat, symmetric = TRUE)
  realvals <- sapply(eig$values, function(y) ifelse(is.complex(y), 0, y))
  smalleval <- eps * min(realvals[realvals > 0])
  posvals <- pmax(smalleval, realvals)
  mypdmat <- eig$vectors %*% diag(posvals) %*% t(eig$vectors)
  myfact <- chol(mypdmat)
  mydel <- solve(myfact, diag(n))
  signchange <- diag(ifelse(diag(mydel) > 0, 1, -1))
  mydel <- mydel %*% signchange # ensure that diagonal elts are positive
  startvals[(n + 1):(2 * n)] <- log(diag(mydel))
  for(i in 2:n){   # assume n>2
    startvals[(2 * n + sum(1:(i-1)) -i + 2):(2 * n + sum(1:(i - 1)))] <- mydel[1:(i - 1), i]
  }
  startvals
}
