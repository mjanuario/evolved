#apenas esqueletos, fazer documentacao

#' Whale body size
#'
#' description
#'
#' @format ## `whale_body_size`
#' A \code{data.frame} with 4 colums and 75 rows.
#' \describe{
#'   \item{species}{species}
#'   \item{log_mass}{log of body mass (?units)}
#'   \item{S}{?}
#'   \item{color}{?}
#' }
#' @source <??>
"whale_body_size"

#' Cytocrome Oxidase sequences
#'
#' \code{cytOxidase} is a set of homologous protein sequences from the GENE 
#' cytochrome oxidase SUBUNIT 1 gene. This mitochondrial gene, often known as CO1
#' (“see-oh-one”),  plays a key role in cellular respiration. C01 contains 
#' approximately 513 amino acids and has been used by previous studies for 
#' reconstructing phylogenetic trees and estimating divergence times in 
#' Metazoaria by assuming a molecular clock. Its 5′ partition is used for the 
#' ‘Barcoding of Life’ initiative, for instance. 
#' 
#' @details The object is structured as a named list of 17 different animal 
#' species, with each individual list component being a sequence of 513 
#' proteins. 
#'
#' @format ## `cytOxidase`
#' A \code{vector} with 17 entries, each representing a different animal species
#' \describe{
#'   \item{names}{Organism}
#'   \item{sequence}{Aminoacid sequence of length 513}
#' }
#' 
#' @source This sequence was originally downloaded from genebank and later 
#' curated by Daniel Rabosky.
"cytOxidase"

#########################################################

#' Birds species list
#'
#' description
#'
#' @format ## `birds_spp`
#' A \code{vector} with 9993 bird species.

#' @source <??>
"birds_spp"

#' Mammals species list
#'
#' description
#'
#' @format ## `mammals_spp`
#' A \code{vector} with 4099 mammal species.

#' @source <??>
"mammals_spp"

########################################################

#' Occurrence of ammonoideases fossils
#'
#' description
#'
#' @format ## `ammonoidea_fossil`
#' A \code{data.frame} with 13 colums and 58111 rows.
#' \describe{
#'   \item{phylum}{phylum}
#'   \item{class}{class}
#'   \item{order}{order}
#'   \item{family}{family}
#'   \item{genus}{genus}
#'   \item{species}{species}
#'   \item{early_interval}{earlier known geological period of ocurence}
#'   \item{late_interval}{later known geological period of ocurence}
#'   \item{max_ma}{maximum known ocurence in million years}
#'   \item{min_ma}{minimun known ocurence in million years}
#'   \item{midpoint}{midpoint}
#'   \item{lng}{longitude}
#'   \item{lat}{latitude}
#' }
#' @source <??>
"ammonoidea_fossil"

#' Occurrence of mammals fossils
#'
#' description
#'
#' @format ## `mammals_fossil`
#' A \code{data.frame} with 13 colums and 69463 rows.
#' \describe{
#'   \item{phylum}{phylum}
#'   \item{class}{class}
#'   \item{order}{order}
#'   \item{family}{family}
#'   \item{genus}{genus}
#'   \item{species}{species}
#'   \item{early_interval}{earlier known geological period of ocurence}
#'   \item{late_interval}{later known geological period of ocurence}
#'   \item{max_ma}{maximum known ocurence in million years}
#'   \item{min_ma}{minimun known ocurence in million years}
#'   \item{midpoint}{midpoint}
#'   \item{lng}{longitude}
#'   \item{lat}{latitude}
#' }
#' @source <??>
"mammals_fossil"

#' Occurrence of dinossaur fossils
#'
#' description
#'
#' @format ## `dinos_fossil`
#' A \code{data.frame} with 13 colums and 15527 rows.
#' \describe{
#'   \item{phylum}{phylum}
#'   \item{class}{class}
#'   \item{order}{order}
#'   \item{family}{family}
#'   \item{genus}{genus}
#'   \item{species}{species}
#'   \item{early_interval}{earlier known geological period of ocurence}
#'   \item{late_interval}{later known geological period of ocurence}
#'   \item{max_ma}{maximum known ocurence in million years}
#'   \item{min_ma}{minimun known ocurence in million years}
#'   \item{midpoint}{midpoint}
#'   \item{lng}{longitude}
#'   \item{lat}{latitude}
#' }
#' @source <??>
"dinos_fossil"

#' Occurrence of trilobites fossils
#'
#' description
#'
#' @format ## `trilob_fossil`
#' A \code{data.frame} with 13 colums and 24965 rows.
#' \describe{
#'   \item{phylum}{phylum}
#'   \item{class}{class}
#'   \item{order}{order}
#'   \item{family}{family}
#'   \item{genus}{genus}
#'   \item{species}{species}
#'   \item{early_interval}{earlier known geological period of ocurence}
#'   \item{late_interval}{later known geological period of ocurence}
#'   \item{max_ma}{maximum known ocurence in million years}
#'   \item{min_ma}{minimun known ocurence in million years}
#'   \item{midpoint}{midpoint}
#'   \item{lng}{longitude}
#'   \item{lat}{latitude}
#' }
#' @source <??>
"trilob_fossil"

#' Fossil timeseries
#'
#' description
#'
#' @format ## `timeseries_fossil`
#' A \code{data.frame} with 6 colums and 598 rows.
#' \describe{
#'   \item{clade}{clade}
#'   \item{source}{source}
#'   \item{stem_age}{}
#'   \item{rel_time}{}
#'   \item{time_ma}{time in million year}
#'   \item{richness}{species richness}
#' }
#' @source <??>
"timeseries_fossil"