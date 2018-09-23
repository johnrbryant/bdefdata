
library(methods)
library(dembase)
library(dplyr)
library(tidyr)
library(readr)



levels_region <- c("Westfjords",
                   "Northwest",
                   "East",
                   "West",
                   "Southwest",
                   "South",
                   "Northeast",
                   "Capital")

iceland_migration <- bind_rows(read_csv2("data-raw/iceland_migration/MAN01001.csv", skip = 2),
                               read_csv2("data-raw/iceland_migration/MAN01001-2.csv", skip = 2)) %>%
    gather(key = "age_dest", value = "count", `Under 1 year To capital area`:`80 years and over To South`) %>%
    separate(col = "age_dest", into = c("age", "region_dest"), sep = " To ") %>%
    mutate(age = cleanAgeGroup(age),
           age = factor(age, levels = c(0:79, "80+"))) %>%
    rename(sex = Sex, time = Year, region_orig = "Region migrated from") %>%
    mutate(region_orig = sub("From ", "", region_orig),
           region_orig = recode(region_orig, "capital area" = "Capital"),
           region_orig = factor(region_orig, levels = levels_region)) %>%
    mutate(region_dest = recode(region_dest, "capital area" = "Capital", "Norrheast" = "Northeast"),
           region_dest = factor(region_dest, levels = levels_region)) %>%
    filter(time %in% 2006:2015) %>%
    mutate(sex = factor(sex, levels = c("Females", "Males"), labels = c("Female", "Male"))) %>%
    xtabs(count ~ age + sex + region_orig + region_dest + time, data = .) %>%
    array(., dim = dim(.), dimnames = dimnames(.))

save(iceland_migration,
     file = "data/iceland_migration.rda",
     compress = "bzip2")
