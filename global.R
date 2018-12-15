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
library(shiny.i18n)
library(scales)

My_SDG <- readRDS("My_SDG")
My_SDG <- My_SDG %>%
  mutate(Value=as.numeric(levels(Value))[Value])



#Zapisujemy pytania pobrane ze specjalnie przygotowanego pliku xlsx. Zmieniamy 2 kolumny data framu na wartości logiczne! 
pyt <- read.xlsx(xlsxFile = "Pytania.xlsx",
                 colNames = TRUE) %>%
  mutate(praw=as.logical(praw)) %>%
  mutate(plot_img=as.logical(plot_img))

#Liczba pytan, ktora chcemy miec w tescie (ustawiane w zaleznosci o wielkosci bazy)
question_quantity <- 2

#Filtrowanie po poziomie trudnosci i przypisanie do zmiennej pytania latwe
ques_easy <<- pyt %>%
              filter(poz_trud == 1) 

#Usuniecie duplikatow i wybranie ustalonej liczby (nadanej w zmiennej question_quantity) nr ze wczesniej wyfiltrowanego zbioru.
ques_easy <- ques_easy[!duplicated(ques_easy$nr),] %>%
  sample_n(question_quantity) %>%
  select(nr) 

#Filtrowanie po poziomie trudnosci i przypisanie do zmiennej pytania srednie
ques_med <<- pyt %>%
             filter(poz_trud == 2) 

#Usuniecie duplikatow i wybranie ustalonej liczby (nadanej w zmiennej question_quantity) nr ze wczesniej wyfiltrowanego zbioru.
ques_med <- ques_med[!duplicated(ques_med$nr),] %>%
            sample_n(question_quantity) %>%
            select(nr) 

#Filtrowanie po poziomie trudnosci i przypisanie do zmiennej pytania trudne
ques_hard <<- pyt %>%
              filter(poz_trud == 3)

#Usuniecie duplikatow i wybranie ustalonej liczby (nadanej w zmiennej question_quantity) nr ze wczesniej wyfiltrowanego zbioru.
ques_hard <- ques_hard[!duplicated(ques_hard$nr),] %>%
  sample_n(question_quantity) %>%
  select(nr) 

#Zlaczenie wczesniej wyfiltrowanych numerow w jeden wektor
Numbers_of_questions <<- c(ques_easy, ques_med, ques_hard) %>%
                        unlist()

#Filtorwanie pytan i umieszczenie ich w osobnym data frame
pyt_selected <- pyt %>%
                filter(nr %in% Numbers_of_questions)

# save(pyt, file="pytania.RData")

i18n <- Translator$new(translation_csvs_path = "data")
i18n$set_translation_language("pl")

