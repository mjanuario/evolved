birds <- read.csv("./data-raw/birds_spp.csv")

birds_spp = birds$x

usethis::use_data(birds_spp, overwrite = TRUE)
