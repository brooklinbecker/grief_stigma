#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Brooklin Becker 
# Date: 3 April 2024 [...UPDATE THIS...]
# Contact: brooklin.becker@mail.utoronto.ca 
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(openxlsx)

#### Download data ####
raw_grief_data <-
  read.xlsx("https://zenodo.org/records/3957822/files/Data.xlsx?download=1", sheet = 1)



#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_grief_data, "data/raw_data/raw_data.csv") 


