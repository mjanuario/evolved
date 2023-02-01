#apenas esqueletos, fazer documentacao

#' Whale body size
#'
#' description
#'
#' @format ## `whale_body_size`
#' A \code{data.frame} containing data on the body size of many cetacean species. Species follow taxonomy from Steeman et al (2009). Species-specific speciation rates from Rabosky 2014 & Rabosky et al, 2014. Mass data from PanTheria (Jones et al, 2009).

#' \describe{
#'   \item{species}{Whale species}
#'   \item{log_mass}{log of body mass (grams)}
#'   \item{S}{species-specific speciation rate}
#'   \item{color}{suggested color to be used for the tip's clade}
#' }
#' @source Compilation of many primary sources (see description).
#' @references 
#'  Jones, K. E., Bielby, J., Cardillo, M., Fritz, S. A., O'Dell, J., Orme, C. D. L., ... & Purvis, A. (2009). PanTHERIA: a species‐level database of life history, ecology, and geography of extant and recently extinct mammals: Ecological Archives E090‐184. Ecology, 90(9), 2648-2648.
#'  
#'  Rabosky, D. L. (2014). Automatic detection of key innovations, rate shifts, and diversity-dependence on phylogenetic trees. PloS one, 9(2), e89543.
#'  
#'  Rabosky, D. L., Grundler, M., Anderson, C., Title, P., Shi, J. J., Brown, J. W., ... & Larson, J. G. (2014). BAMM tools: an R package for the analysis of evolutionary dynamics on phylogenetic trees. Methods in Ecology and Evolution, 5(7), 701-707.
#'  
#'  Steeman, M. E., Hebsgaard, M. B., Fordyce, R. E., Ho, S. Y., Rabosky, D. L., Nielsen, R., ... & Willerslev, E. (2009). Radiation of extant cetaceans driven by restructuring of the oceans. Systematic biology, 58(6), 573-585.
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
#' A \code{vector}  A vector containing the names of almost all (i.e., 9993) extant bird species, following Jetz et al (2012) taxonomy
#' 
#' @source Actual file donwloaded from https://vertlife.org/data/
#' @references 
#' Jetz, W., Thomas, G. H., Joy, J. B., Hartmann, K., & Mooers, A. O. (2012). The global diversity of birds in space and time. Nature, 491(7424), 444-448.
"birds_spp"

#' Mammals species list
#'
#' description
#'
#' @format ## `mammals_spp`
#' A \code{vector}  A vector containing the names of almost all (i.e., 4099) extant mammal species, following Upham et al (2019) taxonomy
#' @source Actual file donwloaded from https://vertlife.org/data/
#' @references 
#' Upham, N. S., Esselstyn, J. A., & Jetz, W. (2019). Inferring the mammal tree: species-level sets of phylogenies for questions in ecology, evolution, and conservation. PLoS biology, 17(12), e3000494.
"mammals_spp"

########################################################

#' Occurrences of ammonoid fossils
#'
#' description
#'
#' @format ## `ammonoidea_fossil`
#' A \code{data.frame} containing many ammonoid (Cephalopoda, Mollusca) fossil occurrences from different moments of the geological past. Much information (i.e., extra columns) was removed from the original datset to make it more compact, but it can be accessed by the data URL.

#' \describe{
#'   \item{phylum}{Organism phylum}
#'   \item{class}{Organism taxonomic class}
#'   \item{order}{Organism taxonomic order}
#'   \item{family}{Organism taxonomic family}
#'   \item{genus}{Organism genus}
#'   \item{species}{Organism specific name}
#'   \item{early_interval}{earlier known geological period of ocurence}
#'   \item{late_interval}{later known geological period of ocurence}
#'   \item{max_ma}{ocurrence's oldest time boundary in million years}
#'   \item{min_ma}{ocurrence's newest time boundary in million years}
#'   \item{midpoint}{midpoint between max_ma and min_ma}
#'   \item{lng}{longitude of place where occurrence was found}
#'   \item{lat}{latitude of place where occurrence was found}
#' }
#' @source The Paleobiology Database (donwloaded on 2022-03-11)
#' Data URL: "http://paleobiodb.org/data1.2/occs/list.csv?datainfo&rowcount&base_name=Ammonoidea&show=full,classext,genus,subgenus,acconly,ident,img,etbasis,strat,lith,env,timebins,timecompare,resgroup,ref,ent,entname,crmod"
"ammonoidea_fossil"

#' Occurrences of mammal fossils
#'
#' description
#'
#' @format ## `mammals_fossil`
#' A \code{data.frame} containing many 
#' mammal fossil occurrences from different moments of the geological past. 
#' Much information (i.e., extra columns) was removed from the original 
#' dataset to make it more compact, but it can be accessed by the data URL.
#' \describe{
#'   \item{phylum}{Organism phylum}
#'   \item{class}{Organism taxonomic class}
#'   \item{order}{Organism taxonomic order}
#'   \item{family}{Organism taxonomic family}
#'   \item{genus}{Organism genus}
#'   \item{species}{Organism specific name}
#'   \item{early_interval}{earlier known geological period of ocurence}
#'   \item{late_interval}{later known geological period of ocurence}
#'   \item{max_ma}{ocurrence's oldest time boundary in million years}
#'   \item{min_ma}{ocurrence's newest time boundary in million years}
#'   \item{midpoint}{midpoint between max_ma and min_ma}
#'   \item{lng}{longitude of place where occurrence was found}
#'   \item{lat}{latitude of place where occurrence was found}
#' }
#' @source The Paleobiology Database (donwloaded on 2022-03-11)
#' Data URL: "http://paleobiodb.org/data1.2/occs/list.csv?datainfo&rowcount&base_name=Mammalia&show=full,classext,genus,subgenus,acconly,ident,img,etbasis,strat,lith,env,timebins,timecompare,resgroup,ref,ent,entname,crmod"
"mammals_fossil"

#' Occurrence of dinossaur fossils
#'
#' description
#'
#' @format ## `dinos_fossil`
#' A \code{data.frame} containing many dinosaur (including avian species) fossil occurrences from different moments of the geological past. Much information (i.e., extra columns) was removed from the original datset to make it more compact, but it can be accessed by the data URL.
#' \describe{
#'   \item{phylum}{Organism phylum}
#'   \item{class}{Organism taxonomic class}
#'   \item{order}{Organism taxonomic order}
#'   \item{family}{Organism taxonomic family}
#'   \item{genus}{Organism genus}
#'   \item{species}{Organism specific name}
#'   \item{early_interval}{earlier known geological period of ocurence}
#'   \item{late_interval}{later known geological period of ocurence}
#'   \item{max_ma}{ocurrence's oldest time boundary in million years}
#'   \item{min_ma}{ocurrence's newest time boundary in million years}
#'   \item{midpoint}{midpoint between max_ma and min_ma}
#'   \item{lng}{longitude of place where occurrence was found}
#'   \item{lat}{latitude of place where occurrence was found}
#' }
#' @source The Paleobiology Database (donwloaded on 2022-03-11)
#' Data URL: "http://paleobiodb.org/data1.2/occs/list.csv?datainfo&rowcount&base_name=Dinosauria&show=full,classext,genus,subgenus,acconly,ident,img,etbasis,strat,lith,env,timebins,timecompare,resgroup,ref,ent,entname,crmod"
"dinos_fossil"

#' Occurrence of trilobite fossils
#'
#' description
#'
#' @format ## `trilob_fossil`
#' A \code{data.frame} containing many trilobite fossil occurrences from different moments of the geological past. Much information (i.e., extra columns) was removed from the original dataset to make it more compact, but it can be accessed by the data URL.
#' \describe{
#'   \item{phylum}{Organism phylum}
#'   \item{class}{Organism taxonomic class}
#'   \item{order}{Organism taxonomic order}
#'   \item{family}{Organism taxonomic family}
#'   \item{genus}{Organism genus}
#'   \item{species}{Organism specific name}
#'   \item{early_interval}{earlier known geological period of ocurence}
#'   \item{late_interval}{later known geological period of ocurence}
#'   \item{max_ma}{ocurrence's oldest time boundary in million years}
#'   \item{min_ma}{ocurrence's newest time boundary in million years}
#'   \item{midpoint}{midpoint between max_ma and min_ma}
#'   \item{lng}{longitude of place where occurrence was found}
#'   \item{lat}{latitude of place where occurrence was found}
#' }
#' @source The Paleobiology Database (donwloaded on 2022-03-11)
#' Data URL: "http://paleobiodb.org/data1.2/occs/list.csv?datainfo&rowcount&base_name=Trilobita&show=full,classext,genus,subgenus,acconly,ident,img,etbasis,strat,lith,env,timebins,timecompare,resgroup,ref,ent,entname,crmod"
"trilob_fossil"

#' Fossil timeseries
#'
#' description
#'
#' @format ## `timeseries_fossil`
#' A \code{data.frame} with 6 colums and 598 rows containing values of clade diveristy for many clades of organisms (note some clades are nested within other clades in the dataset). Legend: anth = Anthozoa (Cnidaria); art = Articulata (Crinoidea, Echinodermata); biv = Bivalvia (Mollusca); bryo = Bryozoa (	Lophotrochozoa, Ectoprocta); ceph = Cephalopoda (Mollusca); chon = Chondrocytes (Chordata); crin = Crinoidae (Echinodermata); dinosauria = Dinosauria (Chordata); ech = Echinoidea (Echinodermata); foram = Foraminifera (Retaria); gast = Gastropoda (Mollusca); graptoloids = Graptolites (Graptolithina); ling = Ligulata (Brachiopoda); ostr = Ostracoda (Crustacea, Arthropoda); tril = Trilobita (Arthropoda)

#' \describe{
#'   \item{clade}{clade} Timeseries clade. 
#'   \item{source}{source} Primary source of the timeseries
#'   \item{stem_age}{Stem age} Stem age of clade
#'   \item{rel_time}{Relative time} Geological time (in Million years ago relative to present)
#'   \item{time_ma}{Time} Geological time in million years since clade stem age
#'   \item{richness}{species richness} Number of species at given geological time
#' }
#' @source Data originally compiled from many primary sources. Organized, curated by, and downloaded from, Rabosky & Benson (2021)
#' @references 
#' Rabosky, D. L., & Benson, R. B. (2021). Ecological and biogeographic drivers of biodiversity cannot be resolved using clade age-richness data. Nature Communications, 12(1), 2945.
"timeseries_fossil"