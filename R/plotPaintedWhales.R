#' Plotting the whale phylogeny and coloring its clades
#'
#' \code{plotPaintedWhales} plots the phylogeny from Steeman et al (2011), coloring the Dolphins (Delphinidae), porpoises (Phocoenidae), the Mysticetes, the baleen whales (Balaenopteridae), and the Beaked whales (Ziphiidae).
#'
#'#' @param phy A \code{phylo} object, that must be the same as the \code{BAMMtools::whales} bject
#' @param show.legend Logical indicating if clade elgend should be shown.
#' @param .. other arguments to be passed to \code{phytools::plotSimmap}
#' 
#' @details see help page from \code{phytools::plotSimmap}
#' 
#' @return A colored phylogeny plot.
#' 
#' @export plotPaintedWhales
#' 
#' @references 
#' 
#'  Steeman, M. E., Hebsgaard, M. B., Fordyce, R. E., Ho, S. Y., Rabosky, D. L., Nielsen, R., ... & Willerslev, E. (2009). Radiation of extant cetaceans driven by restructuring of the oceans. Systematic biology, 58(6), 573-585.
#' 
#'  
#' @author Matheus Januario, Jennifer Auler
#' 
#' @examples
#' 
#' 
plotPaintedWhales<-function(phy, show.legend=TRUE, direction="rightwards", ...){
  
  #
  #data(BAMMtools::whales)
  #if(all.equal(phy,whales)){
  #  stop("your inputted phylo is not the whale phylogeny from the \"BAMMtools\" package")
  #}
  
  painted<-phytools::paintSubTree(phy,89,"Other mysticetes","1")
  painted<-phytools::paintSubTree(painted,109,"Beaked whales", "0")
  painted<-phytools::paintSubTree(painted,134,"Belugas and narwhals","0")
  painted<-phytools::paintSubTree(painted,135,"Porpoises")
  painted<-phytools::paintSubTree(painted,94,"Baleen whales",)
  painted<-phytools::paintSubTree(painted,140,"Dolphins")
  
  phytools::plotSimmap(painted,lwd=3)
  
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
