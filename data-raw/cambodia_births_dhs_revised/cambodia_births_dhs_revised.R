
## The unit record DHS data used to calculate births is confidential,
## so we do include it in data-raw. Instead we include tabulations
## calculated by us, using package 'survey'.

file.copy(from = "data-raw/cambodia_births_dhs_revised/cambodia_births_dhs_revised.rda",
          to = "data/cambodia_births_dhs_revised.rda")
