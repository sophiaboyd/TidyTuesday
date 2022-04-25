##################################
#### This is a plot using the air pollution data ####
#### Created by: Sophia Boyd ####
#### Created on: 2022-04-25 ####
##################################

### Load Libraries ####
library(here)
library(tidyverse)
library(dplyr)
library(hrbrthemes) 
library(beyonce)

### Load Data ####
indoor_pollution <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-04-12/indoor_pollution.csv')

#### Data Set ####
pollution <- indoor_pollution %>% 
  filter(Entity %in% c("America", "Africa", "England")) %>% 
  rename(Deaths = 4) # renames the long column name

### Plot ####
ggplot(pollution, aes(x = Year, y = Deaths, group = Entity, color = Entity)) +
  geom_line() + # creates a line graph
  geom_point() + # adds points onto lines
  xlab("") +
  theme_ipsum() +
  scale_color_manual(values = beyonce_palette(11)) + # adds color to the lines
  labs(title = "Deaths Rates from Air Pollution",
       x = "Year",
       y = "Deaths by percentage") # renames the titles
  
ggsave(here("4-25","Output","airpollution.png"))



