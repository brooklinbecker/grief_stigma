#### Preamble ####
# Purpose: Simulates data for 10 participants of the primary study
# Author: Brooklin Becker
# Date: 24 April 2024
# Contact: brooklin.becker@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(knitr)
library(kableExtra)
library(dbplyr)
library(tidyr)

#### Simulate data for primary quantitative study ####

#Simulating the gender and age of 10 participants, along with their ratings of 
#Complicated Grief, Fear, Anger, and Social Aversion, for a given bereaved person

set.seed(550)

sim_data <- tibble(
  Gender = sample(c("Male", "Female"), 10, replace = TRUE),
  Age = sample(18:80, 10, replace = TRUE),
  Complicated_Grief_Rating = sample(10:30, 10, replace = TRUE),
  Fear = sample(1:5, 10, replace = TRUE),
  Anger = sample(1:5, 10, replace = TRUE),
  Social_Aversion = sample(10:20, 10, replace = TRUE)
)

print(sim_data)
