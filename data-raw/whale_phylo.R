whale_phylo <- ape::read.tree("./data-raw/whale_phylo.tre")

usethis::use_data(whale_phylo, overwrite = TRUE)
