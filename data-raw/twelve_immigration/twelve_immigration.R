
library(methods)
library(dplyr)

twelve_immigration <- read.csv("data-raw/twelve_immigration/twelve_immigration.csv",
                               stringsAsFactors = FALSE) %>%
    mutate(region = factor(region, levels = c("West", "East")))

save(twelve_immigration,
     file = "data/twelve_immigration.rda")
