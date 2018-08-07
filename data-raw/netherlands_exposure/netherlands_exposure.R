
library(methods)
library(dplyr)
library(readr)
library(dembase)

netherlands_exposure <- read_csv("data-raw/netherlands_exposure/POP_PROJ_04062016225548685.csv") %>%
    select(age = Age, sex = Sex, time = Time, value = Value) %>%
    mutate(age = sub("Population (hist&proj)  ", "", age, fixed = TRUE),
           age = cleanAgeGroup(age)) %>%
    filter(time %in% 2003:2022) %>% ## NEED TO CHANGE THIS WHEN DEMBASE CHANGES
    mutate(time = time - 1L) %>%
    xtabs(value ~ age + sex + time, data = .) %>%
    array(dim = dim(.), dimnames = dimnames(.)) %>%
    Counts(dimscales = c(time = "Points")) %>%
    exposure()

save(netherlands_exposure,
     file = "data/netherlands_exposure.rda",
     compress = "xz")

