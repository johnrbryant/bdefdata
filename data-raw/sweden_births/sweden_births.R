
library(methods)
library(tidyr)
library(dplyr)
library(readr)

county_names <- c(Stockholm = "Stockholm",
                  Gotaland = "V\xfc\xbe\x8d\x86\x94\xbcstra G\xfc\xbe\x8d\xa6\x98\xbctaland",
                  Skane = "Sk\xfc\xbe\x8d\x96\x94\xbcne",
                  Ostergotland = "\xfc\xbe\x8d\xa6\x90\xbcsterg\xfc\xbe\x8d\xa6\x98\xbctland",
                  Jonkoping = "J\xfc\xbe\x8d\xa6\x98\xbcnk\xfc\xbe\x8d\xa6\x98\xbcping",
                  Uppsala = "Uppsala",
                  Sodermanland = "S\xfc\xbe\x8d\xa6\x98\xbcdermanland",
                  Orebro = "\xfc\xbe\x8d\xa6\x90\xbcrebro",
                  Norrbotten = "Norrbotten",
                  Gavleborg = "G\xfc\xbe\x8d\x86\x94\xbcvleborg",
                  Dalarna = "Dalarna",                       
                  Vastmanland = "V\xfc\xbe\x8d\x86\x94\xbcstmanland",
                  Kalmar = "Kalmar",
                  Vasterbotten = "V\xfc\xbe\x8d\x86\x94\xbcsterbotten",
                  Halland = "Halland",
                  Vasternorrland = "V\xfc\xbe\x8d\x86\x94\xbcsternorrland",
                  Varmland = "V\xfc\xbe\x8d\x86\x94\xbcrmland",
                  Kronoberg = "Kronoberg",
                  Blekinge = "Blekinge",
                  Jamtland = "J\xfc\xbe\x8d\x86\x94\xbcmtland",
                  Gotland = "Gotland")


sweden_births <- read_csv("data-raw/sweden_births/BE0101E2.csv",
                          skip = 2) %>%
    rename(county = region) %>%
    gather(key = time, value = count, -county, convert = TRUE) %>%
    mutate(county = sub("^[0-9][0-9]\\s", "", county),
           county = sub(" county$", "", county),
           county = names(county_names)[match(county, county_names)],
           county = factor(county, levels = names(county_names))) %>%
    filter(time %in% 1995:2015) %>%     # to match years in book
    xtabs(count ~ county + time, data = .) %>%
    array(dim = dim(.), dimnames = dimnames(.))

save(sweden_births,
     file = "data/sweden_births.rda",
     compress = "bzip2")

