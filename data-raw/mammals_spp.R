mammals <- read.csv("./data-raw/mammals_spp.csv")

mammals_spp = mammals$x

usethis::use_data(mammals_spp, overwrite = TRUE)
