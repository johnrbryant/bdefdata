
library(methods)
library(dplyr)
library(tidyr)
library(readxl)
library(dembase)

denominator <- 100

china_deaths_un <- read_xlsx("data-raw/china_deaths_un/NumberDeaths-20171201121407.xlsx",
                       sheet = 2,
                       skip = 1) %>%
    filter(Location == "China") %>%
    gather(key = "age", value = "count", `0-4`:`95+`) %>%
    select(age = age, sex = Sex, time = Time, count) %>%
    extract(col = time, into = c("start", "stop"), regex = "([:digit:]+) - ([:digit:]+)", convert = TRUE) %>%
    mutate(start = start + 1) %>% ## NEED TO CHANGE THIS AFTER FINISHING CHANGES TO DEMBASE
    unite(col = time, start, stop, sep = "-", remove = TRUE) %>%
    mutate(count = (1000 / denominator) * count) %>%
    xtabs(count ~ age + time, .) %>%
    Counts() %>%
    collapseIntervals(dimension = "age", breaks = seq(0, 80, 5)) %>%
    toInteger(force = TRUE) %>%
    as.array()

save(china_deaths_un,
     file = "data/china_deaths_un.rda")
