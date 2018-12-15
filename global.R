library(shiny)
library(lubridate)
library(leaflet)
library(readr)
library(dplyr)
library(ggplot2)
library(shinythemes)
library(shinyWidgets)
library(plotly)
library(shinyjs)
library(openxlsx)
library(scales)

# My_SDG <- read.csv("SDG.csv", sep = ",", dec=".")
# My_SDG <- My_SDG %>%
#   mutate(Value=as.numeric(levels(Value))[Value])
# saveRDS(My_SDG, file = "My_SDG.rds")

#load datadase
My_SDG <- readRDS("My_SDG.rds")

# My_SDG %>%
# filter(Indicator=="1.1.1", GeoAreaName == "Poland")


#Save questions that were downloaded from xlsx file. Changed 2 columns of data frame to logical value! 
pyt <- read.xlsx(xlsxFile = "Pytania.xlsx",
                 colNames = TRUE) %>%
  mutate(praw=as.logical(praw)) %>%
  mutate(plot_img=as.logical(plot_img))




# save(pyt, file="pytania.RData")
summary(My_SDG)
My_SDG <- My_SDG %>% filter(Value != "", !is.na(Value),
                     GeoAreaName != "", !is.na(GeoAreaName))
summary(My_SDG)

#11284 to są NA


