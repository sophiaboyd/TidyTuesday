#######################################
#### This is an animated line chart created from the solar/wind data ####
#### Created by: Sophia Boyd #####
#### Created on: 2022-05-03 ####
#######################################

### load libraries ###
library(tidyverse)
library(here)
library(ggplot2)
library(gganimate)
library(beyonce)
library(hrbrthemes)

### Load data ###
tuesdata <- tidytuesdayR::tt_load('2022-05-03')
tuesdata <- tidytuesdayR::tt_load(2022, week = 18)

capacity <- tuesdata$capacity
wind <- tuesdata$wind
solar <- tuesdata$solar
average_cost <- tuesdata$average_cost

# Create a new data set
avgcost_long <- average_cost %>% # change to a long dataset 
  pivot_longer(cols = gas_mwh:wind_mwh,
               names_to = "Variables", # creates new column titles
               values_to = "AverageCost") %>% 
  filter(year < 2021) # remove the year 2021

# Create line chart
avgcost_long %>% 
  ggplot(aes(x = year, y = AverageCost, color = Variables)) +
  geom_line() + # makes a line plot
  geom_point() + # adds the point to the line
  scale_color_manual(values = beyonce_palette(11)) + # adds color
  theme_ipsum() + # changes theme
  labs(title = "Average cost for each power source over the years",
       x = "Year",
       y = "Average Cost (dollars/MWh)",
       color = "Type of Power") + # changes titles
  transition_reveal(year) # makes the lines move throughout the years


anim_save(here("5-03","Output","solarwind-chart.gif"))





