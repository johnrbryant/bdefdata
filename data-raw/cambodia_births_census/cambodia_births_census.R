
library(methods)
library(tidyverse)
library(dembase)
library(readxl)


provinces_order_data <- c("Banteay Meanchey",
                          "Battambang",
                          "Kampong Cham",
                          "Kampong Chhnang",
                          "Kampong Speu",
                          "Kampong Thom",
                          "Kampot",
                          "Kandal",
                          "Koh Kong",
                          "Kratie",
                          "Mondul Kiri",
                          "Phnom Penh",
                          "Preah Vihear",
                          "Prey Veng",
                          "Pursat",
                          "Ratanak Kiri",
                          "Siem Reap",
                          "Preah Sihanouk",
                          "Stung Treng",
                          "Svay Rieng",
                          "Takeo",
                          "Otdar Meanchey",
                          "Kep",
                          "Pailin")


provinces_order_poverty <- c("Phnom Penh",
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


getOneDataset <- function(i) {
    path <- sprintf("data-raw/cambodia_births_census/reporte-%d.xls", i)
    ans <- read_xls(path,
                    range = "B2:F9",
                    na = "-")
    no_3 <- colnames(ans)[5] == "Total"
    if (no_3)
        ans[[5]] <- NA
    colnames(ans) <- c("age", "No children", "1 child", "2 children", "3 children")
    ans$province <- provinces_order_data[(i - 1) %% 24 + 1]
    ans$sex <- c("Male", "Female")[((i - 1) %/% 24) + 1]
    ans
}

cambodia_births_census <- lapply(1:48, getOneDataset) %>%
    bind_rows() %>%
    mutate(age = cleanAgeGroup(age)) %>%
    gather(key = "children", value = "count_women", `No children`:`3 children`) %>%
    mutate(count_women = ifelse(is.na(count_women), 0L, as.integer(count_women))) %>%
    mutate(count_children = case_when(children == "1 child" ~ count_women,
                                      children == "2 children" ~ 2L * count_women,
                                      children == "3 children" ~ 3L * count_women,
                                      TRUE ~ 0L)) %>%
    mutate(province = factor(province, levels = provinces_order_poverty)) %>%
    xtabs(count_children ~ age + province, data = .) %>%
    array(dim = dim(.), dimnames = dimnames(.))


save(cambodia_births_census,
     file = "data/cambodia_births_census.rda")
      
