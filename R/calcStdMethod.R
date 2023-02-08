#' Calculating paleo diversity curves using the Range Through method
#'
#' \code{calcRangeThrough} calculates richness through time using the 
#' standard method (ADD REFERENCE).
#'
#' @param data A \code{data.frame} containing fossil data on the age (early and 
#' late bounds of rock layer, respectively labeled as \code{max_ma} and 
#' \code{min_ma}) and the taxonomic level asked in \code{tax_lv}.
#' @param tax_lvl A \code{character} giving the taxonomic in which 
#' calculations will be based on (default value is \code{"species"}). This 
#' must refer to the column names in \code{data}.
#' @param bin_reso A \code{numeric} assigning the resolution (length) of the 
#' time bin to consider in calculations. Default value is \code{1} (which in 
#' most cases - e.g. those following the paleoBiology Database default 
#' timescale - will equate to one million years)
#' @return A \code{data.frame} containing the diversity (column \code{div}) of 
#' the chosen taxonomic level, through time - with time moments being a 
#' sequence of aritrary numbers based on \code{bin_reso}
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
#' div <- calcStdMethod(trilob_fossil)
#' plot(x=div$age, y=div$div, type="l", 
#'      xlab = "Time (Mya)", ylab = "Richness", 
#'      xlim=rev(range(div$age)))
#' 
#' # Now msa eplot, but using a different bin resolution:
#' data("trilob_fossil")
#' div <- calcStdMethod(trilob_fossil, bin_reso = 0.1)
#' plot(x=div$age, y=div$div, type="l", 
#'      xlab = "Time (Mya)", ylab = "Richness", 
#'      xlim=rev(range(div$age)))
#' 
calcStdMethod=function(data, tax_lv="species", bin_reso=1){
  
  if(tax_lv %in% colnames(data)){
    
    aux1=aggregate(data$max_ma, by=list(data[,tax_lv]), max, na.rm=T)
    colnames(aux1)=c("taxon", "max_ma")
    
    aux2=aggregate(data$min_ma, by=list(data[,tax_lv]), min, na.rm=T)
    colnames(aux2)=c("taxon", "min_ma")
    
    data= merge(aux1, aux2)
  }else{
    stop(paste0("\"data\" do not have a column with taxonomic 
                level exactly equal to ", tax_lv))
  }
  
  age=seq(from=max(data$max_ma)+bin_reso, to=min(data$min_ma)-bin_reso, by=-bin_reso)
  
  div=vector()
  for(a in age){
    div=c(div, sum(data$max_ma> a & data$min_ma<a))
  }
  
  res=data.frame(age, div)
  res=res[!res$age<0,]
  return(res)
}
