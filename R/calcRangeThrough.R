#' Calculating paleo diversity curves using the Range Through method
#'
#' \code{calcRangeThrough} calculates richness through time using the method of
#'  Range Through (ADD REFERENCE).
#'
#' @param data A \code{data.frame} containing fossil data on the age (early and 
#' late bounds of rock layer, respectively labeled as \code{max_ma} and 
#' \code{min_ma}) and the taxonomic level asked in \code{tax_lvl}.
#' @param tax_lvl A \code{character} giving the taxonomic in which calculations 
#' will be based on (default value is \code{"species"}). This must refer to the 
#' column names in \code{data}.
#' @return A \code{data.frame} containing the diversity (column \code{div}) of 
#' the chosen taxonomic level, through time - with time moments being the 
#' layer boundaries given in \code{data}.
#' 
#' @export calcRangeThrough
#' 
#' @references 
#' 
#' ADD REFERENCE
#' 
#' @author Matheus Januario, Jennifer Auler
#' 
#' @examples
#' 
#' data("trilob_fossil")
#' div <- calcRangeThrough(trilob_fossil)
#' plot(x=div$age, y=div$div, type="l", 
#'      xlab = "Time (Mya)", ylab = "Richness", 
#'      xlim=rev(range(div$age)))#' 
#' 
calcRangeThrough=function(data, tax_lvl="species"){
  
  if(tax_lvl %in% colnames(data)){
    
    aux1=aggregate(data$max_ma, by=list(data[,tax_lvl]), max, na.rm=T)
    colnames(aux1)=c("taxon", "max_ma")
    
    aux2=aggregate(data$min_ma, by=list(data[,tax_lvl]), min, na.rm=T)
    colnames(aux2)=c("taxon", "min_ma")
    
    data= merge(aux1, aux2)
  }else{
    stop(paste0("\"data\" do not have a column with taxonomic 
                level exactly equal to ", tax_lvl))
  }
  
  #getting unique bounds:
  unq_bnd=sort(unique(c(data$max_ma, data$min_ma)))
  unq_bnd=unq_bnd[!unq_bnd==0]
  
  res=data.frame()
  for(i in 1:length(unq_bnd)){
    bnd = unq_bnd[i]
    aux=data.frame(bnd, sum(data$max_ma>bnd & data$min_ma<bnd))
    colnames(aux)=c("age", "div")
    
    res=rbind(res, aux)
  }
  
  return(res)
}