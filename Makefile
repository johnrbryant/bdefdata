
.PHONY: all
all: data/twelve_population.rda \
     data/twelve_births.rda \
     data/twelve_deaths.rda \
     data/twelve_movements.rda \
     data/twelve_immigration.rda \
     data/twelve_emigration.rda \
     data/twelve_taxes.rda \
     documentation

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


.PHONY: documentation
documentation:
	Rscript -e "devtools::document()"

.PHONY: clean
clean:
	rm -rf data
	rm -rf man
	mkdir -p data
	mkdir -p man
