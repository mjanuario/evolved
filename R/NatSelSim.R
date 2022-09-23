#'@import graphics
#'@importFrom utils head
NULL

#' Simulating natural selection through time in a bi-allelic gene
#'
#' \code{NatSelSim} simulates natural selection in a bi-allelic gene through 
#' \code{NGen} generations.
#'
#' @param w11 Number giving the fitness of genotype A1A1. Values will be 
#' normalized if any genotype fitness exceeds one.
#' @param w12 Number giving the fitness of genotype A1A2. Values will be 
#' normalized if any genotype fitness exceeds one.
#' @param w22 Number giving the fitness of genotype A2A2. Values will be 
#' normalized if any genotype fitness exceeds one.
#' @param p0 Initial (time = 0) allelic frequency of A1. 
#' A2's initial allelic frequency is \code{1-p0}.
#' @param NGen Number of generation that will be simulated.
#' @param printData Logical indicating whether all simulation results should be
#' returned as a \code{data.frame}. Default value is \code{FALSE}.
#' 
#' @return A \code{data.frame} containing the number of individuals for each 
#' genotype.
#' 
#' @export NatSelSim
#' 
#' @details If any value of fitness (i.e., \code{w11}, \code{w12}, 
#' \code{w22}) is larger than one, fitness is interpreted as absolute fitness 
#' and values are re-normalized.
#' 
#' @references 
#' 
#' 
#' @author Matheus Januario, Jennifer Auler, Dan Rabosky
#' 
#' @examples
#' 
#' #using the default values (w11=1, w12=1, w22=0.9, p0=0.5, NGen=10):
#' NatSelSim()
#' 
#' # Continuing a simulation for extra time:
#' # Run the first simulation
#' sim1=NatSelSim(w11 = .4, w12 = .5, w22 = .4, p0 = 0.35, printData = TRUE)
#' 
#' # Then take the allelic frequency form the first sim:
#' new_p0 <- (sim1$AA[nrow(sim1)] + sim1$Aa[nrow(sim1)]*1/2) 
#' # and use as p0 for a second one:
#' 
#' NatSelSim(w11 = .4, w12 = .5, w22 = .4, p0 = new_p0, NGen = 20)
#' 
#' 
NatSelSim <- function(w11=1, w12=1, w22=0.9, p0=0.5, NGen=10, printData=FALSE){
  
  #checking input:
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
  w_t <- apply(gen_HW0 * W_gntp, 1, sum) #vector to store mean population fitness through time
  
  s <- abs(diff(c(w11, w22))) #calculating s h <- (-w12+1)/s #calculating h (!!!)
  #####
  # Now we run the simulation in time: 
  for(gen in 1:NGen){
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
  
  #store final states of simulation:
  p_end <- p_t[length(p_t)]
  
  p0_prime <- ( (p0^2 * w11) + (p0*(1-p0)*w12) ) / w_t[1] 
  pend_prime <- ( (p_end^2 * w11) +(p_end*(1-p_end)*w12) ) / w_t[length(w_t)]
  
  delta_p0 <- p0_prime-p0 
  delta_p_end <- pend_prime-p_end # end of simulation in time #####
  #####
  # Now we will estimate the behavior of this system under different values of p
  #creating vector with many values of p:
  p <- seq(0,1, by=0.01) #values of p
  #genotype as a function of p:
  gntp_p <- data.frame(gntp11=p^2, gntp12=2*p*(1-p), gntp22=(1-p)^2)
  
  #auxiliary data frame with the fitness for each genotype
  w_aux <- data.frame(W11=rep(W_gntp[1], times=length(p)), W12=rep(W_gntp[2], times=length(p)), W22=rep(W_gntp[3], times=length(p)))
  #mean fitness as a function of p
  w_p <- apply(gntp_p * w_aux, 1, sum)
  #This is just an auxiliary dataframe containig a weight.
  # Basically, it stores the "contribution" of each genotype # to "p". 
  # If this still seems too abstract, call your GSI 
  a_aux <- data.frame(W11=rep(1, times=length(p)),
  W12=rep(0.5, times=length(p)), W22=rep(0, times=length(p)))
  #Delta p as a function of p:
  # apply selection to HWE genotypes, then multiply by # the weight just created:
  new_p_aux <- (gntp_p * w_aux* a_aux)
  #normalize by mean fitness:
  p_prime <- ((new_p_aux[,1]+new_p_aux[,2])/w_p)
  # calculate diff between p pre and post selection: 
  delta_p <- p_prime-p
  #####
  #####
  #Plotting all panels
  par(mfrow=c(2,2))
  
  #Difference in p as a function of p:
  plot(x=p, y=delta_p, type="l", lwd=4, col="blue", 
       ylim=c(min(c(0-(.1*max(delta_p)), delta_p)), max(c(0, delta_p))), 
       xlab="p", ylab=expression(Delta * "p"),
       main="Adaptive landscape", frame.plot = F)
  
  #now just adding some extra info:
  # zero change in fitness line:
  abline(h=0, col="black", lty=2)
  #adding simulation’s initial/final allele freq 
  points(x=c(p0, p_end),y=c(delta_p0, delta_p_end),
  pch=c(20,8), col="black", cex=.5)
  #legend("topright", pch=c(20,8), legend = c("p_0", "p_end"))
  
  #Mean fitness as a function of p:
  plot(x=p, y=w_p, type="l", lwd=3, xlab="p",
     ylab="Mean population fitness", col="red",
     ylim=c(min(c(w_t, w11, w12, w22)*0.8), max(c(w_t, w11, w12, w22))),
     frame.plot = F, main="Genotype-specific fitness")
  points(x=c(0,0.5,1),
       y=c(w22, w12, w11), pch=16, col="blue", cex=1.5)
  text(x=c(0.05,0.55,0.95),y=c(w22, w12, w11)-0.05, pch=16, col="blue", 
       cex=1, labels = c("w22", "w12", "w11"), srt=-20)
  
  #Mean fitness as a function of time:
  plot(x=t, y=w_t, type="l", lwd=3, frame.plot = F,
         ylab="Mean population fitness", xlab="Time", col="red",
       lty=6, main="Mean fitness through time")
  #Genotype frequencies through time:
  plot(x=t, y=gen_HW[,1], type="l", lwd=3, xlab="Time", 
       frame.plot = F, main="Genotypic frequency through time",
       ylab="Genotypic Frequency", ylim=c(0,1.1))
  lines(x=t, y=gen_HW[,2], col="grey60", lwd=3) 
  lines(x=t, y=gen_HW[,3], col="grey80", lwd=3, lty=2) 
  abline(h=c(1,0), lty=3, cex=0.55)
  #legend(x=0, y=1.1, lty = c(1,1,2), col = c("black", "grey60", "grey80"),legend=c("A1A1", "A1A2", "A2A2"), lwd = 3)
  
  par(mfrow=c(1,1))
  
  if(printData){
    return(head(gen_HW))
  }
}
