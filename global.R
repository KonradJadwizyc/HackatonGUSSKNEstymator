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

My_SDG <- My_SDG

My_SDG$Value <- as.numeric((My_SDG$Value))

pyt <- read.xlsx(xlsxFile = "Pytania.xlsx", 
                 colNames = TRUE) %>%
  mutate(praw=as.logical(praw))

# save(pyt, file="pytania.RData")


