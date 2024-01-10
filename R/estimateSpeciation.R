#' @importFrom ape is.binary.phylo
NULL
#' Estimate speciation assuming a pure-birth process
#'
#' \code{estimateSpeciation} Estimates the speciation rate assuming a 
#' constant-rate, pure-birth model.
#'
#' @param phy A \code{phylo} object, following terminology from package 
#' \code{ape} in which function will operate.
#' 
#' @return A \code{numeric} with the estimated speciation rate.
#' 
#' @export estimateSpeciation
#' 
#' @references Yule G.U. 1925. A mathematical theory of evolution, based on the conclusions of Dr. JC Willis, FRS. Philosophical Transactions of the Royal Society of London. Series B, Containing Papers of a Biological Character. 213:21–87.
#' 
#' @author Daniel Rabosky, Matheus Januario, Jennifer Auler
#' 
#' @examples
#' S <- 1
#' E <- 0
#' set.seed(1)
#' phy <- simulateTree(pars = c(S, E), max.taxa = 6, max.t = 5)
#' estimateSpeciation(phy)
#' 
estimateSpeciation <- function(phy){
  
  if(!ape::is.binary.phylo(phy)){
    stop("phy is not a binary phylogeny")
  }
  
  return((length(phy$tip.label)-2) / sum(phy$edge.length))
}