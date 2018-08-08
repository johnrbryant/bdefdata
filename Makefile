
.PHONY: all
all: data/iceland_migration.rda \
     data/iceland_population.rda \
     data/maori_deaths.rda \
     data/maori_population.rda \
     data/netherlands_cpi.rda \
     data/netherlands_health.rda \
     data/netherlands_exposure.rda \
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



## Iceland Migration and Population

data/iceland_migration.rda : data-raw/iceland_migration/iceland_migration.R \
                             data-raw/iceland_migration/MAN01001.csv \
                             data-raw/iceland_migration/MAN01001-2.csv \

	Rscript $<

data/iceland_population.rda : data-raw/iceland_population/iceland_population.R \
                              data-raw/iceland_population/MAN02005.csv
	Rscript $<


## Maori Deaths and Population

data/maori_deaths.rda : data-raw/maori_deaths/maori_deaths.R \
                        data-raw/maori_deaths/VSD349301_20180630_115444_58.csv
	Rscript $<

data/maori_population.rda : data-raw/maori_population/maori_population.R \
                            data-raw/maori_population/6a04af0d-c193-49d4-9ace-81d90f32211b.xlsx
	Rscript $<


## Netherlands CPI, Health, and Population

data/netherlands_cpi.rda : data-raw/netherlands_cpi/netherlands_cpi.R \
                           data-raw/netherlands_cpi/KEI_04062016052113516.csv
	Rscript $<

data/netherlands_health.rda : data-raw/netherlands_health/netherlands_health.R \
                              data-raw/netherlands_health/EBDAG_24052016055802288.csv
	Rscript $<

data/netherlands_exposure.rda : data-raw/netherlands_exposure/netherlands_exposure.R \
                                data-raw/netherlands_exposure/POP_PROJ_04062016225548685.csv
	Rscript $<


## Portugal Deaths and Exposure

data/portugal_deaths.rda : data-raw/portugal_deaths/portugal_deaths.R \
                           data-raw/portugal_deaths/Deaths_1x1.txt
	Rscript $<

data/portugal_exposure.rda : data-raw/portugal_exposure/portugal_exposure.R \
                             data-raw/portugal_exposure/PRT.Exposures_1x1.txt
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
