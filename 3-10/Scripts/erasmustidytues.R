####################################
#### This is my plot using Erasmus student mobility ####
#### Created by: Sophia Boyd ####
#### Created on: 3/10/2022 ####
####################################


# Load Libraries
library(tidyverse)
library(here)
library(ggridges)
library(viridis)
library(hrbrthemes)
library(dplyr)
library(beyonce)

# Load data
tuesdata <- tidytuesdayR::tt_load('2022-03-08')
tuesdata <- tidytuesdayR::tt_load(2022, week = 10)
erasmus <- tuesdata$erasmus

# Create new table pf data
newerasmus <- erasmus %>% 
  drop_na() %>% 
  select(participant_gender, participant_age, sending_city, participants) %>% 
  filter(participant_age < 30,
         sending_city %in% c("Wien","Graz"),
         participant_gender == "Female" | participant_gender == "Male")
View(newerasmus)

# Create a plot
newerasmus %>% 
  ggplot(aes(x=participant_gender, y=participant_age, fill=participant_gender)) +
  geom_violin() +
  facet_wrap(~sending_city, scales = "free") +
  scale_fill_manual(values = beyonce_palette(2)) + #fills in graph with color
  labs(title = "Ages of participants younger than 30 in Graz and Wien",
       x ="Gender",
       y = "Age",
       fill = "Gender") + #changes title
  theme(plot.title = element_text(hjust = 0.5), #changes size of plot title
        axis.text = element_text(size = 9.5), #changes size of text on grqph
        axis.title = element_text(size = 12), #changes size of axis titles
        panel.border = element_rect(fill = NA, color = "black")) + #outlines a black border
  scale_fill_manual(values = beyonce_palette(2)) # adds color 
  