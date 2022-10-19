simulateBirthDeath=function(t, S=NULL, E=NULL, K=NULL, R=NULL){
  
  #checking if input it correct:
  test=sum(unlist(lapply(list(S, E), is.null))) + sum(unlist(lapply(list(K, R), is.null)))
  if(test!=2){
    stop("Please insert S and E, or K and R")
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
  if(E>S){
    stop("E cannot be larger than S")
  }
  
  
    
    #From Raup (1985, paleobiol)
    gpar <- 1 - (exp(R * t) - 1)/ (exp(R * t) - K)	
    p0t <- K * (exp(R * t) - 1)/ (exp(R * t) - K)	
    
    if(runif(1)>p0t){ #if lineage survived:
      rich <- 1+ rgeom(1, prob=gpar)
    }else{ #if died:
      rich=0
    }

  return(rich)
}




