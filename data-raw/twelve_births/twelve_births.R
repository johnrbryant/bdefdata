
library(methods)
library(dplyr)

twelve_births <- read.csv("data-raw/twelve_births/twelve_births.csv",
                          stringsAsFactors = FALSE) %>%
    mutate(region = factor(region, levels = c("West", "East")))

save(twelve_births,
     file = "data/twelve_births.rda")
