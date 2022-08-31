#' Simulating one generation of genotypes under Hardy-Weinberg equilibrium
#'
#' \code{OneGenHardyWeibergSim} creates \code{nSim} simulations of one 
#' generation of genotypes under Hardy-Weinberg equilibrium for a 
#' bi-allelic loci.
#'
#' @param nInd Integer indicating the census size of the simulated populations. 
#' If decimals are inserted, they will be rounded.
#' @param p Numerical between zero and one that indicates A1's allelic 
#' frequency. A2's allelic frequency is assumed to be \code{1-p}.
#' @param nSim Number of simulations to be made. If decimals are inserted, 
#' they will be rounded.
#' @return A \code{data.frame} containing the number of individuals for each 
#' genotype
#' @references 
#' 
#' Hardy, G. H. (1908). Mendelian proportions in a mixed 
#' population. Science, 28, 49–50.
#' 
#' Weinberg, W. (1908). Uber den Nachweis der Vererbung beim Menschen. 
#' Jahreshefte des Vereins für vaterlandische Naturkunde in Wurttemberg, 
#' Stuttgart 64:369–382. [On the demonstration of inheritance in humans]. 
#' Translation by R. A. Jameson printed in D. L. Jameson (Ed.), (1977). 
#' Benchmark papers in genetics, Volume 8: Evolutionary genetics (pp. 
#' 115–125). Stroudsburg, PA: Dowden, Hutchinson & Ross.
#' 
#' Mayo, O. (2008). A century of Hardy–Weinberg equilibrium. Twin Research 
#' and Human Genetics, 11(3), 249-256.
#' 
#' @author Matheus Januario
#' 
#' @examples
#' #using the defalut values (nInd = 50, p = 0.5, nSim = 100):
#' OneGenHardyWeinbergSim()
#' 
#' #Simulating with a already fixed allelle:
#' OneGenHardyWeinbergSim(nInd = 50, p = 1)
#' 
#' # Testing if the simulation works:
#' A1freq <- .789 #any value could work
#' nSimul <- 100
#' simulations=OneGenHardyWeinbergSim(nInd = nSimul, nSim = nSimul, p = A1freq)
#' 
#' #expected:
#' c(A1freq^2, 2*A1freq*(1-A1freq), (1-A1freq)^2)
#' 
#' #simulated:
#' apply(X = simulations, MARGIN = 2, FUN = function(x){mean(x)/nSimul})
#' 
OneGenHardyWeinbergSim <- function(nInd=50, p=0.5, nSim=100){
  
  ######## Checking input:
  if(!(nInd>0)){stop("\"nInd\" must be an integer number larger than zero")}
  if(p<0 | p>1){stop("\"p\" must be between zero and one")}
  if(!(nSim>0)){stop("\"nSim\" must be an integer number larger than zero")}
  ########################  
  
  # Vector of genotypes:
  genotypes <- c("A1A1", "A1A2", "A2A2")
  
  # Expected genotype-specific frequencies by HW:
  HWprob_genotypes <- c(p^2, 2*p*(1-p), (1-p)^2)
  
  ######## Simulation:
  res <- data.frame()
  for(i in 1:nSim){
    
    #creating gamete pool:
    gamete_pool <- c(rep("A1", times=2*p*nInd), 
                     rep("A2", times=2*(1-p)*nInd))
    
    #mixing gamete pool:
    gamete_pool <- sample(gamete_pool)
    
    #creating random genotypes:
    genotype_random_draw <- paste0(
         gamete_pool[1:nInd], 
         gamete_pool[(nInd+1):length(gamete_pool)]
         )
    
    #A1A2 and A2A1 are the same genotype, so let's convert this:
    genotype_random_draw[genotype_random_draw=="A2A1"] <- "A1A2"
    
    #tabulating genotypes:
    tab_genRdmDraw <- table(genotype_random_draw)
    
    res <- rbind(res, tab_genRdmDraw)  
  }
  ########################
  
  ######## Finishing touches: naming columns...
  if(p %in% c(0,1)){
    if(p==1){
      colnames(res) <- "A1A1"
    }else{
      colnames(res) <- "A2A2"
    }
  }else{
    colnames(res) <- genotypes
  }
  # ...and rows:
  rownames(res) <- paste0("sim_", 1:nSim)
  ########################
  
  return(res)
}

