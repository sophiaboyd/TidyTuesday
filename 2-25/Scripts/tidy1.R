####################################################
#### This is my Tidy Tuesday using Freedom data ####
#### Created by: Sophia Boyd ####
#### Created on: 02-25-2022 #####
###################################################

### Load libraries ####
library(tidyverse)
library(tidytuesdayR)
library(ggplot2)

### Load data ####
tuesdata <- tidytuesdayR::tt_load('2022-02-22')
tuesdata <- tidytuesdayR::tt_load(2022, week = 8)

freedom <- tuesdata$freedom 
head(freedom)

### Creating the bar plot ####
ggplot(data = freedom, aes(x = year, y = CL)) + # x axis data is each year & y axis data is the amount of civil liberties
  geom_bar(stat = "identity", width = 0.5, color = "pink", fill = "white") + # outlines bars pink and fills them in pink 
  labs(title = "Civil Liberties Throughout the Years",
       x = "Year",
       y = "Civil Liberties") + # changes names of the title, x axis, & y axis
  theme(plot.title = element_text(hjust = 0.5), # centers title
        panel.border = element_rect(fill = NA, color = "black")) # outlines graph black
ggsave(here("2-25","Output","freedomtidytu.png"))
