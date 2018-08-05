
library(methods)
library(dplyr)
library(readr)
library(dembase)

netherlands_population <- read_csv("data-raw/netherlands_population/POP_PROJ_04062016225548685.csv") %>%
    select(age = Age, sex = Sex, time = Time, value = Value) %>%
    mutate(age = sub("Population (hist&proj)  ", "", age, fixed = TRUE),
           age = cleanAgeGroup(age)) %>%
    filter(time %in% 2003:2021) %>%
    xtabs(value ~ age + sex + time, data = .) %>%
    array(dim = dim(.), dimnames = dimnames(.))

save(netherlands_population,
     file = "data/netherlands_population.rda",
     compress = "xz")

