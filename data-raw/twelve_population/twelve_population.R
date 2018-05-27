
library(methods)
library(dplyr)

twelve_population <- read.csv("data-raw/twelve_population/twelve_population.csv",
                              stringsAsFactors = FALSE)  %>%
    mutate(region = factor(region, levels = c("West", "East")))

save(twelve_population,
     file = "data/twelve_population.rda")
