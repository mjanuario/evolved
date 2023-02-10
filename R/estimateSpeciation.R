#' Estimate speciation assuming a pure-birth process
#'
#' \code{estimateSpeciation} Estimates the speciation rate asusming a 
#' constant-rate, pure-birth model.
#'
#' @param phy A \code{phylo} object, following terminology from package 
#' \code{ape} in which function will operate.
#' 
#' @return A \code{numeric} with the estimated speciation rate.
#' 
#' @export estimateSpeciation
#' 
#' @author Daniel Rabosky, Matheus Januario, Jennifer Auler
#' 
#' @examples
#' S <- 1
#' E <- 0
#' set.seed(1)
#' phy <- simulateTree(pars = c(S, E), max.taxa = 6)
#' estimateSpeciation(phy)
#' 
estimateSpeciation <- function(phy){
  return((length(phy$tip.label)-2) / sum(phy$edge.length))
}