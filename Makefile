
.PHONY: all
all: data/maori_deaths.rda \
     data/maori_popn.rda \
     data/portugal_deaths.rda \
     data/portugal_exposure.rda \
     data/sweden_births.rda \
     data/sweden_deaths.rda \
     data/twelve_population.rda \
     data/twelve_births.rda \
     data/twelve_deaths.rda \
     data/twelve_movements.rda \
     data/twelve_immigration.rda \
     data/twelve_emigration.rda \
     data/twelve_taxes.rda \
     documentation


## Maori Deaths and Population

data/maori_deaths.rda : data-raw/maori_deaths/maori_deaths.R \
                        data-raw/maori_deaths/VSD349301_20180630_115444_58.csv
	Rscript $<

data/maori_popn.rda : data-raw/maori_popn/maori_popn.R \
                      data-raw/maori_popn/6a04af0d-c193-49d4-9ace-81d90f32211b.xlsx
	Rscript $<


## Portugal Deaths and Exposure

data/portugal_deaths.rda : data-raw/portugal_deaths/portugal_deaths.R \
                           data-raw/portugal_deaths/Deaths_1x1.txt
	Rscript $<

data/portugal_exposure.rda : data-raw/portugal_exposure/portugal_exposure.R \
                             data-raw/portugal_exposure/Exposures_1x1.txt
	Rscript $<


## Swedish Birth and Deaths

data/sweden_births.rda : data-raw/sweden_births/sweden_births.R \
                         data-raw/sweden_births/BE0101E2.csv
	Rscript $<

data/sweden_deaths.rda : data-raw/sweden_deaths/sweden_deaths.R \
                         data-raw/sweden_deaths/BE0101D9.csv
	Rscript $<


## Twelve Individuals

data/twelve_population.rda : data-raw/twelve_population/twelve_population.R \
                             data-raw/twelve_population/twelve_population.csv
	Rscript $<

data/twelve_births.rda : data-raw/twelve_births/twelve_births.R \
                         data-raw/twelve_births/twelve_births.csv
	Rscript $<

data/twelve_deaths.rda : data-raw/twelve_deaths/twelve_deaths.R \
                         data-raw/twelve_deaths/twelve_deaths.csv
	Rscript $<

data/twelve_movements.rda : data-raw/twelve_movements/twelve_movements.R \
                            data-raw/twelve_movements/twelve_movements.csv
	Rscript $<

data/twelve_immigration.rda : data-raw/twelve_immigration/twelve_immigration.R \
                              data-raw/twelve_immigration/twelve_immigration.csv
	Rscript $<

data/twelve_emigration.rda : data-raw/twelve_emigration/twelve_emigration.R \
                             data-raw/twelve_emigration/twelve_emigration.csv
	Rscript $<

data/twelve_taxes.rda : data-raw/twelve_taxes/twelve_taxes.R \
                        data-raw/twelve_taxes/twelve_taxes.csv
	Rscript $<


## Documentation

.PHONY: documentation
documentation:
	Rscript -e "devtools::document()"

.PHONY: clean
clean:
	rm -rf data
	rm -rf man
	mkdir -p data
	mkdir -p man
