##################################
#### This is a plot using collegiate sports data ####
#### Created by: Sophia Boyd ####
#### Created on: 2022-04-01 ####
##################################

### Load Libraries
library(tidyverse)
library(here)
library(ggplot2)
library(dplyr)
library(beyonce)

### Load Data
tuesdata <- tidytuesdayR::tt_load('2022-03-29')
tuesdata <- tidytuesdayR::tt_load(2022, week = 13)

sports <- tuesdata$sports

### Create New Data Set
casports <- sports %>% 
  filter(state_cd %in% c("CA"), #filters only CA data
         city_txt %in% c("Northridge"), #filters only data from Northridge
         sports %in% c("Baseball")) #filters data only from Baseball

### Compute position of labels
casports <- casports %>% 
  arrange(desc(year)) %>% 
  mutate(prop = total_rev_menwomen / sum(casports$total_rev_menwomen) *100) %>% 
  mutate(ypos = cumsum(prop) - 0.5*prop)



### Create pie chart
ggplot(casports, aes(x="", y=prop, fill=year))+
  geom_bar(stat="identity", width=1, color="white")+ 
  coord_polar("y", start=0)+ #creates the pie chart
  theme_void()+ #removes background and grid lines
  theme(legend.position="none")+ # deletes the legend
  geom_text(aes(y=ypos, label=year), color="white", size=4)+ #makes text white and changes the size
  labs(title = "Comparison of revenue earned for baseball at CSUN") #changes title
ggsave(here("4-01","Output","tidytues4-01.png")) 
  
  
  




