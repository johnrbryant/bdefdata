
library(methods)
library(dembase)
library(dplyr)
library(readr)

denominator <- 1000
age_levels <- c(0:99, "100+")

china_population_census <- read_csv("data-raw/china_population_census/UNdata_Export_20180121_001507260.csv",
                                    n_max = 734) %>%
    select(age = Age, sex = Sex, time = Year, count = Value) %>%
    mutate(age = gsub("100 \\+", "100+", age)) %>%
    filter(age %in% age_levels) %>%
    mutate(age = factor(age, levels = age_levels)) %>%
    mutate(count = count / denominator) %>%
    xtabs(count ~ age + time, data = .) %>%
    Counts() %>%
    collapseIntervals(dimension = "age", breaks = seq(0, 80, 5)) %>%
    toInteger(force = TRUE) %>%
    as.array()

save(china_population_census,
     file = "data/china_population_census.rda")
