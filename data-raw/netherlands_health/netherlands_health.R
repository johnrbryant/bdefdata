
library(methods)
library(dplyr)
library(readr)
library(dembase)

netherlands_health <- read_csv("data-raw/netherlands_health/EBDAG_24052016055802288.csv") %>%
    filter(Unit == "Million of national currency units") %>%
    select(diag = `Diagnostic Category`, age = `Age Group`, time = Year, value = Value) %>%
    mutate(age = cleanAgeGroup(age),
           age = factor(age, levels = unique(age))) %>%
    mutate(diag = factor(diag, levels = unique(diag))) %>%
    mutate(time = factor(time, levels = 2003:2011)) %>%
    with(., tapply(value, list(age = age, diag = diag, time = time), sum))

save(netherlands_health,
     file = "data/netherlands_health.rda")

