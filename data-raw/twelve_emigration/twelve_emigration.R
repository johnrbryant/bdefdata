
library(methods)
library(dplyr)

twelve_emigration <- read.csv("data-raw/twelve_emigration/twelve_emigration.csv",
                              stringsAsFactors = FALSE) %>%
    mutate(region = factor(region, levels = c("West", "East")))

save(twelve_emigration,
     file = "data/twelve_emigration.rda")
