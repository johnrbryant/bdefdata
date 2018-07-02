
library(methods)
library(dembase)
library(dplyr)
library(tidyr)
library(readr)

maori_deaths <- read_csv("data-raw/maori_deaths/VSD349301_20180630_115444_58.csv",
                         skip = 2,
                         n_max = 202,
                         col_names = c("sex", "age", 1996:2017)) %>%
    mutate(age = cleanAgeGroup(age),
           age = factor(age, levels = c(0:99, "100+"))) %>%
    mutate(sex = rep(sex[c(1, 102)], each = 101),
           sex = factor(sex, levels = c("Female", "Male"))) %>%
    gather(key = year, value = count, `1996`:`2017`) %>%
    xtabs(count ~ age + sex + year, data = .) %>%
    array(dim = dim(.), dimnames = dimnames(.))

save(maori_deaths,
     file = "data/maori_deaths.rda")



