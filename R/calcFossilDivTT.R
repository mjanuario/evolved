#' @importFrom stats aggregate
NULL
#' Calculate paleo diversity curves through different methods
#'
#' \code{calcFossilDivTT} calculates fossil diversity through time using 
#' different methods.
#'
#' @param data A \code{data.frame} containing the columns: \code{max_ma}, 
#' \code{min_ma} and  the name provided in \code{tax.lvl}. \code{max_ma} and 
#' \code{min_ma} are respectively the early and late bounds of rock layer's age. 
#' \code{tax.lvl} column is the taxonomic level of the data. Any additional 
#' columns are ignored.
#' @param method A \code{character} string setting the method which should be used. 
#' Could be either \code{"rangethrough"} or \code{"stdmethod"}, which will 
#' respectively calculate diversity using the range through or the standard 
#' methods (Foote & Miller, 2007)
#' @param tax.lvl A \code{character} giving the taxonomic in which
#'  calculations will be based on (default value is \code{"species"}). 
#'  This must refer to the column names in \code{data}.
#' @param bin.reso A \code{numeric} assigning the resolution (length) of the 
#' time bin to consider in calculations. Default value is \code{1} (which in 
#' most cases - e.g. those following the Paleobiology Database default 
#' timescale - will equate to one million years)
#' 
#' @return A \code{data.frame} containing the diversity (column \code{div}) of 
#' the chosen taxonomic level through time, with calculation based on 
#' \code{method}. If \code{"method = rangethrough"}, the time moments are the 
#' layer boundaries given in \code{data}. 
#' If \code{"method = stdmethod"}, the time moments are evenly-space bins  with 
#' length equal to \code{bin.reso}, starting at the earliest bound in the 
#' dataset.
#' 
#' @export calcFossilDivTT
#' 
#' @references 
#' 
#' Foote, M., Miller, A. I., Raup, D. M., & Stanley, S. M. (2007). Principles 
#' of paleontology. Macmillan.
#' 
#' @author Matheus Januario, Jennifer Auler
#' 
#' @examples
#' 
#' # Loading data
#' data("dinos_fossil")
#' 
#' # Using function:
#' div1 <- calcFossilDivTT(dinos_fossil, method = "stdmethod")
#' div2 <- calcFossilDivTT(dinos_fossil, method = "stdmethod", bin.reso = 10)
#' 
#' # Comparing different bins sizes in the standard method
#' plot(x=div1$age, y=div1$div, type="l", 
#'      xlab = "Time (Mya)", ylab = "Richness", 
#'      xlim=rev(range(div1$age)), col="red") 
#' lines(x=div2$age, y=div2$div, col="blue")
#' 
#' # Comparing different methods:
#' div3 <- calcFossilDivTT(dinos_fossil, method = "rangethrough")
#' plot(x=div1$age, y=div1$div, type="l", 
#'      xlab = "Time (Mya)", ylab = "Richness", 
#'      xlim=rev(range(div1$age)), col="red") 
#' lines(x=div3$age, y=div3$div, col="blue")
#' 
calcFossilDivTT=function(data, tax.lvl="species", method="rangethrough", bin.reso=1){
  
  ############################################
  # check the classes of inputs and stop if any was inputted wrongly;
  ref_classes = c("data.frame", "character", "character",  "numeric")
  input_names = names(unlist(formals(calcFossilDivTT)))
  input_list = list(data, tax.lvl, method, bin.reso)
  input_classes = unlist(lapply(input_list, class))
  
  if(any(! ref_classes == input_classes)){
    stop(paste0("\n", input_names[which(input_classes != ref_classes)], " has the wrong object class. Please check the documentation of this function by typing: \n ??calcFossilDivTT"))
  }
  
  if(!(bin.reso>0)){
    stop("bin.reso should be laregr than zero")
  }
  # end of checking inputs
  ############################################
  
  if(tax.lvl %in% colnames(data)){
    
    aux1=aggregate(data$max_ma, by=list(data[,tax.lvl]), max, na.rm=T)
    colnames(aux1)=c("taxon", "max_ma")
    
    aux2=aggregate(data$min_ma, by=list(data[,tax.lvl]), min, na.rm=T)
    colnames(aux2)=c("taxon", "min_ma")
    
    data= merge(aux1, aux2)
  }else{
    stop(paste0("\"data\" do not have a column with taxonomic 
                level exactly equal to ", tax.lvl))
  }
  
  if(method=="stdmethod"){
    
    age=seq(from=max(data$max_ma)+bin.reso, to=min(data$min_ma)-bin.reso, by=-bin.reso)
    div=vector()
    for(a in age){
      div=c(div, sum(data$max_ma> a & data$min_ma<a))
    }
    
    res=data.frame(age, div)
    res=res[!res$age<0,]
    
  }else if(method == "rangethrough"){
    
    #getting unique bounds:
    unq_bnd=sort(unique(c(data$max_ma, data$min_ma)))
    unq_bnd=unq_bnd[unq_bnd!=0]
    
    res=data.frame()
    for(i in 1:length(unq_bnd)){
      bnd = unq_bnd[i]
      aux=data.frame(bnd, sum(data$max_ma>bnd & data$min_ma<bnd))
      colnames(aux)=c("age", "div")
      
      res=rbind(res, aux)
    }
    
  }else{
    stop("\"method\" should be either \"stdmethod\" OR \"rangethrough\"")
  }
  
  return(res)
}
