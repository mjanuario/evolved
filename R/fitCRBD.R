#' @importFrom ape is.binary.phylo
NULL
#' Fit a constant-rate birth-death process to a phylogeny
#'
#' \code{fitCRBD} fits a constant-rate birth-death process to a phylogeny in the
#'  format of \code{ape} package's \code{phylo} object. Optimization is based on
#'   likelihood functions made with \code{diversitree}. This function is 
#'   basically a wrapper for the \code{diversitree}'s \code{make.bd} function.
#'
#' @param phy A \code{phylo} object, following terminology from package 
#' \code{ape}, in which function will operate.
#' @param n.opt Number of optimizations that will be tried by function.
#' @param l.min Lower bound for optimization. Default value is \code{0.001}.
#' @param l.max Upper bound for optimization. Default value is \code{5}.
#' @param max.bad Maximum number of unsuccessful optimization attempts. Default 
#' value is \code{200}.
#' 
#' @seealso see help page from \code{diversitree::make.bd} and 
#' \code{stats::optim}
#' 
#' @return A \code{numeric} with the best estimates of speciation \code{S} 
#' and extinction \code{E} rates.
#' 
#' @export fitCRBD
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
#'   R Package. ver, 9-2.
#'   
#'  FitzJohn, R. G. (2012). Diversitree: comparative phylogenetic analyses of 
#'  diversification in R. Methods in Ecology and Evolution, 3(6), 1084-1092.
#' 
#' @author Daniel Rabosky, Matheus Januario, Jennifer Auler
#' 
#' @examples
#' 
#' S <- 0.1
#' E <- 0.1
#' set.seed(1)
#' phy <- simulateTree(pars = c(S, E), max.taxa = 30, max.t = 8)
#' fitCRBD(phy)
#' 
fitCRBD <- function(phy, n.opt=5, l.min=0.001, l.max=5.0, max.bad = 200){
  
  ############################################
  # check the classes of inputs and stop if any was inputted wrongly:
  
  if(!ape::is.binary.phylo(phy)){
    stop("phy is not a binary phylogeny")
  }
  
  ref_classes = c("numeric","numeric","numeric","numeric")
  input_names = names(unlist(formals(fitCRBD)))[-1]
  input_list = list(n.opt, l.min, l.max, max.bad)
  input_classes = unlist(lapply(input_list, class))
  
  if(any(! input_classes== ref_classes)){
    stop(paste0("\n \n", input_names[which(input_classes != ref_classes)], " has the wrong object class. Please check the documentation of this function by typing: \n \n ??fitCRBD"))
  }
  
  if(any(!input_list>0)){
    stop(paste0("\n \n", input_names[input_list>0], " should be larger than zero"))
  }
  
  # end of checking inputs
  ############################################
  
  if (length(phy$tip.label) < 3){
    pars <- c(0.0001,0)
    names(pars) <- c("S", "E")
    return(pars)
  }
  
  fx <- diversitree::make.bd(phy)
  
  for (i in 1:n.opt){
    
    lam <- runif(1, 0, 0.5)	
    E <- lam * runif(1, 0, 1)
    
    badcount <- 0
    
    resx <- try(stats::optim(c(lam, E) ,fx, method='L-BFGS-B', control=list(maxit=1000, fnscale=-1), lower=l.min, upper=l.max), silent=T)
    while (class(resx) == 'try-error'){
      
      lam <- runif(1, 0, 0.5)	
      E <- lam * runif(1, 0, 1)
      
      resx <- try(stats::optim(c(lam, E) , fx, method='L-BFGS-B', control=list(maxit=1000, fnscale=-1), lower=l.min, upper=l.max), silent=T);
      
      badcount <- badcount + 1;
      if (badcount > max.bad){
        stop("Too many fails in fitDiversitree\n")
      }
    }
    
    if (i == 1){
      best <- resx
    }else{
      if (best$value < resx$value){
        best <- resx
      }
    }
    
  }
  
  fres <- list(pars=best$par, loglik=best$value)
  fres$AIC <- -2*fres$loglik + 2*length(diversitree::argnames(fx))
  fres$counts <- best$counts
  #fres$like_function <- fx
  fres$convergence <- best$convergence
  fres$message <- best$message
  
  pars <- fres$pars
  names(pars) <- c("S", "E")
  
  return(pars)
}
