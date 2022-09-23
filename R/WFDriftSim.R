#' @importFrom  stats rbinom
#' @importFrom  graphics lines
#' @import grDevices
NULL 

#' Simulating generations of genetic drift in a Wright–Fisher (WF) population
#'
#' \code{WFDriftSim} simulates genetic drift of diploid Wright–Fisher 
#' populations with a given effective population size through a certain number of 
#' generations.
#'
#' @param Ne Number giving the effective population size of the population
#' @param nGens Number of generations to be simulated.
#' @param p0 Initial frequency of a given allele. As the simulated organism is
#' diploid, the other alleles frequency will be \code{1-(p0)}. Default value 
#' is \code{0.5}.
#' @param nSim Number of simulations to be made. If decimals are inserted, 
#' they will be rounded. Default value is \code{1}.
#' @param plot Logical indicating if simulations should be plotted as colored 
#' lines. Each color represents a different population. Default value 
#' is \code{TRUE}.
#' @param printData Logical indicating whether all simulation results should be 
#' returned as a \code{data.frame}. Default value is \code{FALSE}.
#' 
#' @return If \code{plot = TRUE}, plots the timeseries of all simulations, 
#' with each line+color referring to a different simulation. Note that if 
#' many simulations (generally more than 20) are simulated, colors might be 
#' cycled and different simulation will have the same color. If 
#' \code{printData = TRUE}, returns a \code{data.frame} with the 
#' simulation results.
#' 
#' @details The effective population size (\code{Ne}) is strongly connected 
#' with the rate of genetic drift (for details, see Waples, 2022)
#' 
#' @export WFDriftSim
#' 
#' @references 
#' 
#' Fisher RA (1922) On the dominance ratio. Proc. R. Soc. Edinb 42:321–341
#' 
#' Kimura M (1955) Solution of a process of random genetic drift with a 
#' continuous model. PNAS–USA 41(3):144–150
#' 
#' Tran, T. D., Hofrichter, J., & Jost, J. (2013). An introduction to the 
#' mathematical structure of the Wright–Fisher model of population genetics. 
#' Theory in Biosciences, 132(2), 73-82. \[good for the historical review, 
#' math can be challenging\]
#' 
#' Waples, R. S. (2022). What is Ne, anyway?. Journal of Heredity.
#' 
#' Wright S (1931) Evolution in Mendelian populations. Genetics 16:97–159
#' 
#' @author Matheus Januario, Dan Rabosky, Jennifer Auler
#' 
#' @examples
#' #Default values:
#' WFDriftSim(Ne = 5, nGens = 30)
#' 
#' #A population which has already fixed one of the alleles:
#' WFDriftSim(Ne = 5, nGens = 30, p0=1)
#' 
#' #Many populations::
#' WFDriftSim(Ne = 5, nGens = 30, p0=0.2, nSim=20)
#' 
#' ######## continuing a previous simulation:
#' ngen_1stsim <- 10 # number of gens in the 1st sim:
#' sim1 <- WFDriftSim(Ne = 5, nGens = ngen_1stsim, p0=.2, nSim=20, 
#' plot = FALSE, printData = TRUE)

#' ngen_2ndsim <-15 # number of gens in the 2nd sim:
#' # now, note how we assigned p0:
#' sim2 <- WFDriftSim(Ne = 5, nGens = ngen_2ndsim, p0=sim1[,ncol(sim1)], 
#' plot = TRUE, nSim=20, printData = TRUE)
#' 
#' # if we want to merge both simulations, then we have to:
#' # remove first column of 2nd sim (because it repeats
#' # the last column of the 1st sim)
#' sim2 <- sim2[,-1]
#' 
#' # re-name 2nd sim columns:
#' colnames(sim2) <- paste0("gen", (ngen_1stsim+1):(ngen_1stsim+ngen_2ndsim))
#' 
#' #finally, merging both rounds of simulations:
#' all_sims <- cbind(sim1, sim2)
#' head(all_sims)
#' 
WFDriftSim=function(Ne, nGens, p0=0.5, nSim=1, plot=TRUE, printData=FALSE){
  
  # checking input:
  if(!(plot | printData)){
    stop("if both \"plot\" and \"printData\" are false, 
         there is nothing to be returned")
  }
  
  if(!class(nSim) %in% c("numeric", "integer")){
    stop("\"nSim\" has to be an integer")
  }else{
    # rounding number in case double was inputted
    nSim <- round(nSim, digits = 0) 
  }
  
  #if(p0<0 || p0>1){stop("\"p0\" must be between zero and one")}
  if(!(Ne>0)){stop("\"Ne\" must be an integer larger than zero")}
  if(!(nGens>0)){stop("\"nGens\" must be an integer number larger than zero")}

  # start matrix with generation "zero"
  p_through_time <- matrix(p0, ncol = 1, nrow=nSim)
  
  # calculating total n allelels for diploid organism
  n_alleles <- 2*Ne
  
  for(generation in 1:nGens){
    p_through_time <- cbind(p_through_time, 
          stats::rbinom(n = nSim, size = n_alleles, prob = p_through_time[,generation]) / n_alleles
          )
  }
  
  if(plot){
    dev.new()
    time = 2:nGens
    plot(NA, xlim=c(1,nGens), ylim=c(0,1),
         ylab="Allelic frequency", xlab="Generation",frame.plot=F)
    cols=grDevices::rainbow(nSim)
    for(j in time){
      for(i in 1:nSim){
        graphics::lines(x = time[1:j], y = p_through_time[i,1:j], col=cols[i])
      }
      Sys.sleep(0.1)
    }
  }  
  if(printData){
    # labeling output:
    rownames(p_through_time) <- paste0("sim", 1:nSim)
    colnames(p_through_time) <- paste0("gen", 0:nGens)
    
    # returning
    return(p_through_time)
  }
}





