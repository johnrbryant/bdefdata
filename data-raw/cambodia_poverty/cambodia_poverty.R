
library(methods)
library(readr)
library(dplyr)

cambodia_poverty <- read_csv("data-raw/cambodia_poverty/undp_poverty.csv") %>%
    slice(-1) %>%
    select(province = Province, poverty = `2009 \n(%)`) %>%
    mutate(poverty = as.numeric(poverty)) %>%
    mutate(province = recode(province, "Otdor Meanchey" = "Otdar Meanchey", "Kracheh" = "Kratie")) %>%
    arrange(poverty) %>%
    as.data.frame()
    
save(cambodia_poverty,
     file = "data/cambodia_poverty.rda")

