
library(methods)
library(tidyr)
library(dplyr)
library(readr)

county_names <- c(Stockholm = "Stockholm",
                  Uppsala = "Uppsala",
                  Sodermanland = "S\xfc\xbe\x8d\xa6\x98\xbcdermanland",
                  Ostergotland = "\xfc\xbe\x8d\xa6\x90\xbcsterg\xfc\xbe\x8d\xa6\x98\xbctland",
                  Jonkoping = "J\xfc\xbe\x8d\xa6\x98\xbcnk\xfc\xbe\x8d\xa6\x98\xbcping",
                  Kronoberg = "Kronoberg",
                  Kalmar = "Kalmar",
                  Gotland = "Gotland",
                  Blekinge = "Blekinge",
                  Skane = "Sk\xfc\xbe\x8d\x96\x94\xbcne",
                  Halland = "Halland",
                  Gotaland = "V\xfc\xbe\x8d\x86\x94\xbcstra G\xfc\xbe\x8d\xa6\x98\xbctaland",
                  Varmland = "V\xfc\xbe\x8d\x86\x94\xbcrmland",
                  Orebro = "\xfc\xbe\x8d\xa6\x90\xbcrebro",               
                  Vastmanland = "V\xfc\xbe\x8d\x86\x94\xbcstmanland",
                  Dalarna = "Dalarna",                       
                  Gavleborg = "G\xfc\xbe\x8d\x86\x94\xbcvleborg",
                  Vasternorrland = "V\xfc\xbe\x8d\x86\x94\xbcsternorrland",
                  Jamtland = "J\xfc\xbe\x8d\x86\x94\xbcmtland",
                  Vasterbotten = "V\xfc\xbe\x8d\x86\x94\xbcsterbotten",
                  Norrbotten = "Norrbotten")

sweden_deaths <- read_csv("data-raw/sweden_deaths/BE0101D9.csv",
                          skip = 2) %>%
    select(-age) %>%
    rename(county = region) %>%
    gather(key = time, value = count, -county, convert = TRUE) %>%
    mutate(county = sub("^[0-9][0-9]\\s", "", county),
           county = sub(" county$", "", county),
           county = names(county_names)[match(county, county_names)]) %>%
    filter(time %in% 1995:2015) %>%     # to match years in book
    xtabs(count ~ county + time, data = .) %>%
    array(dim = dim(.), dimnames = dimnames(.))

save(sweden_deaths,
     file = "data/sweden_deaths.rda",
     compress = "bzip2")
