read_aa_alignment <- function(fname){
  
  xx <- scan(fname, sep="\n", what = "character")
  seqs <- xx[seq(2, length(xx), by=2)]
  ns <- xx[seq(1, length(xx), by=2)]
  ns <- gsub(">", "", ns)
  names(seqs) <- ns
  fx <- function(z) return(length(unlist(strsplit(z, ""))))
  ll <- sapply(seqs, fx)
  if (length(table(ll)) >= 2){
    stop("Error: Bad sequence length\n")
  }
  
  # Default trimming of sequences to get rid of bad ends:
  
  for (ii in 1:length(seqs)){
    tmp <- unlist(strsplit(seqs[ii], split=""))
    ll <- length(tmp)
    tmp <- tmp[1:(ll-20)]
    tmp <- tmp[5:length(tmp)]
    seqs[ii] <- paste(tmp, collapse="")
  }
  
  return(seqs)
}

fname = "./data-raw/cyt-oxidase1-mt-aligned.txt"
cytOxidase = read_aa_alignment(fname)

use_data(cytOxidase, overwrite = TRUE)
