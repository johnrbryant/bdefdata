
library(methods)
library(dplyr)
library(readr)


netherlands_cpi <- read_csv("data-raw/netherlands_cpi/KEI_04062016052113516.csv") %>%
    filter(Frequency == "Annual") %>%
    select(time = Time, value = Value) %>%
    filter(time %in% 2003:2011) %>%
    mutate(value = value / last(value)) %>%
    xtabs(value ~ time, data = .) %>%
    array(., dim = dim(.), dimnames = dimnames(.))

save(netherlands_cpi,
     file = "data/netherlands_cpi.rda")

