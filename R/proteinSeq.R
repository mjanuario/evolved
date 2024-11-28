#' Details, generics, and methods for the \code{ProteinSeq} class
#' 
#' @description The \code{ProteinSeq} class is an input for the functions \code{countSeqDiffs} and \code{is.ProteinSeq}. It consists of a character vector. Each entry in this vector represents the aminoacid (the protein components coded by a gene) sequence, for a given aligned protein sequence. The object must be a character, named vector, with the names typically corresponding to the species (name could be scientific or common name) from which every sequence came. The characters within the vector must correspond to valid aminoacid symbols (i.e. capitalized letters or deletion "_" symbols). Particularly, the following symbols relate to amino acids: \code{"A", "C", "D", "E", "F", "G", "H", "I", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "Y"}.
#' 
#' Importantly, the symbol \code{"_"} means an indel (insertion or deletion), and the symbols \code{"X", "B", "Z", "J"} should be considered as ambiguous site readings.
#' 
#' @param x an object of the class \code{ProteinSeq}
#' @param n number of aminoacids to be shown
#' @param ... arguments to be passed to or from other methods.
#' 
#' @author Daniel Rabosky, Matheus Januario, Jennifer Auler
#' 
#' @name ProteinSeq
#' 
#' @importFrom graphics plot par
#' @importFrom utils head tail
#' 
NULL

#' @rdname ProteinSeq
#' 
#' @param x an object
#' 
#' @details \code{is.ProteinSeq} A \code{ProteinSeq} must be a list containing 
#' multiple vectors made of characters (usually letters that code to Amino Acids, 
#' deletions, etc). All of these must have the correct length (i.e. same as all 
#' the others) and their relative positions should match (i.e., the object must 
#' contain _alligned_ Amino acide sequences).
#' 
#' @return A logical indicating if object \code{x} is of 
#' class \code{ProteinSeq}
#' 
#' @export
#' 
is.ProteinSeq=function(x){
  
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

#' @rdname ProteinSeq
#' 
#' @param x an object of the class \code{ProteinSeq}
#' @param ... arguments to be passed to or from other methods.
#' 
#' @return \code{print.ProteinSeq} Prints a brief summary of a 
#' \code{print.ProteinSeq} containing the number of sequences and 
#' the length of the alignment. See more details of the format in 
#' \code{??ProteinSeq}.
#' 
#' @export

print.ProteinSeq=function(x, ...){
  
  if (!is.ProteinSeq(x)) {
    stop("Invalid ProteinSeq object, type in the console: \n \n ??ProteinSeq")
  }
  
  cat(paste0("\n", length(x), " amino acid sequences, each with length ", length(unlist(strsplit(x[1], "")))))
}

#' @rdname ProteinSeq
#' 
#' @param object an object of the class \code{ProteinSeq}
#' 
#' @return Same as \code{print.ProteinSeq}.
#' 
#' @export

summary.ProteinSeq=function(object, ...){
  print.ProteinSeq(object)
}

#' @rdname ProteinSeq
#' 
#' @param x an object of the class \code{ProteinSeq}
#' @param n number of aminoacids to be shown
#' @param ... arguments to be passed to or from other methods.
#' 
#' @return Shows the first \code{n} elements of a \code{ProteinSeq} object.
#' 
#' 
#' @export

head.ProteinSeq=function(x, n=20, ...){
  
  if (!is.ProteinSeq(x)) {
    stop("Invalid ProteinSeq object, type in the console: \n \n ??ProteinSeq")
  }
  
  n=min(n, length(x))
  res=list()
  ids = 1:n
  for(i in ids){
    aux = unlist(strsplit(x[i],""))[1:n]  
    names(aux)=NULL
    res[[i]] = paste0(aux, collapse = "")
  }
  names(res) = names(x[ids])
  
  return(res)
}

#' @rdname ProteinSeq
#' 
#' @param x an object of the class \code{ProteinSeq}
#' @param n number of aminoacids to be shown
#' @param ... arguments to be passed to or from other methods.
#' 
#' #' @return Shows the last \code{n} elements of a \code{ProteinSeq} object.
#' 
#' @export
tail.ProteinSeq=function(x, n=20, ...){
  
  if (!is.ProteinSeq(x)) {
    stop("Invalid ProteinSeq object, type in the console: \n \n ??ProteinSeq")
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

