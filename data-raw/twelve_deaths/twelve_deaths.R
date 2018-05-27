
library(methods)
library(dplyr)

twelve_deaths <- read.csv("data-raw/twelve_deaths/twelve_deaths.csv",
                          stringsAsFactors = FALSE) %>%
    mutate(region = factor(region, levels = c("West", "East")))

save(twelve_deaths,
     file = "data/twelve_deaths.rda")
