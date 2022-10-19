fname <- "cyt-oxidase1-mt-aligned.txt"

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

seq_length <- function(x){
  return(length(unlist(strsplit(x, split=""))))
}

count_seq_diffs <- function(x, taxon1, taxon2){
  x1 <- unlist(strsplit(x[taxon1], split=""))
  x2 <- unlist(strsplit(x[taxon2], split=""))
  return(sum(x1 != x2))
}




all_seqs <- read_aa_alignment(fname)

