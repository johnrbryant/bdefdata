
library(readr)
library(dplyr)

levels_region <- c("West Coast",
                   "Marlborough",
                   "Gisborne",
                   "Nelson",
                   "Tasman",
                   "Southland",
                   "Taranaki",
                   "Hawke's Bay",
                   "Northland",
                   "Otago",
                   "Manawatu-Wanganui",
                   "Bay of Plenty",
                   "Waikato",
                   "Wellington",
                   "Canterbury",
                   "Auckland")

new_zealand_popn_census <- read_csv("data-raw/new_zealand_popn_census/rc13_pop9616_rnd.csv") %>%
    filter(rc13desc != "Area Outside Region") %>%
    mutate(region = gsub(" Region", "", rc13desc),
           region = factor(region, levels = levels_region)) %>%
    rename(time = year) %>%
    filter(time %in% c(1996, 2001, 2006, 2013)) %>%
    xtabs(count ~ region + time, data = .) %>%
    array(., dim = dim(.), dimnames = dimnames(.))

save(new_zealand_popn_census,
     file = "data/new_zealand_popn_census.rda",
     compress = "xz")
