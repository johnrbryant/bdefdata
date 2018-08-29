
library(methods)
library(dplyr)
library(tidyr)
library(readxl)
library(dembase)

denominator <- 100

china_births_un <- read_xlsx("data-raw/china_births_un/NumberBirthsAgeMother-20171130020714.xlsx",
                       sheet = 2,
                       skip = 1) %>%
    filter(Location == "China") %>%
    gather(key = "age", value = "count", `15-19`:`45-49`) %>%
    select(age = age, time = Time, count) %>%
    extract(col = time, into = c("start", "stop"), regex = "([:digit:]+) - ([:digit:]+)", convert = TRUE) %>%
    mutate(start = start + 1) %>% ## NEED TO CHANGE THIS AFTER FINISHING CHANGES TO DEMBASE
    unite(col = time, start, stop, sep = "-", remove = TRUE) %>%
    mutate(count = (1000 / denominator) * count) %>%
    xtabs(count ~ age + time, .) %>%
    Counts() %>%
    toInteger(force = TRUE) %>%
    as.array()

save(china_births_un,
     file = "data/china_births_un.rda")
