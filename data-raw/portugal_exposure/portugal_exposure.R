
library(methods)
library(dplyr)
library(tidyr)
library(dembase)

portugal_exposure <- read.table("data-raw/portugal_exposure/Exposures_1x1.txt",
                                skip = 2,
                                header = TRUE,
                                na.string = ".") %>%
    select(year = Year, age = Age, Female, Male) %>%
    gather(key = sex, value = count, Female, Male) %>%
    filter(year %in% 1950:2015) %>%
    xtabs(count ~ age + sex + year, data = .) %>%
    Counts(dimscales = c(year = "Intervals")) %>%
    collapseIntervals(dimension = "age", breaks = c(0, 1, seq(5, 100, 5))) %>%
    as("array")


save(portugal_exposure,
     file = "data/portugal_exposure.rda",
     compress = "bzip2")

