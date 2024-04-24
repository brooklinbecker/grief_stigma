#### Preamble ####
# Purpose: Downloads and saves the data for the two analyzed files from Zenodo and UK Data Service
# Author: Brooklin Becker
# Date: 24 April 2024
# Contact: brooklin.becker@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(openxlsx)

#### Download primary data ####

#Reading the primary quantitative data file from the source website
raw_grief_data <-
  read.xlsx("https://zenodo.org/records/3957822/files/Data.xlsx?download=1", sheet = 1)


#### Save primary data ####

#Writing the primary quantitative data file into a new xlsx file
write.xlsx(
  x = raw_grief_data,
  file = "new_quant_grief_data.xlsx"
)


#### Download secondary data ####

#Reading the data file from the source website
raw_grief_data2 <-
  read.xlsx("https://reshare.ukdataservice.ac.uk/856067/2/ExperiencesOfGrief_APhenomenologicalSurvey.xlsx", sheet = 2)


#### Save secondary data ####

#Writing the data file into a new xlsx file
write.xlsx(
  x = raw_grief_data2,
  file = "new_grief_data2.xlsx"
)

