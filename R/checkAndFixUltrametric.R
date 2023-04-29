#' @importFrom ape is.binary.phylo
NULL
#' Find and fix small rounding errors in ultrametric trees
#'
#' \code{checkAndFixUltrametric} finds and correct small numerical errors that 
#' might appear in ultrametric trees that where created through simulations. 
#' This function should never be used as a formal statistical method to make a 
#' tree ultrametric, as it was designed just to correct small rounding errors.
#'
#' @param phy A \code{phylo} object, following terminology from package 
#' \code{ape} in which function will operate.
#' 
#' @return A check and fixed \code{phylo} object.
#' 
#' @export checkAndFixUltrametric
#' 
#' @references 
#' 
#' Paradis, E. (2012). Analysis of Phylogenetics and Evolution with R (Vol. 2).
#'  New York: Springer.
#' 
#' Popescu, A. A., Huber, K. T., & Paradis, E. (2012). ape 3.0: New tools for 
#'  distance-based phylogenetics and evolutionary analysis in R. Bioinformatics,
#'   28(11), 1536-1537.
#' 
#' @author Daniel Rabosky, Matheus Januario, Jennifer Auler
#' 
#' @examples
#' S <- 1
#' E <- 0
#' set.seed(1)
#' phy <- simulateTree(pars = c(S, E), max.taxa = 6, max.t = 5)
#' phy$edge.length[1] <- phy$edge.length[1]+0.1
#' ape::is.ultrametric(phy)
#' phy <- checkAndFixUltrametric(phy)
#' ape::is.ultrametric(phy)
#' 
checkAndFixUltrametric <- function(phy){
  
  if(!ape::is.binary.phylo(phy)){
    stop("phy is not a binary phylogeny")
  }
  
  if (!ape::is.ultrametric(phy)){
    
    vv <- ape::vcv.phylo(phy)
    dx <- diag(vv)
    mxx <- max(dx) - dx
    for (i in 1:length(mxx)){
      phy$edge.length[phy$edge[,2] == i] <- phy$edge.length[phy$edge[,2] == i] + mxx[i]
    }
    if (!ape::is.ultrametric(phy)){
      stop("Ultrametric fix failed\n")
    }	
  }
  
  return(phy)
}