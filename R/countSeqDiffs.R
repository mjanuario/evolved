#' @importFrom  base unlist
#' @importFrom  base strsplit
NULL 

#' Counting protein sequence differences
#'
#' \code{countSeqDiffs} counts the number of protein differences among two sequences of proteins within the same "ProteinSet" object.
#'
#' @param x A "ProteinSet" object containing proteins from \code{taxon1} 
#' and \code{taxon2}.
#' @param taxon1 A character giving the common name of the first species that 
#' will be compared. Must be a name present in \code{x}.
#' @param taxon2 A character giving the common name of the second species that 
#' will be compared. Must be a name present in \code{x}.
#' 
#' @return A integer giving the number of protein differences between 
#' \code{taxon1} and \code{taxon2}.
#' 
#' @export countSeqDiffs
#' 
#' @author Matheus Januario, Dan Rabosky, Jennifer Auler
#' 
#' @examples
#' countSeqDiffs(cytOxidase, "human", "chimpanzee")
#' 
#' countSeqDiffs(cytOxidase, "human", "cnidaria")
#' 
#' countSeqDiffs(cytOxidase, "chimpanzee", "cnidaria")
#' 
countSeqDiffs <- function(x, taxon1, taxon2){
  if(class(x) != "ProteinSeq"){
    stop("object \"x\" must be from \"ProteinSeq\" class")
  }
  
  if(sum(c(taxon1, taxon2) %in% names(x))<2){
    stop("Both \"taxon1\" and \"taxon2\" must be in \"x\"")
  }
  
  if(class(taxon1)!="character"){
    stop("\"taxon1\" must be a character")
  }
  
  if(class(taxon2)!="character"){
    stop("\"taxon2\" must be a character")
  }
  
  x1 <- unlist(strsplit(x[taxon1], split=""))
  x2 <- unlist(strsplit(x[taxon2], split=""))
  return(sum(x1 != x2))
}
