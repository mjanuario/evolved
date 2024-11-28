#'@import graphics
NULL

#' Simulating natural selection through time in a bi-allelic gene
#'
#' \code{NatSelSim} simulates natural selection in a bi-allelic gene through 
#' \code{n.gen} generations.
#'
#' @param w11 Number giving the fitness of genotype A1A1. Values will be 
#' normalized if any genotype fitness exceeds one.
#' @param w12 Number giving the fitness of genotype A1A2. Values will be 
#' normalized if any genotype fitness exceeds one.
#' @param w22 Number giving the fitness of genotype A2A2. Values will be 
#' normalized if any genotype fitness exceeds one.
#' @param p0 Initial (time = 0) allelic frequency of A1. 
#' A2's initial allelic frequency is \code{1-p0}.
#' @param n.gen Number of generation that will be simulated.
#' @param plot.type String indicating if plot should be animated. 
#' The default, "animateall" animate all possible panels. 
#' Other options are "static" (no animation), "animate1", "animate3", or 
#' "animate4". Users can animate each panel individually (using 
#' \code{plot.type = "animateX"}, with X being the panel which one wants to 
#' animate (so options are  "animate1",  "animate3",  and "animate4" 
#' (see return for more info). 
#' @param print.data Logical indicating whether all 
#' simulation results should be returned as a \code{data.frame}. Default value
#' is \code{FALSE}.
#' @param knitr Logical indicating if plot is intended to show up in RMarkdown files made by the \code{Knitr} R package.
#' 
#' @return If \code{print.data = TRUE}, it returns a \code{data.frame} 
#' containing the number of individuals for each genotype through time. The 
#' plots done by the function shows (1) Allele frequency change through time. 
#' (2) The adaptive landscape (which remains static during the whole simulation, 
#' so can't be animated), (3) Time series of mean population fitness, 
#' and (4) Time series of genotypic population frequencies. 
#' 
#' @export NatSelSim
#' 
#' @details If any value of fitness (i.e., \code{w11}, \code{w12}, 
#' \code{w22}) is larger than one, fitness is interpreted as absolute fitness 
#' and values are re-normalized.
#' 
#' @references 
#' 
#' Fisher, R. A. (1930). The Fundamental Theorem of Natural Selection. In: The genetical theory of natural selection. The Clarendon Press
#' 
#' Plutynski, A. (2006). What was Fisher’s fundamental theorem of natural selection and what was it for?. Studies in History and Philosophy of Science Part C: Studies in History and Philosophy of Biological and Biomedical Sciences, 37(1), 59-82.
#' 
#' @author Matheus Januario, Jennifer Auler, Dan Rabosky
#' 
#' @examples
#' 
#' #using the default values (w11=1, w12=1, w22=0.9, p0=0.5, n.gen=10)
#' \donttest{NatSelSim()}
#' 
#' # Continuing a simulation for extra time:
#' # Run the first simulation
#' sim1=NatSelSim(w11 = .4, w12 = .5, w22 = .4, p0 = 0.35, 
#' n.gen = 5, plot.type = "static", print.data = TRUE, knitr = TRUE)
#' 
#' # Then take the allelic frequency form the first sim:
#' new_p0 <- (sim1$AA[nrow(sim1)] + sim1$Aa[nrow(sim1)]*1/2) 
#' # and use as p0 for a second one:
#' 
#' NatSelSim(w11 = .4, w12 = .5, w22 = .4, p0 = new_p0, n.gen = 5, plot.type = "static", knitr = TRUE)
#' 
#' 
NatSelSim <- function(w11=1, w12=1, w22=0.9, p0=0.5, n.gen=10, plot.type = "animateall", print.data=FALSE, knitr = FALSE){
  
  #checking input:
  if(length(plot.type)!=1 | !inherits(x = plot.type, what = "character") | any(!plot.type %in% c("animateall", "static", "animate1", "animate3", "animate4")))
  {
    warning("Invalid plot type. Plotting as \"animateall\"")
  }
  
  if(any(c(w11, w12, w22)<00)){
    stop("All fitness must be positive or zero")
  }
  
  if(sum(c(w11, w12, w22))==0){
    stop("At least one fitness should be a positive number")
  }
  
  if(any(c(w11, w12, w22)>1)){
    #normalizing W to get relative fitness   
    warning("Absolute fitness will be transformed into relative fitness")
    
    w11 <- w11/max(c(w11, w12, w22))
    w12 <- w12/max(c(w11, w12, w22))
    w22 <- w22/max(c(w11, w12, w22))
  }
  
  #Make genotypes
  gen_HW0 <- data.frame(AA = p0^2, Aa = 2*p0*(1-p0), aa=(1-p0)^2)
  gen_HW <- gen_HW0 
  
  #creating table that will store the simulated genot. freqs.:
  W_gntp <- c(w11, w12, w22) #making a fitness vector
  t <- 0 #vector to store time
  p_t <- p0 #vector to store p through time
  w_t <- vector()#apply(gen_HW0 * W_gntp, 1, sum) #vector to store mean population fitness through time
  
  s <- abs(diff(c(w11, w22))) #calculating s h <- (-w12+1)/s #calculating h (!!!)
  #####
  # Now we run the simulation in time: 
  for(gen in 1:n.gen){
    #multiply genotype frequencies by genotype relat. fitness:
    aux <- gen_HW[gen,] * W_gntp
    #normalize frequencies and store new genot. freq.
    aux2 <- aux/sum(aux)
    #calc mean population fitness:
    w_t <- c(w_t, round(sum(aux), digits = 15)) #get new p from normalized genotypes:
    p_sel <- p_t[length(p_t)] #p before selection
    #apply selection to:
    p_gen <- ( (p_sel^2 * w11) +
                 (p_sel*(1-p_sel)*w12) ) / w_t[length(w_t)]
    #store new p:
    p_t <- c(p_t, p_gen)
    #create next generation genotypes following HWE:
    gen_HW[gen+1,] <- c(p_gen^2, 2*(p_gen)*(1-p_gen), (1-p_gen)^2)
    #update t:
    t <- c(t, gen) 
  }
  
  plotNatSel(gen.HW = gen_HW, p.t = p_t, w.t = w_t, t = t, W.gntp = c(w11, w12, w22), plot.type = plot.type, knitr = knitr)
  
  if(print.data){
    return(gen_HW)
  }
}