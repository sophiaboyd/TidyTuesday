#######################################
#### This is a line plot using baby names data ####
#### Created by: Sophia Boyd #####
#### Created on: 3/24/2022 ####
#######################################

# Load libraries
library(tidyverse)
library(here)
library(ggplot2)
library(babynames)
library(viridis)
library(dplyr)
library(beyonce)

# Load data
tuesdata <- tidytuesdayR::tt_load('2022-03-22')
tuesdata <- tidytuesdayR::tt_load(2022, week = 12)

babynames <- tuesdata$babynames

# Create new data set
names <- babynames %>% 
  filter(name %in% c("Sophia", "May", "Bella")) %>% # only includes 3 names in data set
  filter(sex == "F", # only includes female data
         year > 1996) # only includes data from 1997 and up

# Create plot
names %>% 
  ggplot(aes(x = year, y = n, group = name, color = name)) + # x axis is the year and y axis is the amount
    geom_line() + # creates a line plot 
    scale_color_manual(values = beyonce_palette(11)) + # adds color from the beyonce palette
    labs(title = "Popularity of names throughout 20 years",
         x = "Year",
         y = "Amount of female babies born", 
         color = "Names") + # changes titles
    theme(plot.title = element_text(hjust = 0.5), # changes size of plot title
        axis.text = element_text(size = 9), # changes size of text on plot
        axis.title = element_text(size = 10), # changes size of axis titles
        panel.border = element_rect(fill = NA, color = "black")) +
  theme_classic() # gets rid of background lines
ggsave(here("3-25","Output","tidytues3-25.png"))  
  
  
  
