#' @importFrom stats runif
#' @importFrom stats rgeom
NULL
#' Simulating diversity through birth-death processes
#'
#' \code{simulateBirthDeath} calculates the number of species at a certain 
#' point in time.
#'
#' @param t Point in time which diversity will be simulated.
#' @param S A numeric representing the per-capita speciation rate (in number 
#' of events per lineage per million years). Must be larger than \code{E}.
#' @param E A numeric representing the per-capita extinction rate (in number 
#' of events per lineage per million years). Must be smaller than \code{S}.
#' @param R A numeric representing the per-capita Net Diversification 
#' rate (i.e., \code{R} = \code{S} - \code{E}). Must be a positive number.
#' @param K A numeric representing the extinction fraction (i.e., 
#' \code{K} = \code{E} / \code{S}). Must be either zero or a positive 
#' which is number smaller than one.
#' 
#' @details The function only accepts as inputs \code{S} and \code{E}, or
#'  \code{K} and \code{R}.
#'  
#' @return A \code{data.frame} containing the diversity (column \code{div}) of 
#' the chosen taxonomic level, through time - with time moments being a 
#' sequence of arbitrary numbers based on \code{bin_reso}.
#' 
#' @export simulateBirthDeathRich
#' 
#' @references 
#' 
#' Raup, D. M. (1985). Mathematical models of cladogenesis. 
#' Paleobiology, 11(1), 42-52.
#' 
#' @author Matheus Januario, Daniel Rabosky, Jennifer Auler
#' 
#' @examples
#' # running a single simulation:
#' SS <- 0.40
#' EE <- 0.09
#' tt <- 10 #in Mya
#' simulateBirthDeathRich(t = tt, S = SS, E = EE)
#' 
#' #running many simulations and graphing results:
#' nsim <- 1000
#' res <- vector()
#' for(i in 1:nsim){
#'   res <- c(res, 
#'   simulateBirthDeathRich(t = tt, S = SS, E = EE))
#' }
#' plot(table(res)/length(res),
#'      xlab="Richness", ylab="Probability")
simulateBirthDeathRich=function(t, S=NULL, E=NULL, K=NULL, R=NULL){
  
  #checking if input it correct:
  test1 = sum(unlist(lapply(list(S, E), is.null))) == 2 
  test2 = sum(unlist(lapply(list(K, R), is.null))) == 2
  if(test1 & test2){
    stop("Please input only S and E, or input only K and R")
  }else if(!test1 & !test2){
    stop("Please input only S and E, or input only K and R")
  }
  
  #converting K nd R to S and E
  if(!(is.null(c(S, E)))){
    R=S-E
    K=E/S
  }else{ #converting K nd R to S and E
    S=-R/(K-1)
    E=S-R  
  }
  
  #only calculates diversity if R is positive:
  if(!S>E){
    stop("\"S\" has to be larger than \"E\" (or, \"R\" has to be positive")
  }
  # and if K is in the right interval:
  if((K<0) | (K>=1)){
    stop("\"K\" must be either zero or a positive which is number smaller than one.")
  }
  
  #From Raup (1985)
  gpar <- 1 - (exp(R * t) - 1)/ (exp(R * t) - K)
  p0t <- K * (exp(R * t) - 1)/ (exp(R * t) - K)	
    
  if(runif(1)>p0t){ #if lineage survived:
    rich <- 1+ rgeom(1, prob=gpar)
  }else{ #if died:
    rich=0
  }

  return(rich)
}
