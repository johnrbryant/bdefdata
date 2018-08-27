
.PHONY: all
all: data/cambodia_births_census.rda \
     data/cambodia_births_dhs.rda \
     data/cambodia_births_dhs_revised.rda \
     data/cambodia_population.rda \
     data/cambodia_poverty.rda \
     data/iceland_migration.rda \
     data/iceland_population.rda \
     data/maori_deaths.rda \
     data/maori_population.rda \
     data/netherlands_cpi.rda \
     data/netherlands_health.rda \
     data/netherlands_exposure.rda \
     data/new_zealand_address_admin.rda \
     data/new_zealand_address_census.rda \
     data/new_zealand_arrivals.rda \
     data/new_zealand_births_reg.rda \
     data/new_zealand_deaths_reg.rda \
     data/new_zealand_departures.rda \
     data/new_zealand_popn_admin.rda \
     data/new_zealand_popn_census.rda \
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



## Cambodia Births, Population, and Poverty

data/cambodia_births_census.rda : data-raw/cambodia_births_census/cambodia_births_census.R \
                                  data-raw/cambodia_births_census/reporte-1.xls \
                                  data-raw/cambodia_births_census/reporte-2.xls \
                                  data-raw/cambodia_births_census/reporte-3.xls \
                                  data-raw/cambodia_births_census/reporte-4.xls \
                                  data-raw/cambodia_births_census/reporte-5.xls \
                                  data-raw/cambodia_births_census/reporte-6.xls \
                                  data-raw/cambodia_births_census/reporte-7.xls \
                                  data-raw/cambodia_births_census/reporte-8.xls \
                                  data-raw/cambodia_births_census/reporte-9.xls \
                                  data-raw/cambodia_births_census/reporte-10.xls \
                                  data-raw/cambodia_births_census/reporte-11.xls \
                                  data-raw/cambodia_births_census/reporte-12.xls \
                                  data-raw/cambodia_births_census/reporte-13.xls \
                                  data-raw/cambodia_births_census/reporte-14.xls \
                                  data-raw/cambodia_births_census/reporte-15.xls \
                                  data-raw/cambodia_births_census/reporte-16.xls \
                                  data-raw/cambodia_births_census/reporte-17.xls \
                                  data-raw/cambodia_births_census/reporte-18.xls \
                                  data-raw/cambodia_births_census/reporte-19.xls \
                                  data-raw/cambodia_births_census/reporte-20.xls \
                                  data-raw/cambodia_births_census/reporte-21.xls \
                                  data-raw/cambodia_births_census/reporte-22.xls \
                                  data-raw/cambodia_births_census/reporte-23.xls \
                                  data-raw/cambodia_births_census/reporte-24.xls \
                                  data-raw/cambodia_births_census/reporte-25.xls \
                                  data-raw/cambodia_births_census/reporte-26.xls \
                                  data-raw/cambodia_births_census/reporte-27.xls \
                                  data-raw/cambodia_births_census/reporte-28.xls \
                                  data-raw/cambodia_births_census/reporte-29.xls \
                                  data-raw/cambodia_births_census/reporte-30.xls \
                                  data-raw/cambodia_births_census/reporte-31.xls \
                                  data-raw/cambodia_births_census/reporte-32.xls \
                                  data-raw/cambodia_births_census/reporte-33.xls \
                                  data-raw/cambodia_births_census/reporte-34.xls \
                                  data-raw/cambodia_births_census/reporte-35.xls \
                                  data-raw/cambodia_births_census/reporte-36.xls \
                                  data-raw/cambodia_births_census/reporte-37.xls \
                                  data-raw/cambodia_births_census/reporte-38.xls \
                                  data-raw/cambodia_births_census/reporte-39.xls \
                                  data-raw/cambodia_births_census/reporte-40.xls \
                                  data-raw/cambodia_births_census/reporte-41.xls \
                                  data-raw/cambodia_births_census/reporte-42.xls \
                                  data-raw/cambodia_births_census/reporte-43.xls \
                                  data-raw/cambodia_births_census/reporte-44.xls \
                                  data-raw/cambodia_births_census/reporte-45.xls \
                                  data-raw/cambodia_births_census/reporte-46.xls \
                                  data-raw/cambodia_births_census/reporte-47.xls \
                                  data-raw/cambodia_births_census/reporte-48.xls
	Rscript $<

data/cambodia_births_dhs.rda : data-raw/cambodia_births_dhs/cambodia_births_dhs.R \
                               data-raw/cambodia_births_dhs/cambodia_births_dhs.rda
	Rscript $<

data/cambodia_births_dhs_revised.rda : data-raw/cambodia_births_dhs_revised/cambodia_births_dhs_revised.R \
                                       data-raw/cambodia_births_dhs_revised/cambodia_births_dhs_revised.rda
	Rscript $<

data/cambodia_population.rda : data-raw/cambodia_population/cambodia_population.R \
                               data-raw/cambodia_population/rural.csv \
                               data-raw/cambodia_population/urban.csv
	Rscript $<

data/cambodia_poverty.rda : data-raw/cambodia_poverty/cambodia_poverty.R \
                            data-raw/cambodia_poverty/undp_poverty.csv
	Rscript $<


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
                              data-raw/netherlands_health/EBDAG_23112017231455293.csv
	Rscript $<

data/netherlands_exposure.rda : data-raw/netherlands_exposure/netherlands_exposure.R \
                                data-raw/netherlands_exposure/demo_pjan_1_Data.csv \
                                data-raw/netherlands_exposure/proj_15npms_1_Data.csv
	Rscript $<


## New Zealand Population, Births, Deaths, and Migration

data/new_zealand_address_admin.rda : data-raw/new_zealand_address_admin/new_zealand_address_admin.R \
                                     data-raw/new_zealand_address_admin/rc_movements_07_17_v2.csv
	Rscript $<

data/new_zealand_address_census.rda : data-raw/new_zealand_address_census/new_zealand_address_census.R \
                                      data-raw/new_zealand_address_census/migr_transitions_rc13_9613_rr3.csv
	Rscript $<

data/new_zealand_arrivals.rda : data-raw/new_zealand_arrivals/new_zealand_arrivals.R \
                                data-raw/new_zealand_arrivals/rc13_pltmig_9716.zip
	Rscript $<

data/new_zealand_births_reg.rda : data-raw/new_zealand_births_reg/new_zealand_births_reg.R \
                                  data-raw/new_zealand_births_reg/rc13_bths9716_rr3.csv
	Rscript $<

data/new_zealand_deaths_reg.rda : data-raw/new_zealand_deaths_reg/new_zealand_deaths_reg.R \
                                  data-raw/new_zealand_deaths_reg/rc13_dths9716_rr3.csv
	Rscript $<

data/new_zealand_departures.rda : data-raw/new_zealand_departures/new_zealand_departures.R \
                                  data-raw/new_zealand_departures/rc13_pltmig_9716.zip
	Rscript $<

data/new_zealand_popn_admin.rda : data-raw/new_zealand_popn_admin/new_zealand_popn_admin.R \
                                  data-raw/new_zealand_popn_admin/exp-pop-estimates-2007-16-csv.csv
	Rscript $<

data/new_zealand_popn_census.rda : data-raw/new_zealand_popn_census/new_zealand_popn_census.R \
                                   data-raw/new_zealand_popn_census/rc13_pop9616_rnd.csv
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
