
library(methods)
library(dplyr)
library(dembase)
library(readr)
library(tidyr)

province_levels <- c("Phnom Penh",
                     "Kandal",
                     "Kampot",
                     "Preah Sihanouk",
                     "Kep",
                     "Svay Rieng",
                     "Takeo",
                     "Kampong Cham",    
                     "Koh Kong",
                     "Prey Veng",
                     "Battambang",
                     "Pailin",    
                     "Banteay Meanchey",
                     "Kampong Speu",
                     "Kampong Chhnang",
                     "Siem Reap",
                     "Pursat",
                     "Kampong Thom",
                     "Mondul Kiri",
                     "Kratie",
                     "Otdar Meanchey",
                     "Ratanak Kiri",
                     "Stung Treng",
                     "Preah Vihear")


get_data <- function(name) {
    data <- read.csv(sprintf("data-raw/cambodia_population/%s.csv", name),
                     header = FALSE,
                     nrow = 551,
                     as.is = TRUE,
                     col.names = c("NULL", "age", "male", "female", rep("NULL", 5)),
                     colClasses = c("NULL", "character", "character", "character", rep("NULL", 5)))
    province <- data %>%
        filter(grepl("AREA", age)) %>%
        pull(male)
    ans <- data %>%
        filter(grepl("yrs|years", age)) %>%
        mutate(province = rep(province, each = 17)) %>%
        mutate(age = cleanAgeGroup(age),
               age = factor(age, levels = unique(age))) %>%
        gather(key = sex, value = count, -age, -province) %>%
        mutate(sex = factor(sex, levels = c("female", "male"), labels = c("Female", "Male"))) %>%
        mutate(count = as.integer(count))
    ans
}


cambodia_population <- bind_rows(get_data("urban"), get_data("rural")) %>%
    mutate(province = factor(province, levels = province_levels)) %>%
    xtabs(count ~ age + sex + province, data = .) %>%
    array(dim = dim(.), dimnames = dimnames(.))


save(cambodia_population,
     file = "data/cambodia_population.rda")
