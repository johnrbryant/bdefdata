
library(methods)
library(dplyr)
library(dembase)
library(readr)

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

new_zealand_internal_admin <- read_csv("data-raw/new_zealand_internal_admin/rc_movements_07_17_v2.csv") %>%
    mutate(region_orig = sub(" Region", "", prev_rcdesc),
           region_dest = sub(" Region", "", new_rcdesc),
           region_orig = factor(region_orig, levels = levels_region),
           region_dest = factor(region_dest, levels = levels_region)) %>%
    rename(time = year) %>%
    filter(time < 2017) %>%
    xtabs(count ~ region_orig + region_dest + time, data = .) %>%
    array(dim = dim(.), dimnames = dimnames(.))

save(new_zealand_internal_admin,
     file = "data/new_zealand_internal_admin.rda")
