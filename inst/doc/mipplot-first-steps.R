## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE, warning=FALSE--------------------------------------------
library(mipplot)
library(tidyverse)

## -----------------------------------------------------------------------------
sr15_sample_data

## ---- eval=FALSE--------------------------------------------------------------
#  iamc_data <- mipplot_read_iamc("path_to_data.csv")

## -----------------------------------------------------------------------------
sr15_sample_data$model %>% levels

## -----------------------------------------------------------------------------
sr15_sample_data$scenario %>% levels

## -----------------------------------------------------------------------------
sr15_sample_data$region %>% levels

## -----------------------------------------------------------------------------
sr15_sample_data %>% select(variable, unit) %>% distinct

## -----------------------------------------------------------------------------
sr15_sample_data %>% 
  filter(str_detect(scenario, "^SSP2")) %>%
  select(model, scenario) %>% distinct

## -----------------------------------------------------------------------------
sr15_sample_data %>% 
  filter(str_detect(variable, "^Secondary Energy\\|Electricity\\|")) %>% 
  select(variable) %>%
  distinct

## ---- eval=FALSE--------------------------------------------------------------
#  mipplot_interactive_line(sr15_sample_data)

## ---- echo=FALSE, out.width="100%"--------------------------------------------
knitr::include_graphics("screenshot_mipplot_interactive_line.png")

## ---- fig.width=10, fig.height=7, out.width="100%"----------------------------
data_subset <- sr15_sample_data %>%
  filter( model %in% c("AIM/CGE 2.0", "GCAM 4.2", "IMAGE 3.0.1") ) %>%
  filter(2000 <= period) %>%
  filter(period <= 2100)

mipplot_line(
  data_subset,
  variable = c("Emissions|CO2"),
  scenario = c("SSP3-34", "SSP3-45", "SSP3-60", "SSP3-Baseline"),
  region = c("World"),
  legend = TRUE,
  language = 'en')[[1]]


## ---- eval=FALSE--------------------------------------------------------------
#  mipplot_interactive_bar(sr15_sample_data, ar5_db_sample_rule_table)

## ---- echo=FALSE, out.width="100%"--------------------------------------------
knitr::include_graphics("screenshot_mipplot_interactive_bar.png")

## ---- fig.width=10, fig.height=7, out.width="100%"----------------------------
data_subset <- sr15_sample_data %>%
  filter(variable %in% c("Primary Energy", "Primary Energy|Coal", "Primary Energy|Gas", "Primary Energy|Oil", "Primary Energy|Nuclear", "Primary Energy|Hydro", "Primary Energy|Biomass", "Primary Energy|Solar", "Primary Energy|Wind", "Primary Energy|Geothermal", "Primary Energy|Ocean")) %>%
  filter(model %in% c("AIM/CGE 2.0", "GCAM 4.2", "IMAGE 3.0.1")) %>%
  filter(scenario %in% c("SSP3-34", "SSP3-45", "SSP3-60", "SSP3-Baseline"))

mipplot_bar(data_subset, ar5_db_sample_rule_table,
  region = c("World"),
  target_year = 2050,
  one_hundred_percent_stacked = FALSE,
  language = 'en')[[1]]


## ---- eval=FALSE--------------------------------------------------------------
#  mipplot_interactive_area(sr15_sample_data, ar5_db_sample_rule_table)

## ---- echo=FALSE, out.width="100%"--------------------------------------------
knitr::include_graphics("screenshot_mipplot_interactive_area.png")

## ---- fig.width=10, fig.height=7, out.width="100%"----------------------------
data_subset <- sr15_sample_data %>%
  filter(variable %in% c("Secondary Energy|Electricity", "Secondary Energy|Electricity|Coal", "Secondary Energy|Electricity|Gas", "Secondary Energy|Electricity|Oil", "Secondary Energy|Electricity|Nuclear", "Secondary Energy|Electricity|Hydro", "Secondary Energy|Electricity|Biomass", "Secondary Energy|Electricity|Solar", "Secondary Energy|Electricity|Wind", "Secondary Energy|Electricity|Geothermal", "Secondary Energy|Electricity|Ocean")) %>%
  filter(model %in% c("AIM/CGE 2.0", "GCAM 4.2", "IMAGE 3.0.1")) %>%
  filter(2000 <= period) %>%
  filter(period <= 2100)

mipplot_area(data_subset, ar5_db_sample_rule_table,
  region = c("World"),
  scenario = c("SSP3-Baseline"),
  one_hundred_percent_stacked = FALSE,
  language = 'en')[[1]]

## ---- warning=FALSE, fig.width=10, fig.height=7, out.width="100%", eval=FALSE----
#  data_subset <- sr15_sample_data %>%
#    filter(variable %in% c("Secondary Energy|Electricity", "Secondary Energy|Electricity|Coal", "Secondary Energy|Electricity|Gas", "Secondary Energy|Electricity|Oil", "Secondary Energy|Electricity|Nuclear", "Secondary Energy|Electricity|Hydro", "Secondary Energy|Electricity|Biomass", "Secondary Energy|Electricity|Solar", "Secondary Energy|Electricity|Wind", "Secondary Energy|Electricity|Geothermal", "Secondary Energy|Electricity|Ocean")) %>%
#    filter(model %in% c("AIM/CGE 2.0", "GCAM 4.2", "IMAGE 3.0.1")) %>%
#    filter(2000 <= period) %>%
#    filter(period <= 2100)
#  
#  mipplot_area(data_subset, ar5_db_sample_rule_table,
#    region = c("World"),
#    scenario = c("SSP3-Baseline"),
#    one_hundred_percent_stacked = FALSE,
#    language = 'jp')[[1]]  # <--------------- We changed here

## ---- eval=FALSE, fig.width=10------------------------------------------------
#  data_subset <- sr15_sample_data %>%
#    filter(variable %in% c("Secondary Energy|Electricity", "Secondary Energy|Electricity|Coal", "Secondary Energy|Electricity|Gas", "Secondary Energy|Electricity|Oil", "Secondary Energy|Electricity|Nuclear", "Secondary Energy|Electricity|Hydro", "Secondary Energy|Electricity|Biomass", "Secondary Energy|Electricity|Solar", "Secondary Energy|Electricity|Wind", "Secondary Energy|Electricity|Geothermal", "Secondary Energy|Electricity|Ocean")) %>%
#    filter(model %in% c("AIM/CGE 2.0", "GCAM 4.2", "IMAGE 3.0.1")) %>%
#    filter(2000 <= period) %>%
#    filter(period <= 2100)
#  
#  # Save plot to `graph` variable
#  graph <- mipplot_area(data_subset, ar5_db_sample_rule_table,
#    region = c("World"),
#    scenario = c("SSP3-Baseline"),
#    one_hundred_percent_stacked = FALSE,
#    language = 'zh-cn')[[1]]
#  
#  # Give `graph` to `mipplot_print_pdf`
#  # mipplot_print_pdf(graph)
#  

