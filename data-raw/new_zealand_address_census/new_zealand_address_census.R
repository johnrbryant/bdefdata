
library(readr)
library(dplyr)
library(MASS)
library(dembase)


## The calculations in the book were based on an aggregated version of a
## dataset that included age and sex. The dataset with age and sex included
## suppressed values, which were imputed. To maintain consistency with the book,
## we use the same data.

levels_region <- c("West Coast",
                   "Marlborough",
                   "Gisborne",
                   "Nelson",
                   "Tasman",
                   "Southland",
                   "Taranaki",
                   "Hawke's Bay",
                   "Northland",
                   "Otago",
                   "Manawatu-Wanganui",
                   "Bay of Plenty",
                   "Waikato",
                   "Wellington",
                   "Canterbury",
                   "Auckland")

new_zealand_address_census <- read_csv("data-raw/new_zealand_address_census/migr_transitions_rc13_9613_rr3.csv",
                         na = c("", "..C")) %>%
    rename(region_dest = rc13desc,
           region_orig = ur5_rc13desc,
           age = age_grp) %>%
    mutate(region_dest = sub(" Region", "", region_dest),
           region_dest = sub("Area Outside", "Area Outside Region", region_dest),
           region_dest = factor(region_dest, levels = unique(region_dest))) %>%
    mutate(region_orig = ifelse(is.na(region_orig), "Not stated", region_orig),
           region_orig = sub(" Region", "", region_orig),
           region_orig = sub("Area Outside", "Area Outside Region", region_orig),
           region_orig = sub("Not stated", "Not Stated", region_orig),
           region_orig = factor(region_orig, levels = c(levels(region_dest), "Not Stated"))) %>%
    mutate(age = substr(age, start = 1, stop = 2),
           age = as.integer(age),
           age = ifelse(age < 90, paste(age - 5, age - 1, sep = "-"), "85+"),
           age = factor(age, levels = unique(age))) %>%
    mutate(time = paste(census_year - 4, census_year, sep = "-")) %>%
    mutate(count = as.integer(count)) %>%
    with(., tapply(count, data.frame(age, sex, region_orig, region_dest, time), sum))

## Impute suppressed values.  Values are suppressed if they are less than 6.
## The mean of the suppressed values is approximately 2.5.
set.seed(0)
prob_above_med <- 0.7
prob_below_med <- 0.1
is_missing <- is.na(new_zealand_address_census)
tmp <- new_zealand_address_census
tmp[is_missing] <- 1
mod <- loglm(count ~ age + sex + region_orig + region_dest + time,
             data = tmp,
             fitted = TRUE)
fitted_missing <- mod$fitted[is_missing]
median_fitted <- median(fitted_missing)
n_missing <- sum(is_missing)
imputed_missing <- rep(0, n_missing)
imputed_missing[(fitted_missing > median_fitted) & (runif(n_missing) < prob_above_med)] <- 3
imputed_missing[(fitted_missing < median_fitted) & (runif(n_missing) < prob_below_med)] <- 3
new_zealand_address_census[is_missing] <- imputed_missing

new_zealand_address_census <- new_zealand_address_census[ , , , , "2009-2013"] %>%
    Counts() %>%
    collapseDimension(margin = c("region_orig", "region_dest")) %>%
    subarray(region_orig != "Area Outside Region") %>%
    subarray(region_orig != "Not Stated") %>%
    subarray(region_dest != "Area Outside Region") %>%
    slab(dimension = "region_orig", elements = levels_region) %>%
    slab(dimension = "region_dest", elements = levels_region)
diag(new_zealand_address_census) <- 0L
new_zealand_address_census <- new_zealand_address_census %>%
    toInteger() %>%
    addDimension(name = "time", labels = "2009-2013") %>%
    as.array()

save(new_zealand_address_census,
     file = "data/new_zealand_address_census.rda")


