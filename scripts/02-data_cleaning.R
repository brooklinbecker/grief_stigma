#### Preamble ####
# Purpose: Cleans the raw data of the primary quantitative data set
# Author: Brooklin Becker
# Date: 24 April 2024
# Contact: brooklin.becker@mail.utoronto.ca
# License: MIT
# Pre-requisites: need to have run 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(knitr)
library(kableExtra)
library(janitor)
library(openxlsx)
library(reshape2)
library(tidyr)
library(arrow)

#### Load Data ####
#Reading the primary quantitative data file from the source website
raw_grief_data <-
  read.xlsx("inputs/data/new_quant_grief_data.xlsx", sheet = 1)

#### Clean primary quantitative data ####

#Creating new dataframe for cleaning
cleaned_grief_data <- raw_grief_data

#Selecting only certain rows under the variable column
selected_variables <- c("patricipants_number", "age_mean", "icg_mean", 
                        "competent_mean", "warm_mean", "dependent_mean", 
                        "emotionally_stable_mean", "fear_mean", "anger_mean", 
                        "prosocial_mean", "social_distance_mean")

cleaned_grief_data <- cleaned_grief_data[cleaned_grief_data$variable %in% selected_variables, ]

#New variable names
new_var_names <- c("Participants", "Mean Age", "Complicated Grief Rating", "Competency", 
                   "Warmness", "Dependency", "Emotional Stability", "Fear", "Anger", 
                   "Prosociality", "Social Aversion")

old_var_names <- selected_variables

# Change the name of the variables in the dataframe
cleaned_grief_data <- cleaned_grief_data %>%
  mutate(variable = ifelse(variable %in% old_var_names, new_var_names, variable))

#Renaming the columns to shorten column names
cleaned_grief_data <-
  cleaned_grief_data |>
  rename(
    Variable = variable,
    "P-P-M" = s_pgd_d_pgd_m,
    "P-P-F" = s_pgd_d_pgd_f,
    "P-M-M" = s_pgd_d_mde_m,
    "P-M-F" = s_pgd_d_mde_f,
    "P-0-M" = s_pgd_d_000_m,
    "P-0-F" = s_pgd_d_000_f,
    "0-0-M" = s_000_d_000_m,
    "0-0-F" = s_000_d_000_f
  )

#Writing parquet file for cleaned data
write_parquet(cleaned_grief_data, "cleaned_grief_data.parquet")

