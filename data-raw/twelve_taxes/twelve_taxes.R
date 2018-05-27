
library(methods)
library(dplyr)

twelve_taxes <- read.csv("data-raw/twelve_taxes/twelve_taxes.csv",
                         stringsAsFactors = FALSE) %>%
    mutate(region = factor(region, levels = c("West", "East")))

save(twelve_taxes,
     file = "data/twelve_taxes.rda")
