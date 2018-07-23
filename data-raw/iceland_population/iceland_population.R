
library(methods)
library(dplyr)
library(tidyr)
library(readr)
library(dembase)



levels_region <- c("Westfjords",
                   "Northwest",
                   "East",
                   "West",
                   "Southwest",
                   "South",
                   "Northeast",
                   "Capital")

iceland_population <- read_csv2("data-raw/iceland_population/MAN02005.csv", skip = 2) %>%
    gather(key = "time_sex", value = "count", `1998 Males`:`2017 Females`) %>%
    separate(col = time_sex, into = c("time", "sex")) %>%
    filter(time %in% 2005:2016) %>%
    mutate(i_region = match(Municipality, unique(Municipality))) %>%
    mutate(region = case_when(i_region == 1L ~ "Capital",
                              i_region == 2L ~ "Southwest",
                              TRUE ~ Municipality)) %>%
    mutate(region = factor(region, levels = levels_region)) %>%
    mutate(age = ifelse(Age == "In 1st year", "0", Age),
           age = cleanAgeGroup(age),
           age = ifelse(as.integer(age) >= 80, "80+", age)) %>%
    mutate(sex = factor(sex, levels = c("Females", "Males"), labels = c("Female", "Male"))) %>%
    xtabs(count ~ age + sex + region + time, data = .) %>%
    array(., dim = dim(.), dimnames = dimnames(.))

save(iceland_population,
     file = "data/iceland_population.rda",
     compress = "bzip2")
