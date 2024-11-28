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
#' @param tax.lvl A \code{character} giving the taxonomic in which 
#' calculations will be based on, which must refer to the column names in 
#' \code{data}. If \code{NULL} (default value), the function plots every 
#' individual occurrences in \code{data}.
#' @param sort \code{logical} indicating if taxa should be sorted by their 
#' \code{max_ma} values (default value is \code{TRUE}). Otherwise (i.e., if 
#' \code{FALSE}), function will follow the order of taxa (or occurrences) 
#' inputted in \code{data}.
#' @param use.midpoint \code{logical} indicating if function should use 
#' occurrence midpoints (between \code{max_ma} and \code{min_ma}) as 
#' occurrence temporal boundaries, a method commonly employed in paleobiology 
#' to remove noise related to extremely coarse temporal resolution due to 
#' stratification. This argument is only used if a \code{tax.lvl} is provided.
#' @param return.ranges \code{logical} indicating if ranges calculated by 
#' function should be return as a \code{data.frame}. If \code{tax.lvl} is 
#' \code{NULL}, the function don't calculate ranges and so it has nothing 
#' to return.
#' @param knitr Logical indicating if plot is intended to show up in RMarkdown files made by the \code{Knitr} R package.
#' 
#' @return Plots a pile of the max-min temporal ranges of the chosen 
#' \code{tax.lvl}. This usually will be stratigraphic ranges for occurrences 
#' (so there is no attempt to estimate "true" ranges), and if 
#' \code{tax.lvl = NULL} (the default), occurrences are drawn as ranges of 
#' stratigraphic resolution (= the fossil dating imprecision). If 
#' \code{return.ranges = TRUE}, it returns a \code{data.frame} containing the 
#' diversity (column \code{div}) of the chosen taxonomic level, through time.
#' 
#' @export plotRawFossilOccs
#' 
#' @author Matheus Januario, Jennifer Auler
#' 
#' @examples
#' 
#' data("dinos_fossil")
#' oldpar <- par(no.readonly = TRUE) 
#' par(mfrow=c(1,2))
#' plotRawFossilOccs(dinos_fossil, tax.lvl = "species", knitr = TRUE)
#' plotRawFossilOccs(dinos_fossil, tax.lvl = "genus", knitr = TRUE)
#' par(oldpar)
#' 
plotRawFossilOccs <- function(data, tax.lvl=NULL, sort=TRUE, use.midpoint=TRUE, return.ranges=FALSE, knitr = FALSE){
  
  ############################################
  # check the classes of inputs and stop if any was inputted wrongly;
  ref_classes = c("data.frame", "logical", "logical",  "logical")
  input_names = names(unlist(formals(plotRawFossilOccs)))[-2]
  input_list = list(data, sort, use.midpoint, return.ranges)
  input_classes = unlist(lapply(input_list, class))
  
  if(any(! ref_classes == input_classes)){
    stop(paste0("\n \n ", input_names[which(input_classes != ref_classes)], " has the wrong object class. Please check the documentation of this function by typing: \n \n ??plotRawFossilOccs"))
  }
  # end of checking inputs
  ############################################
  
  
  if(!knitr){
    dev.new()
  }

  title="Occurrence"
  
  if(is.null(tax.lvl) & use.midpoint){
    message("If tax.lvl is not supplied, argument use.midpoint will be set to FALSE")
    use.midpoint=FALSE
  }
  
  if(!is.null(tax.lvl)){
    if(tax.lvl %in% colnames(data)){
      
      title = tax.lvl
      
      if(use.midpoint){
        
        data$midpoint = (data$max_ma-data$min_ma)/2 + data$min_ma
        
        aux1=aggregate(data$midpoint, by=list(data[,tax.lvl]), max, na.rm=T)
        colnames(aux1)=c("taxon", "max_ma")
        
        aux2=aggregate(data$midpoint, by=list(data[,tax.lvl]), min, na.rm=T)
        colnames(aux2)=c("taxon", "min_ma") 
      }else{
        aux1=aggregate(data$max_ma, by=list(data[,tax.lvl]), max, na.rm=T)
        colnames(aux1)=c("taxon", "max_ma")
        
        aux2=aggregate(data$min_ma, by=list(data[,tax.lvl]), min, na.rm=T)
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
  
  
  if(is.null(tax.lvl)){
    ylab_text="Fossil occurrences"  
  }else{
    ylab_text=paste0(tax.lvl, " temporal ranges")
  }
  
  plot(NA, 
       ylim=c(0, nrow(data)),
       xlim=rev(range(c(data$max_ma, data$min_ma))), frame.plot = F, yaxt="n",
       ylab=ylab_text, xlab="Absolute time (Mya)", main=paste0(title, " level; N = ", nrow(data)," taxa")
  )
  
  segments(x0 = data$max_ma, y0 = 1:nrow(data),
           x1 = data$min_ma, y1 = 1:nrow(data))
  
  if(return.ranges){
    if(is.null(tax.lvl)){
      stop("no range is calculated if \"tax.lvl\" is NULL")
    }
    return(data)
  }

}
