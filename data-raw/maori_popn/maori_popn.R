
library(methods)
library(readxl)
library(dplyr)
library(tidyr)
library(dembase)

col_names <- c("age", "NULL",
               paste(rep(c(1996, 2001, 2006, 2013), each = 2),
                     rep(c("Male", "Female"), times = 4)))
maori_popn <- read_xlsx("data-raw/maori_popn/6a04af0d-c193-49d4-9ace-81d90f32211b.xlsx",
                        range = "B5:K95",
                        col_names = col_names) %>%
    select(-`NULL`) %>%
    gather(key = year_sex, value = count, -age) %>%
    separate(col = year_sex, into = c("year", "sex")) %>%
    mutate(age = cleanAgeGroup(age),
           age = factor(age, levels = c(0:89, "90+"))) %>%
    mutate(count = as.integer(count)) %>%
    xtabs(count ~ age + sex + year, data = .) %>%
    array(., dim = dim(.), dimnames = dimnames(.))

save(maori_popn,
     file = "data/maori_popn.rda")
