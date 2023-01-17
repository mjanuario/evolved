#' @importFrom  stats rbinom
#' @importFrom  graphics lines
#' @import grDevices
NULL 

#' Simulating generations of genetic drift in a Wright–Fisher (WF) population
#'
#' \code{cytOxidase} is a set of protein sequences from the GENE cytochrome 
#' oxidase SUBUNIT 1 gene. This mitochondrial gene, often known as CO1 
#' (“see-oh-one”),  plays a key role in cellular respiration. C01 contains 
#' approximately 513 amino acids and has been used by previous studies for 
#' reconstructing phylogenetic trees and estimating divergence times in 
#' Metazoaria by assuming a molecular clock. Its 5′ partition is used for the 
#' ‘Barcoding of Life’ initiative, for instance.
#' 
#' @details The object is structured as a named list of 17 different animal 
#' species, with each individual list component being a sequence of 513 
#' proteins. This sequence was originally donwloaded from genebank and later 
#' curated by Daniel Rabosky. 
#' 
#' @export cytOxidase
#' 
#' @references 
#' 
#' 
#' @author Daniel Rabosky, Matheus Januario, Jennifer Auler
#' 
class(cytOxidase)<-"ProteinSet"




