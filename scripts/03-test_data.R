#### Preamble ####
# Purpose: Testing the cleaned primary quantitative data set
# Author: Brooklin Becker
# Date: 24 April 2024 
# Contact: brooklin.becker@mail.utoronto.ca
# License: MIT
# Pre-requisites: need to have run 01-download_data.R and 02-data_cleaning.R

#Initialize necessary libraries
library(tidyverse)
library(knitr)
library(kableExtra)
library(ggplot2)
library(dbplyr)
library(janitor)
library(openxlsx)
library(reshape2)
library(tidyr)
library(arrow)

#Reading in the cleaned data

grief_test <- 
  read_parquet(
    file = "cleaned_grief_data.parquet")

#Test 1 - calculating the number of variables tracked for the bereaved male
#exhibiting PGD symptoms with a PGD diagnosis
#We expect the condition to be true, since 11 variables are tracked in Table 1 in the Paper
if(length(grief_test$`P-P-M`) == 11){
  print("11 variables tracked")
}

#Test 2 - comparing Social Aversion of participants towards the male and female
#bereaved individuals with an MDE diagnosis
#exhibiting PGD symptoms with a PGD diagnosis
#We expect the condition to be true, since 15.25 > 14.21 from Table 1 in the Paper
if(grief_test$`P-M-M`[11] > grief_test$`P-M-F`[11]){
  print("Participants are more socially averse to man with MDE diagnosis than woman")
}


