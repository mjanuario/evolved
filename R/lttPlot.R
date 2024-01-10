#' Make a lineage through time (LTT) plot
#'
#' \code{lttplot} plots the lineage through time (LTT) of a \code{phylo} object.
#' It also adds a reference line connecting the edges of the graph.
#'
#' @param phy A \code{phylo} object, as specified by the \code{ape} package.
#' @param lwd Line width.
#' @param col Line color.
#' @param  plot A \code{logical} indicating with calculations should be plotted.
#'  If \code{FALSE}, function returns a list of the calculated points.
#' @param rel_time A \code{logical} indicating how the time scale should be 
#' shown. If \code{FALSE} (default), plots the absolute time since \code{phy}'s
#' crown age. If  \code{TRUE}, plots time as a relative proportion between 
#' crown age and furthest tip from root.
#' @param add A \code{logical} indicating if plot should be added to 
#' pre-existing plot. Default is \code{FALSE}.
#' 
#' @return Plots the sum of alive lineages per point in time, and adds a red 
#' line as a reference of expectation under pure birth. If \code{plot = FALSE}, 
#' a list the richness of each point in time, and \code{phy}'s crown age.
#' 
#' @export lttplot
#' 
#' @references 
#' 
#' Paradis, E. (2012). Analysis of Phylogenetics and Evolution with R (Vol. 2).
#'  New York: Springer.
#' 
#' @author Daniel Rabosky, Matheus Januario, Jennifer Auler
#' 
#' @examples
#' 
#' S <- 1
#' E <- 0
#' set.seed(1)
#' phy <- simulateTree(pars = c(S, E), max.taxa = 20, max.t = 5)
#' lttplot(phy)
#' lttplot(phy, plot = FALSE)
#' 
lttplot <- function(phy, lwd=1, col="red", plot = T, rel_time = F, add = F){
  
  ############################################
  # check the classes of inputs and stop if any was inputted wrongly:
  
  if(!ape::is.binary.phylo(phy)){
    stop("phy is not a binary phylogeny")
  }
  
  ref_classes = c("numeric","character","logical","logical", "logical")
  input_names = names(unlist(formals(lttplot)))[-1]
  input_list = list(lwd, col, plot, rel_time, add)
  input_classes = unlist(lapply(input_list, class))
  
  if(any(! input_classes== ref_classes)){
    stop(paste0("\n", input_names[which(input_classes != ref_classes)], " has the wrong object class. Please check the documentation of this function by typing: \n \n ??lttplot"))
  }
  # end of checking inputs
  ############################################
  
  
  bt <- ape::branching.times(phy)
  
  if (rel_time){
    bt <- bt / max(bt)
  }
  
  age <- max(bt)
  st <- sort(as.numeric(age - bt))
  
  ll <- log(2:(length(st)+1))
  
  ym <- max(ll) * 1.1
  xm <- age * 1.1
  
  if (!plot){
    return(list(ldata =  cbind(stime = st, lineages = ll), age = age))
  }
  
  if (!add){

    #saving par
    opar = par(no.readonly = TRUE)
        
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
  
  par(opar)
}
