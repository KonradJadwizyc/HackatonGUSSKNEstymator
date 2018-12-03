
library(shiny)
library(lubridate)
library(leaflet)
library(readr)
library(dplyr)
#library(DT)
library(ggplot2)
library(shinythemes)
library(shinyWidgets)
library(plotly)
library(shinyjs)
library(openxlsx)
library(shiny.i18n)

My_SDG <- readRDS("My_SDG")
My_SDG <- My_SDG %>%
  mutate(Value=as.numeric(levels(Value))[Value])



#Zapisujemy pytania pobrane ze specjalnie przygotowanego pliku xlsx. Zmieniamy 2 kolumny data framu na wartości logiczne! 
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

