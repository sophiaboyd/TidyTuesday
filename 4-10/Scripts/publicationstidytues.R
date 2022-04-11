##################################
#### This is a plot using digital publications data ####
#### Created by: Sophia Boyd ####
#### Created on: 2022-04-10 ####
##################################

### Load Libraries 
library(tidyverse)
library(here)
library(ggplot2)
library(dplyr)
library(LaCroixColoR)
library(devtools)

### Load Data
tuesdata <- tidytuesdayR::tt_load('2022-04-05')
tuesdata <- tidytuesdayR::tt_load(2022, week = 14)

news_orgs <- tuesdata$news_orgs

### New Data Set
news <- news_orgs %>% 
  drop_na("budget_percent_revenue_generation",
          "state") %>% 
  filter(year_founded %in% c(2018))

### Make a graph
ggplot(news, aes(x = publication_name, y = budget_percent_revenue_generation, fill = publication_name))+
  geom_bar(stat = "identity")+
  coord_flip()+
  scale_fill_manual(values = lacroix_palette("PassionFruit", n=50, type = "continuous"))+ # adds color to bars
  theme(legend.position = "none", # deletes the legend
        panel.grid.major = element_blank(), # deletes major grid lines
        panel.grid.minor = element_blank())+ #deletes minor grid lines
  labs(title = "Budget Percent Revenue for Publications made in 2018", # changes titles
       x = "Publication", # changes x axis title
       y = "Budget Percent Revenue") # changes y axis title

ggsave(here("4-10","Output","publications.png"))


