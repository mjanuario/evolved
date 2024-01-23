#' Counting protein sequence differences
#'
#' \code{countSeqDiffs} counts the number of protein differences among two sequences of proteins within the same "ProteinSeq" object.
#'
#' @param x A "ProteinSeq" object containing proteins from \code{taxon1} 
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
  
  if(!is.ProteinSeq(x)){
    stop("x must be an object of the class proteinSeq. Fro details, see: \n ??proteinSeq")
  }
  
  if(any(!c(is.character(taxon1), is.character(taxon1)))){
    stop("Both \"taxon1\" and \"taxon2\" must be character vectors")
  }
  
  if(sum(c(taxon1, taxon2) %in% names(x))<2){
    stop("Both \"taxon1\" and \"taxon2\" must be in \"x\"")
  }
  
  x1 <- unlist(strsplit(x[taxon1], split=""))
  x2 <- unlist(strsplit(x[taxon2], split=""))
  return(sum(x1 != x2))
}
