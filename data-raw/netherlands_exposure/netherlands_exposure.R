
library(methods)
library(dplyr)
library(readr)
library(dembase)

est <- read_csv("data-raw/netherlands_exposure/demo_pjan_1_Data.csv") %>%
    select(year = TIME, age = AGE, sex = SEX, count = Value) %>%
    mutate(age = recode(age, "Less than 1 year" = "0", "Open-ended age class" = "100+"),
           age = sub(" year| years", "", age)) %>%
    mutate(year = year - 1) %>% # required because refers to 1 Jan, not Dec 31 (as dembase assumes)
    mutate(sex = recode(sex, "Females" = "Female", "Males" = "Male")) %>%
    xtabs(count ~ age + sex + year, data = .) %>%
    Counts(dimscales = c(year = "Points"))

proj <- read_csv("data-raw/netherlands_exposure/proj_15npms_1_Data.csv") %>%
    filter(TIME > 2016) %>%
    select(year = TIME, age = AGE, sex = SEX, count = Value) %>%
    mutate(age = recode(age, "Less than 1 year" = "0", "100 years or over" = "100+"),
           age = sub(" year| years", "", age)) %>%
    mutate(year = year - 1) %>% # required because refers to 1 Jan, not Dec 31 (as dembase assumes)
    mutate(sex = recode(sex, "Females" = "Female", "Males" = "Male")) %>%
    xtabs(count ~ age + sex + year, data = .) %>%
    Counts(dimscales = c(year = "Points"))

population <- dbind(est, proj, along = "year") %>%
    collapseIntervals(dimension = "age", breaks = c(0, 1, seq(5, 95, 5))) %>%
    subarray(year %in% 2002:2023)

netherlands_exposure <- exposure(population) %>%
    as.array()

save(netherlands_exposure,
     file = "data/netherlands_exposure.rda",
     compress = "xz")

