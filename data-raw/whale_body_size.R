data_whales <- read.csv("./data-raw/whale_body_size.csv")

usethis::use_data(data_whales, overwrite = TRUE)
