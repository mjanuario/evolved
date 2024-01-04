#' Details, generics, and methods for the \code{proteinSeq} class
#' 
#' @description The \code{proteinSeq} class is an input for the functions \code{countSeqDiffs} and \code{is.proteinSeq}. It consists of a character vector. Each entry in this vector represents the aminoacid (the protein components coded by a gene) sequence, for a given aligned protein sequence. The object must be a character, named vector, with the names typically corresponding to the species (name could be scientific or common name) from which every sequence came. The characters within the vector must correspond to valid aminoacid symbols (i.e. capitalized letters or deltion "_" symbols).
#' 
#' @param x an object of the class \code{proteinSeq}
#' @param n number of aminoacids to be shown
#' 
#' @author Daniel Rabosky, Matheus Januario, Jennifer Auler
#' 
#' @export is.proteinSeq 
#' 
#' @examples
#' 
#' data("cytOxidase")
#' is.proteinSeq(cytOxidase)
#' 
#' summary.proteinSeq(cytOxidase)
#' 
#' head.proteinSeq(cytOxidase)
#' 
#' tail.proteinSeq(cytOxidase)
#' 
is.proteinSeq=function(x){
  
  t1 = is.character(x)
  t2 = class(x) == "ProteinSeq"
  t3 = !is.null(names(x))
  
  unqsymbols = unique(unlist((strsplit(paste(x, collapse = ""), ""))))
  
  if(sum(!unqsymbols %in% c("-", LETTERS[-c(10,21)]))>0){
    stop(paste0("\n ", unqsymbols[unqsymbols %in% c("-", LETTERS)], " is not a valid amino acid symbol"))
  }
  
  if(length(unique(lapply(strsplit(x, ""), length)))>1){
    stop("input must have alligned, same length, amino acid sequences")
  }
  
  if(all(c(t1,t2,t3))){
    return(TRUE)
  }else{
    return(FALSE)
  }
  
}

#' @rdname is.proteinSeq
#' @export print.proteinSeq
print.proteinSeq=function(x){
  
  if (!is.proteinSeq(x)) {
    stop("Invalid proteinSeq object, type in the console: \n \n ??proteinSeq")
  }
  
  cat(paste0("\n", length(x), " amino acid sequences, each with length ", length(unlist(strsplit(x[1], "")))))
}

#' @rdname is.proteinSeq
#' @export summary.proteinSeq
summary.proteinSeq=function(x){
  print.proteinSeq(x)
}

#' @rdname is.proteinSeq
#' @export head.proteinSeq
head.proteinSeq=function(x, n=6){
  
  if (!is.proteinSeq(x)) {
    stop("Invalid proteinSeq object, type in the console: \n \n ??proteinSeq")
  }
  
  n=min(n, length(x))
  res=list()
  ids = 1:n
  for(i in ids){
    aux = unlist(strsplit(x[i],""))[1:20]  
    names(aux)=NULL
    res[[i]] = paste0(aux, collapse = "")
  }
  names(res) = names(x[ids])
  
  return(res)
}

#' @rdname is.proteinSeq
#' @export tail.proteinSeq
tail.proteinSeq=function(x, n=6){
  
  if (!is.proteinSeq(x)) {
    stop("Invalid proteinSeq object, type in the console: \n \n ??proteinSeq")
  }
  
  res=list()
  n=min(n, length(x))
  ids=rev(length(x)-(0:(n-1)))
  counter=1
  for(i in ids){
    aux = unlist(strsplit(x[i],""))[1:20]  
    names(aux)=NULL
    res[[counter]] = paste0(aux, collapse = "")
    counter= counter+1
  }
  names(res) = names(x[ids])
  
  return(res)
}

