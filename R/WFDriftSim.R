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
#' @param n.gen Number of generations to be simulated.
#' @param p0 Initial frequency of a given allele. As the simulated organism is
#' diploid, the other alleles frequency will be \code{1-(p0)}. Default value 
#' is \code{0.5}.
#' @param n.sim Number of simulations to be made. If decimals are inserted, 
#' they will be rounded. Default value is \code{1}.
#' @param plot.type Character indicating if simulations should be plotted as colored 
#' lines. Each color represents a different population. If 
#' \code{plot.type = "animate"} (default value) it animates each generation 
#' individually. If \code{plot.type = "static"} it plots all lines rapidly. If 
#' \code{plot.type = "none"} nothing is plotted.
#' @param print.data Logical indicating whether all simulation results should be 
#' returned as a \code{data.frame}. Default value is \code{FALSE}.
#' @param knitr Logical indicating if plot is intended to show up in RMarkdown files made by the \code{Knitr} R package.
#' 
#' @return If \code{plot.type = "static"} or \code{"animate"}, plots the
#' timeseries of all simulations, with each line+color referring to a 
#' different simulation. Note that if many simulations (generally more 
#' than 20) are simulated, colors might be cycled and different simulation 
#' will have the same color. If \code{print.data = TRUE}, returns a 
#' \code{data.frame} with the simulation results.
#' 
#' @details The effective population size (\code{Ne}) is strongly connected 
#' with the rate of genetic drift (for details, see Waples, 2022).
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
#' \donttest{
#' #Default values:
#' WFDriftSim(Ne = 5, n.gen = 10, knitr = TRUE)
#' 
#' #A population which has already fixed one of the alleles:
#' WFDriftSim(Ne = 5, n.gen = 10, p0=1, knitr = TRUE)
#' 
#' #Many populations::
#' WFDriftSim(Ne = 5, n.gen = 10, p0=0.2, n.sim=10, knitr = TRUE)
#' 
#' ######## continuing a previous simulation:
#' n.gen_1stsim <- 10 # number of gens in the 1st sim:
#' sim1 <- WFDriftSim(Ne = 5, n.gen = n.gen_1stsim, p0=.2, n.sim=10, 
#' plot.type = "none", print.data = TRUE, knitr = TRUE)

#' n.gen_2ndsim <-7 # number of gens in the 2nd sim:
#' # now, note how we assigned p0:
#' sim2 <- WFDriftSim(Ne = 5, n.gen = n.gen_2ndsim, p0=sim1[,ncol(sim1)], 
#' plot.type = "static", n.sim=10, print.data = TRUE, knitr = TRUE)
#' 
#' # if we want to merge both simulations, then we have to:
#' # remove first column of 2nd sim (because it repeats
#' # the last column of the 1st sim)
#' sim2 <- sim2[,-1]
#' 
#' # re-name 2nd sim columns:
#' colnames(sim2) <- paste0("gen", (n.gen_1stsim+1):(n.gen_1stsim+n.gen_2ndsim))
#' 
#' #finally, merging both rounds of simulations:
#' all_sims <- cbind(sim1, sim2)
#' head(all_sims)
#' }
#' 
WFDriftSim=function(Ne, n.gen, p0=0.5, n.sim=1, plot.type="animate", print.data=FALSE, knitr = FALSE){
  
  ############################################
  # check the classes of inputs and stop if any was inputted wrongly;
  ref_classes = c("numeric", "numeric", "numeric", "numeric", "character", "logical")
  input_names = names(unlist(formals(WFDriftSim)))
  input_list = list(Ne, n.gen, p0, n.sim, plot.type, print.data)
  input_classes = unlist(lapply(input_list, class))
  
  if(any(! ref_classes == input_classes)){
    stop(paste0("\n \n ", input_names[which(input_classes != ref_classes)], " has the wrong object class. Please check the documentation of this function by typing: \n \n ??WFDriftSim"))
  }
  # end of checking inputs
  ############################################
  
  # checking input:
  if(plot.type=="none" & print.data==FALSE){
    stop("if both \"plot.type\" and \"print.data\" are false, 
         there is nothing to be returned")
  }
  
  if(!(plot.type %in% c("animate", "static", "none"))){
    stop("\"plot.type\" has to be equal to \"animate\", \"static\", or  \"none\"")
  }
  
  if(!class(n.sim) %in% c("numeric", "integer")){
    stop("\"n.sim\" has to be an integer")
  }else{
    # rounding number in case double was inputted
    n.sim <- round(n.sim, digits = 0) 
  }
  
  #if(p0<0 || p0>1){stop("\"p0\" must be between zero and one")}
  if(!(Ne>0)){stop("\"Ne\" must be an integer larger than zero")}
  if(!(n.gen>0)){stop("\"n.gen\" must be an integer number larger than zero")}
  
  # start matrix with generation "zero"
  p_through_time <- matrix(p0, ncol = 1, nrow=n.sim)
  
  # calculating total n alleles for diploid organism
  n_alleles <- 2*Ne
  
  for(generation in 1:n.gen){
    p_through_time <- cbind(p_through_time, 
                            stats::rbinom(n = n.sim, size = n_alleles, 
                                          prob = p_through_time[,generation]) / n_alleles
    )
  }
  
  if(plot.type %in% c("static", "animate")){
    plotWFDrift(p_through_time, plot.type = plot.type, knitr = knitr)
  }  
  if(print.data){
    # labeling output:
    rownames(p_through_time) <- paste0("sim", 1:n.sim)
    colnames(p_through_time) <- paste0("gen", 0:n.gen)
    
    # returning
    return(p_through_time)
  }
}
