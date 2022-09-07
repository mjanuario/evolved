#' Simulating generations of genetic drift in a Wright–Fisher (WF) population
#'
#' \code{WFDriftSim} simulates Wright–Fisher, diploid populations with a given
#'  effective size through a certain number of generations.
#'
#' @param N Number giving the effective size of the population
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
#' 
#' @author Matheus Januario
#' 
#' @examples
#' #Default values:
#' WFDriftSim(N = 5, nGens = 30)
#' 
#' #A population which has already fixed one of the alleles:
#' WFDriftSim(N = 5, nGens = 30, p0=1)
#' 
#' #Many populations::
#' WFDriftSim(N = 5, nGens = 30, p0=0.2, nSim=20)
#' 
#' ######## continuing a previous simulation:
#' ngen_1stsim <- 10 # number of gens in the 1st sim:
#' sim1 <- WFDriftSim(N = 5, nGens = ngen_1stsim, p0=.2, nSim=20, 
#' plot = FALSE, printData = TRUE)

#' ngen_2ndsim <-15 # number of gens in the 2nd sim:
#' # now, note how we assigned p0:
#' sim2 <- WFDriftSim(N = 5, nGens = ngen_2ndsim, p0=sim1[,ncol(sim1)], 
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
WFDriftSim=function(N, nGens, p0=0.5, nSim=1, plot=TRUE, printData=FALSE){
  
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
  
  # start matrix with generation "zero"
  p_through_time <- matrix(p0, ncol = 1, nrow=nSim)
  
  # calculating total n allelels for diploid organism
  n_alleles <- 2*N 
  
  for(generation in 1:nGens){
    p_through_time <- cbind(p_through_time, 
          stats::rbinom(n = nSim, size = n_alleles, prob = p_through_time[,generation]) / n_alleles
          )
  }
  
  if(plot){
    plot(NA, xlim=c(1,nGens), ylim=c(0,1),
         ylab="Allelic frequency", xlab="Generation",frame.plot=F)
    cols=grDevices::rainbow(nSim)
    for(i in 1:nSim){
      graphics::lines(x = 0:nGens, y = p_through_time[i,], col=cols[i])  
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





