#' Plot protein sequence(s)
#'
#' \code{plotProteinSeq} draws the sequences of proteins within the same "ProteinSeq" object. In this format, more similar sequences will have 
#' similar banding patterns.
#'
#' @param x A "ProteinSeq" object containing proteins from \code{taxon1} 
#' and \code{taxon2}.
#' @param taxon.to.plot A character vector providing the common name of the species that will be plotted. Must be a name present in \code{x}.
#' @param knitr Logical indicating if plot is intended to show up in RMarkdown files made by the \code{Knitr} R package.
#' 
#' @return A draw of the protein sequence(s) provided. Colors refer to 
#' specific amino acids ("R", "W", "I", "F", "S", "T", "N", "H", "K", "D", "G", "L", "Y", "V", "M", "A", "E", "P", "Q", "C")", "gaps/space in the sequence ("-"), ambiguous amino acid ("B" - often representing either asparagine ("N") or aspartic acid ("D")), or another marker for  ambiguous amino acid ("X").
#' 
#' @export plotProteinSeq
#' 
#' @author Matheus Januario, Jennifer Auler
#' 
#' @examples
#' data(cytOxidase)
#' plotProteinSeq(cytOxidase, c("human", "chimpanzee", "cnidaria"), knitr = TRUE)
#' 
plotProteinSeq=function(x, taxon.to.plot, knitr = FALSE){
  # A species list:
  ids=match(names(x), taxon.to.plot)
  
  # a set of colors:
  cols= c("dodgerblue2", "#E31A1C", "green4",
          "#6A3D9A", "#FF7F00", "black", "gold1",
          "skyblue2", "#FB9A99", "palegreen2",
          "#CAB2D6", "#FDBF6F", "gray70", "khaki2",
          "maroon", "orchid1", "deeppink1", "blue1", "steelblue4",
          "darkturquoise", "green1", "yellow4", "yellow3",
          "darkorange4", "brown")
  
  # A list of amino acids:
  AAs = c("-", "R", "W", "I", "F", "S", "T", "N", "H", "K", "D", "G", "L", "Y", "V", "M", "A", "E", "P", "Q", "C", "X", "B")
  
  # ploting:
  ############################################
  # Be sure to not change user's par() configs:
  oldpar <- par(no.readonly = TRUE) 
  on.exit(par(oldpar)) 
  ############################################
  
  par(mar = c(5.1, 4.1, 4.1, .5))
  if(!knitr){
    dev.new()
  }
  plot(NA, xlim = c(-60,513), ylim = c(0.5,0.5+length(taxon.to.plot)), yaxt="n",
       frame.plot = F, xlab="Amino Acid sites", ylab="Species")
  text(x = rep(-40, times=length(taxon.to.plot)), cex=.7,
       1:length(taxon.to.plot), labels = taxon.to.plot)
  
  for(i in 1:length(taxon.to.plot)){
    chars = unlist(strsplit(x[taxon.to.plot[i]], ""))
    
    for(s in 1:513){
      polygon(
        x = c(s-0.5, s+0.5, s+0.5, s-0.5),
        y = c(i-0.5, i-0.5, i+0.5, i+0.5),
        col = cols[match(chars[s], AAs)], border = NA
      )  
    }
  }  
}

