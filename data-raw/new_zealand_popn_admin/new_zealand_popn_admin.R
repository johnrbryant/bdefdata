
library(readr)
library(dplyr)

new_zealand_popn_admin <- read_csv("data-raw/new_zealand_popn_admin/exp-pop-estimates-2007-16-csv.csv") %>%
    rename(time = year, count = idierp) %>%
    xtabs(count ~ time, data = .) %>%
    array(., dim = dim(.), dimnames = dimnames(.))

save(new_zealand_popn_admin,
     file = "data/new_zealand_popn_admin.rda",
     compress = "xz")
