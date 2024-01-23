#' @importFrom stats aggregate
NULL
#' Plot a literal interpretation of a fossil record
#'
#' \code{plotRawFossilOccs} calculates and plots the early and late boundaries 
#' associated with each taxa in a dataset.
#'
#' @param data A \code{data.frame} containing fossil data on the age (early and 
#' late bounds of rock layer, respectively labeled as \code{max_ma} and 
#' \code{min_ma}) and the taxonomic level asked in \code{tax_lv}.
#' @param tax_lvl A \code{character} giving the taxonomic in which 
#' calculations will be based on, which must refer to the column names in 
#' \code{data}. If \code{NULL} (default value), the function plots every 
#' individual occurrences in \code{data}.
#' @param sort \code{logical} indicating if taxa should be sorted by their 
#' \code{max_ma} values (default value is \code{TRUE}). Otherwise (i.e., if 
#' \code{FALSE}), function will follow the order of taxa (or occurrences) 
#' inputted in \code{data}.
#' @param use_midpoint \code{logical} indicating if function should use 
#' occurrence midpoints (between \code{max_ma} and \code{min_ma}) as 
#' occurrence temporal boundaries, a method commonly employed in paleobiology 
#' to remove noise related to extremely coarse temporal resolution due to 
#' stratification. This argument is only used if a \code{tax_lvl} is provided.
#' @param return_ranges \code{logical} indicating if ranges calculated by 
#' function should be return as a \code{data.frame}. If \code{tax_lvl} is 
#' \code{NULL}, the function don't calculate ranges and so it has nothing 
#' to return.
#' @return Plots a pile of the max-min temporal ranges of the chosen 
#' \code{tax_lvl}. This usually will be stratigraphic ranges for occurrences 
#' (so there is no attempt to estimate "true" ranges), and if 
#' \code{tax_lvl = NULL} (the default), occurrences are drawn as ranges of 
#' stratigraphic resolution (= the fossil dating imprecision). If 
#' \code{return_ranges = TRUE}, it returns a \code{data.frame} containing the 
#' diversity (column \code{div}) of the chosen taxonomic level, through time.
#' 
#' @export plotRawFossilOccs
#' 
#' @author Matheus Januario, Jennifer Auler
#' 
#' @examples
#' 
#' data("ammonoidea_fossil")
#' par(mfrow=c(1,2))
#' plotRawFossilOccs(ammonoidea_fossil, tax_lvl = "species")
#' plotRawFossilOccs(ammonoidea_fossil, tax_lvl = "genus")
#' 
plotRawFossilOccs <- function(data, tax_lvl=NULL, sort=TRUE, use_midpoint=TRUE, return_ranges=FALSE){
  
  ############################################
  # check the classes of inputs and stop if any was inputted wrongly;
  ref_classes = c("data.frame", "logical", "logical",  "logical")
  input_names = names(unlist(formals(plotRawFossilOccs)))[-2]
  input_list = list(data, sort, use_midpoint, return_ranges)
  input_classes = unlist(lapply(input_list, class))
  
  if(any(! ref_classes == input_classes)){
    stop(paste0("\n \n ", input_names[which(input_classes != ref_classes)], " has the wrong object class. Please check the documentation of this function by typing: \n \n ??plotRawFossilOccs"))
  }
  # end of checking inputs
  ############################################
  
  opar = par(no.readonly = TRUE)
  
  title="Occurrence"
  
  if(is.null(tax_lvl) & use_midpoint){
    message("If tax_lvl is not supplied, argument use_midpoint will be set to FALSE")
    use_midpoint=FALSE
  }
  
  if(!is.null(tax_lvl)){
    if(tax_lvl %in% colnames(data)){
      
      title = tax_lvl
      
      if(use_midpoint){
        
        data$midpoint = (data$max_ma-data$min_ma)/2 + data$min_ma
        
        aux1=aggregate(data$midpoint, by=list(data[,tax_lvl]), max, na.rm=T)
        colnames(aux1)=c("taxon", "max_ma")
        
        aux2=aggregate(data$midpoint, by=list(data[,tax_lvl]), min, na.rm=T)
        colnames(aux2)=c("taxon", "min_ma") 
      }else{
        aux1=aggregate(data$max_ma, by=list(data[,tax_lvl]), max, na.rm=T)
        colnames(aux1)=c("taxon", "max_ma")
        
        aux2=aggregate(data$min_ma, by=list(data[,tax_lvl]), min, na.rm=T)
        colnames(aux2)=c("taxon", "min_ma") 
      }
      
      data= merge(aux1, aux2)
    }else{
      stop("data do not have a column with this taxonomic level")
    }
  }
  
  if(sort){
    data <- data[order(data$max_ma, decreasing = T),]
  }
  
  
  if(is.null(tax_lvl)){
    ylab_text="Fossil occurrences"  
  }else{
    ylab_text=paste0(tax_lvl, " temporal ranges")
  }
  
  plot(NA, 
       ylim=c(0, nrow(data)),
       xlim=rev(range(c(data$max_ma, data$min_ma))), frame.plot = F, yaxt="n",
       ylab=ylab_text, xlab="Absolute time (Mya)", main=paste0(title, " level; N = ", nrow(data)," taxa")
  )
  
  segments(x0 = data$max_ma, y0 = 1:nrow(data),
           x1 = data$min_ma, y1 = 1:nrow(data))
  
  if(return_ranges){
    if(is.null(tax_lvl)){
      stop("no range is calculated if \"tax_lvl\" is NULL")
    }
    return(data)
  }
  par(opar)
}
