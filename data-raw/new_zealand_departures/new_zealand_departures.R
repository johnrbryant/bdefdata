
library(readr)
library(dplyr)


levels_region <- c("Not Stated",
                   "West Coast",
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

new_zealand_departures <- read_csv("data-raw/new_zealand_departures/rc13_pltmig_9716.zip") %>%
    filter(direction == "Departures") %>%
    filter(rc13desc != "Area Outside") %>%
    mutate(region = gsub(" Region", "", rc13desc),
           region = recode(region, "Area outside region/ not stated" = "Not Stated"),
           region = factor(region, levels = levels_region)) %>%
    rename(time = year) %>%
    xtabs(count ~ region + time, data = .) %>%
    array(., dim = dim(.), dimnames = dimnames(.))

save(new_zealand_departures,
     file = "data/new_zealand_departures.rda",
     compress = "xz")
