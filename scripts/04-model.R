#### Preamble ####
# Purpose: Modelling the relationship between Anger and Social Aversion using linear regression
# Author: Brooklin Becker
# Date: 24 April 2024 
# Contact: brooklin.becker@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
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

### Model data ####
# Define the data for Anger and Social Aversion, which is taken from Table 6 in the paper
anger_social_aversion <- data.frame(
  Anger = c(1.31, 1.37, 1.30, 1.34, 1.32, 1.40, 1.20, 1.22),
  Social_Aversion = c(15.25, 14.21, 14.62, 14.10, 14.58, 14.15, 10.93, 9.68)
)

# Perform linear regression
lm_model <- lm(Social_Aversion ~ Anger, data = anger_social_aversion)

# Plotting the data points and line of best fit
ggplot(data = anger_social_aversion, aes(x = Anger, y = Social_Aversion)) +
  geom_point() +
  labs(title = "Linear Relationship Between Anger and Social Aversion",
       x = "Anger",
       y = "Social Aversion") +
  # Add the line of best fit
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  # Add the equation for the line of best fit
  geom_text(aes(x = max(anger_social_aversion$Anger), y = max(anger_social_aversion$Social_Aversion),
                label = paste("y =", round(lm_model$coefficients[2], 2), "x", round(lm_model$coefficients[1], 2))),
            color = "black", vjust = 1.5, hjust = 1)

#### Save model ####
saveRDS(
  anger_social_aversion,
  file = "outputs/models/first_model.rds"
)


