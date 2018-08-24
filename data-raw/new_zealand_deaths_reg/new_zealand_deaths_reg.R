
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

new_zealand_deaths_reg <- read_csv("data-raw/new_zealand_deaths_reg/rc13_dths9716_rr3.csv") %>%
    filter(rc13desc != "Area Outside Region") %>%
    mutate(region = gsub(" Region", "", rc13desc),
           region = factor(region, levels = levels_region)) %>%
    rename(time = year) %>%
    xtabs(count ~ region + time, data = .) %>%
    array(., dim = dim(.), dimnames = dimnames(.))

save(new_zealand_deaths_reg,
     file = "data/new_zealand_deaths_reg.rda",
     compress = "xz")
