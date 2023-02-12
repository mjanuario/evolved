#' @importFrom ape branching.times
NULL
#' Make a lineage trough time (LTT) plot
#'
#' \code{lttPlot} plots the lineage trough time (LTT) of a \code{phylo} object.
#' It also adds a reference line connecting the edges of the graph.
#'
#' @param phy A \code{phylo} object, as specific by the \code{ape} package.
#' @param lwd Line width.
#' @param col Line color.
#' @param  PLOT A \code{logical} indicating with calculations should be plotted.
#'  If \code{FALSE}, function returns a list of the calculated points.
#' @param rel_time A \code{logical} indicating if time should be calculated in 
#' absolute scale. If \code{FALSE} (default), plots relative time since \code{phy}'s 
#' crown age.
#' @param add A \code{logical} indicating if plot should be added to 
#' pre-existing plot. Default is \code{FALSE}.
#' 
#' @return If \code{PLOT = FALSE}, a list the richness of each point in time, 
#' and \code{phy}'s crown age.
#' 
#' @export lttPlot
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
#' phy <- simulateTree(pars = c(S, E), max.taxa = 20)
#' lttPlot(phy)
#' lttPlot(phy, PLOT = FALSE)
#' 
lttPlot <- function(phy, lwd=1, col="red", PLOT = T, rel_time = F, add = F){
  
  bt <- branching.times(phy)
  
  if (rel_time){
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
    
    ########################
    # atencao, Jennifer: se possivel mantenhas os par etc pq meu orientaodr 
    # gosta deles
    ########################
    
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
