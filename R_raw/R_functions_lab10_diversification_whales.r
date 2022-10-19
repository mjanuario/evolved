require(diversitree)

simulateTree <- function(pars, max.taxa = Inf, max.t=Inf, min.taxa = 2, include.extinct=F){
 
	badcount <- 0;
	while (1){
		
		tree <- tree.bd(pars, max.taxa=max.taxa, max.t=max.t, include.extinct=include.extinct);
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
	
	tree <- check_and_fix_ultrametric(tree)
	return(tree);
}

# Computes the Colless imbalance statistic 
#	across an entire tree.
colless <- function(phy){
	
	bb <- balance(phy);
	ss <- sum(abs(bb[,1] - bb[,2]));
	n <- length(phy$tip.label);
	return((2 / ((n-1)*(n-2))) * ss);
	
}

logit <- function(x, min=0, max=1){
	p <- (x-min)/(max-min)
	log(p/(1-p))
}

invlogit <- function(x, min=0, max=1)
{
	p <- exp(x)/(1+exp(x))
	p <- ifelse( is.na(p) & !is.na(x), 1, p ) # fix problems with +Inf
	p * (max-min) + min
}

# Gets a vector of initial parameters 
#	for a bisse, birth-death, or mk2 model
#	using the likelihood functions created 
#	in diversitree with make.mk2, make.bisse, or make.bd
# These can be plugged directly into the corresponding
#	likelihood function. However, they are not guaranteed
#	to generate finite log-likelihoods. 
# Arguments:
#	fx: the diversitree likelihood function
#	lmin: the minimum value across all parameters
#	lmax: the maximum value across all parameters

getStartingParamsDiversitree <- function(fx, lmin, lmax){
		
		lamset <- runif(3, lmin, lmax);
		names(lamset) <- c('S', paste('S', 0:1, sep=''));
		muset <- runif(3, 0, 1) * lamset;
		names(muset) <- c('E', paste('E', 0:1, sep=''));
		qset <- runif(4, lmin, lmax * 0.2);
		names(qset) <- c('q01', 'q10', 'q12', 'q21');
		parvec <- c(lamset, muset, qset);
	 
		if (length(setdiff(argnames(fx), names(parvec))) > 0){
			stop("Invalid argnames from function\n");
		}
		
		parset <- intersect(names(parvec), argnames(fx));
				
		return(parvec[parset]);
}


# A general purpose optimization function
# that optimizes parameters of a diversitree likelihood function.
# The likelihood function must correspond to one of the following models:
#	a) BiSSE (or any constrained submodel)
#	b) birth-death
#	c) mk2 (2 state character only model)
fitDiversitree <- function(fx, nopt=1, lmin = 0.001, lmax=20.0, MAXBAD = 100, initscale = 0.1){

	
	for (i in 1:nopt){
		
		badcount <- 0;
		
		iv <- getStartingParamsDiversitree(fx, lmin=lmin, lmax=lmax*initscale);
		
		resx <- try(optim(iv ,fx, method='L-BFGS-B', control=list(maxit=1000, fnscale=-1), lower=lmin, upper=lmax), silent=T);
		while (class(resx) == 'try-error'){
		iv <- getStartingParamsDiversitree(fx, lmin=lmin, lmax=lmax*initscale);
			resx <- try(optim(iv , fx, method='L-BFGS-B', control=list(maxit=1000, fnscale=-1), lower=lmin, upper=lmax), silent=T);
			
			badcount <- badcount + 1;
			if (badcount > MAXBAD){
				stop("Too many fails in fitDiversitree\n");
			}
		}
		
		if (i == 1){
			best <- resx;
		}else{
			if (best$value < resx$value){
				best <- resx;
			}
		}
		
	}
	
	fres <- list(pars=best$par, loglik=best$value);
	fres$AIC <- -2*fres$loglik + 2*length(argnames(fx));
	fres$counts <- best$counts;
	#fres$like_function <- fx;
	fres$convergence <- best$convergence;
	fres$message <- best$message;
	return(fres);
}


# simDiscrete: a simple wrapper function for 
#	geiger::sim.char. Allows user to specify minimum
#	and maximum frequencies of the rare character state.
#	Arguments:
#		phy: 	phylogenetic tree, ape format
#		q:		rate (only allows symmetric rates)
#		minf:	minimum frequency of rarer state
#		maxf:	maximum frequency of rarer state
#		root:	root character state
#	Returns: A vector of character states, coded 
#	as 1 or 0 

simDiscrete <- function(phy, q, minf = 0.05, maxf = 0.5, root=0){
	MAXBADCOUNT <- 200;
	require(geiger);
	mm <- matrix(rep(q, 4), nrow=2);
	diag(mm) <- -1 * diag(mm);
	
	bad <- TRUE;
	badcount <- 0;
	while (bad){
		chars <- sim.char(v, par=mm, nsim=1, model='discrete', root=root+1)[,1,1];
		tx <- table(chars);
		if (length(tx) == 2){
			ff <- min(tx)/length(chars);
			if (ff >= minf & ff <= maxf){
				bad <- FALSE;
			}
		}
		if (badcount > MAXBADCOUNT){
			stop("Exceeded MAXBADCOUNT in simDiscrete\n");
		}
		badcount <- badcount + 1;
	}
	return(chars - 1);
	
}

estimateSpeciation <- function(phy){
  return((length(phy$tip.label)-2) / sum(phy$edge.length))
}



fitCRBD <- function(phy, nopt=5, lmin=0.001, lmax=5.0, MAXBAD = 200){
	
	if (length(phy$tip.label) < 3){
		pars <- c(0.0001,0)
		names(pars) <- c("S", "E")
		return(pars)
	}
	
	fx <- make.bd(phy)
	
	for (i in 1:nopt){
	
		lam <- runif(1, 0, 0.5)	
	 	E <- lam * runif(1, 0, 1)
	 
		badcount <- 0
 
		resx <- try(optim(c(lam, E) ,fx, method='L-BFGS-B', control=list(maxit=1000, fnscale=-1), lower=lmin, upper=lmax), silent=T)
		while (class(resx) == 'try-error'){

			lam <- runif(1, 0, 0.5)	
	 		E <- lam * runif(1, 0, 1)
			
			resx <- try(optim(c(lam, E) , fx, method='L-BFGS-B', control=list(maxit=1000, fnscale=-1), lower=lmin, upper=lmax), silent=T);
			
			badcount <- badcount + 1;
			if (badcount > MAXBAD){
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
	fres$AIC <- -2*fres$loglik + 2*length(argnames(fx))
	fres$counts <- best$counts
	#fres$like_function <- fx
	fres$convergence <- best$convergence
	fres$message <- best$message
	
	pars <- fres$pars
	names(pars) <- c("S", "E")
	
	return(pars)
}



loglike_purebirth <- function(S, phy){
	
	n <- length(phy$tip.label)
	ll <- (n - 2) * log(S) - S*sum(phy$edge.length) 
	return(ll)
}



colorFunction <- function(x, minn, maxx, colorset){
	
 	
	sq <- seq(from=minn, to = maxx, length.out = length(colorset))
	cols <- rep(colorset[1], length(x))
	
	cols[x <= minn] <- colorset[1]
	cols[x >= maxx] <- colorset[length(colorset)]
	
	for (i in 2:length(sq)){
		isIn <- x >= sq[i-1] & x < sq[i]
		cols[isIn] <- colorset[i]
	}
	cols[is.na(x)] <- NA
	return(cols)

}

# This function checks trees to see if they pass ape ultrametricity test.
# If not, it computes the differential root-to-tip distance across all tips.
# It adds the appropriate quantity to each terminal branch length to ensure that 
# tree passes ultrametric test.
# Note: this is only a valid method of making trees ultrametric when the 
# 	non-ultrametricity is due to small numerical discrepancies, e.g., 
#   rounding or other floating point issues during phylogeny construction.
# 

check_and_fix_ultrametric <- function(phy){
	
	if (!is.ultrametric(phy)){
		
		vv <- vcv.phylo(phy)
		dx <- diag(vv)
		mxx <- max(dx) - dx
		for (i in 1:length(mxx)){
			phy$edge.length[phy$edge[,2] == i] <- phy$edge.length[phy$edge[,2] == i] + mxx[i]
		}
		if (!is.ultrametric(phy)){
			stop("Ultrametric fix failed\n")
		}	
	}
	
	return(phy)
}


# getEqualSplitsSpeciation
#   Computes the "DR" statistic of Jetz et al (Nature, 2012)
#   However, this is really a better estimate of speciation rate
#    and not net diversification rate

getEqualSplitsSpeciation <- function(x, return.mean = FALSE){
	
	rootnode <- length(x$tip.label) + 1
	
	sprates <- numeric(length(x$tip.label))
	for (i in 1:length(sprates)){
		node <- i
		index <- 1
		qx <- 0
		while (node != rootnode){
			el <- x$edge.length[x$edge[,2] == node]
			node <- x$edge[,1][x$edge[,2] == node]
			
			qx <- qx + el* (1 / 2^(index-1))
			
			index <- index + 1
		}
		sprates[i] <- 1/qx
	}
	
	if (return.mean){
		return(mean(sprates))		
	}else{
		names(sprates) <- x$tip.label
		return(sprates)
	}

}


ltt_nice <- function(phy, lwd=1, col="red", add.iso = T, PLOT = T, rel.time = F, add = F){
	
	bt <- branching.times(phy)
	
	if (rel.time){
		bt <- bt / max(bt)
	}
	
	age <- max(bt)
	st <- sort(as.numeric(age - bt))
	
	ll <- log(2:(length(st)+1))
	
	ym <- max(ll) * 1.1
	xm <- age * 1.1
	
	if (!PLOT){
 		return(list(ldata =  cbind(stime = st, lineages = ll), age = age))
	}
	
	if (!add){
		
		plot.new()
		par(mar=c(4,4,1,1))
		plot.window(xlim=c(0, xm), ylim=c(0,ym))
		lines(x=c(st[1], age), y=range(ll), lwd=1.5, col="gray50")		
		
		axis(1)
		axis(2, las=1)
		mtext(side=1, text= "Time", line = 2.5)
		mtext(side = 2, text = "Log (ln) lineages", line=2.5)
	}
	 
	segments(x0=st, x1 = c(st[-1], age), y0 = ll, y1=ll, lwd=lwd, col=col)
	segments(x0=st[-1], x1 = st[-1], y0=ll[-length(ll)], y1=ll[-1], lwd=lwd, col=col)
 
}

plot_painted_whales<-function(phy, show.legend=TRUE, direction="rightwards", ...){
  
  painted<-paintSubTree(phy,89,"Other mysticetes","1")
  painted<-paintSubTree(painted,109,"Beaked whales", "0")
  painted<-paintSubTree(painted,134,"Belugas and narwhals","0")
  painted<-paintSubTree(painted,135,"Porpoises")
  painted<-paintSubTree(painted,94,"Baleen whales",)
  painted<-paintSubTree(painted,140,"Dolphins")
  
  plot(painted,lwd=3, direction=direction, ...)
  
  if(show.legend){
    if(direction=="rightwards"){
      leg.placement="topleft"
    }else if(direction=="leftwards"){
      leg.placement="topright"
    }else{
      stop("direction should be equal to rightwards OR leftwards")
    }
    
    legend(x=leg.placement,legend=c(
      "other odontocetes",
      "Baleen whales",
      "Beaked whales",
      "Belugas and narwhals",
      "Dolphins",
      "Other mysticetes","Porpoises"
    ),
    pch=21,pt.cex=1.5,pt.bg=c("black","#DF536B","#61D04F","#2297E6","#28E2E5","#CD0BBC","#F5C710"),bty="n") 
  }
  
}














 
