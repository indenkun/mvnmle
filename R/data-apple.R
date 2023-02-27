#' @name apple
#'
#' @aliases apple
#'
#' @title Worm Infestations in Apple Crops
#'
#' @description
#' The \code{apple} data frame provides the number of apples (in 100s) on
#' 18 different apple trees.  For 12 trees, the percentage of apples with
#' worms (x 100) is also given.
#'
#' @format
#' This data frame contains the following columns:
#' \describe{
#'   \item{size}{hundreds of apples on the tree.}
#'    \item{worms}{percentage (x100) of apples harboring worms.}
#' }
#'
#' @source
#' Little, R. J. A., and Rubin, D. B. (1987) \emph{Statistical Analysis with Missing Data}. New York: Wiley, ISBN:0471802549.
#'
#' Cochran, W. G., and Snedecor, G. W. (1972) \emph{Statistical Methods}, 6th ed. Ames: Iowa State University Press, ISBN:0813815606.
#'
#' @examples
#' library(mvnmle)
#' data(apple)
#'
#' mlest(apple)
#'
#' @keywords datasets
"apple"
