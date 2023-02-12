#' @importFrom stats aggregate
NULL
#' Calculate paleo diversity curves using the standard method
#'
#' \code{calcRangeThrough} calculates richness through time using the 
#' standard method (ADD REFERENCE).
#'
#' @param data A \code{data.frame} containing the columns: \code{max_ma}, \code{min_ma}
#' and  the name provided in \code{tax_lvl}. \code{max_ma} and \code{min_ma} are 
#' respectively the early and late bounds of rock layer's age. \code{tax_lvl} column 
#' is the taxonomic level of the data. Any additional columns are ignored.
#' @param tax_lv A \code{character} giving the taxonomic in which calculations 
#' will be based on (default value is \code{"species"}). This must refer to the 
#' column names in \code{data}.
#' @param bin_reso A \code{numeric} assigning the resolution (length) of the 
#' time bin to consider in calculations. Default value is \code{1} (which in 
#' most cases - e.g. those following the paleoBiology Database default 
#' timescale - will equate to one million years)
#' @return A \code{data.frame} containing the diversity (column \code{div}) of 
#' the chosen taxonomic level, through time - with time moments being a 
#' sequence of arbitrary numbers based on \code{bin_reso}
#' 
#' @export calcStdMethod
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
#' # Now same plot, but using a different bin resolution:
#' data("trilob_fossil")
#' div2 <- calcStdMethod(trilob_fossil, bin_reso = 3)
#' plot(x=div2$age, y=div2$div, type="l", 
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
