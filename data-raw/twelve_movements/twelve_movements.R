
library(methods)
library(dplyr)

twelve_movements <- read.csv("data-raw/twelve_movements/twelve_movements.csv",
                             stringsAsFactors = FALSE) %>%
    mutate(region_orig = factor(region_orig , levels = c("West", "East")),
           region_dest = factor(region_dest, levels = c("West", "East")))

save(twelve_movements,
     file = "data/twelve_movements.rda")
