#' Simulating a phylogenetic trees through the birth-death process
#'
#' \code{simulateTree} uses a birth-death process to simulate a phylogenetic 
#' tree, following the format of \code{ape} package's \code{phylo} object. The 
#' function is basically a wrapper for the \code{diversitree}'s \code{tree.bd} 
#' function.
#'
#' @param pars \code{numeric} vector with the simulation parameters: speciation 
#' (first slot) and extinction (second slot) rates, respectively. Should follow 
#' any formats stated in the function \code{tree.bd} from the 
#' \code{diversitree} package.
#' @param max.taxa Maximum number of taxa to include in the tree. If 
#' \code{Inf}, then the tree will be evolved until \code{max.t} time has passed.
#' @param min.taxa Minimum number of taxa to include in the tree.
#' @param max.t Maximum length to evolve the phylogeny over. If equal to 
#' \code{Inf}, then the tree will evolve until \code{max.taxa} 
#' extant taxa are present.
#' @param include.extinct A \code{logical} indicating if extinct taxa should 
#' be included in the final phylogeny.
#' 
#' @details see help page from \code{diversitree::tree.bd}
#' 
#' @return A \code{phylo} object
#' 
#' @export simulateTree
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
#'  FitzJohn, R. G. (2010). Analysing diversification with diversitree. 
#'   R Packag. ver, 9-2.
#'   
#'  FitzJohn, R. G. (2012). Diversitree: comparative phylogenetic analyses of 
#'  diversification in R. Methods in Ecology and Evolution, 3(6), 1084-1092.
#' 
#' @author Daniel Rabosky, Matheus Januario, Jennifer Auler
#' 
#' @examples
#' 
#' S <- 1
#' E <- 0
#' set.seed(1)
#' phy <- simulateTree(pars = c(S, E), max.taxa = 6, max.t=Inf)
#' ape::plot.phylo(phy)
#' ape::axisPhylo()
#' 
#' # alternatively, we can stop the simulation using time:
#' set.seed(42)
#' phy2 <- simulateTree(pars = c(S, E), max.t=7)
#' ape::plot.phylo(phy2)
#' ape::axisPhylo()
#' 
simulateTree <- function(pars, max.taxa = Inf, max.t, min.taxa = 2, include.extinct=FALSE){
  
  ############################################
  # check the classes of inputs and stop if any was inputted wrongly;
  ref_classes = c("numeric", "numeric", "numeric",  "numeric", "logical")
  input_names = names(unlist(formals(simulateTree)))
  input_list = list(pars, max.taxa, max.t, min.taxa, include.extinct)
  input_classes = unlist(lapply(input_list, class))
  
  if(any(! ref_classes == input_classes)){
    stop(paste0("\n \n ", input_names[which(input_classes != ref_classes)], " has the wrong object class. Please check the documentation of this function by typing: \n \n ??simulateTree"))
  }
  # end of checking inputs
  ############################################
  
  if(sum(is.infinite(c(max.t,max.taxa)))==2){
    stop("If \"max.taxa\" and \"max.t\" are infinite, the simulation will never stop")
  }
  
  badcount <- 0;
  while (1){
    
    tree <- diversitree::tree.bd(pars, max.taxa=max.taxa, max.t=max.t, 
                                 include.extinct=include.extinct);
    if (!is.null(tree)){
      if (length(tree$tip.label) >= min.taxa){
        break;
      }
    }
    
    badcount <- badcount + 1;
    if (badcount > 200){
      stop("Too many trees going extinct\n");
    }
  }
  tree$node.label <- NULL;
  
  tree <- checkAndFixUltrametric(tree)
  return(tree);
}
