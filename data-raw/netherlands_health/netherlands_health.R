
library(methods)
library(dplyr)
library(readr)
library(dembase)

netherlands_health <- read_csv("data-raw/netherlands_health/EBDAG_23112017231455293.csv") %>%
    select(age = `Age Group`, sex = Gender, year = Year, value = Value) %>%
    filter(age != "Total") %>%
    mutate(age = cleanAgeGroup(age),
           age = factor(age, levels = unique(age))) %>%
    mutate(time = factor(year, levels = 2003:2011)) %>%
    with(., tapply(value, list(age = age, sex = sex, time = time), sum))

save(netherlands_health,
     file = "data/netherlands_health.rda")

