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
My_SDG <- My_SDG %>%
  mutate_at(.vars = vars(X.Age.,
                         X.Bounds.,
                         X.Cities.,
                         X.Education.level.,
                         X.Freq.,
                         X.Hazard.type.,
                         X.IHR.Capacity.,
                         X.Level.Status.,
                         X.Location.,
                         X.Migratory.status.,
                         X.Mode.of.transportation.,
                         X.Name.of.international.institution.,
                         X.Name.of.non.communicable.disease.,
                         X.Sex.,
                         X.Tariff.regime..status..,
                         X.Type.of.mobile.technology.,
                         X.Type.of.occupation.,
                         X.Type.of.product.,
                         X.Type.of.skill.,
                         X.Type.of.speed.), .funs = as.character)
# użycie funkcji gather w celu stworzenia jednej kolumny ze zmiennymi grupującymi 
BD <- tidyr::gather(My_SDG, key, group_value, X.Age., X.Bounds., X.Cities., X.Education.level., X.Freq., X.Hazard.type.,
                    X.IHR.Capacity.,
                    X.Level.Status.,
                    X.Location.,
                    X.Migratory.status.,
                    X.Mode.of.transportation.,
                    X.Name.of.international.institution.,
                    X.Name.of.non.communicable.disease.,
                    X.Sex.,
                    X.Tariff.regime..status..,
                    X.Type.of.mobile.technology.,
                    X.Type.of.occupation.,
                    X.Type.of.product.,
                    X.Type.of.skill.,
                    X.Type.of.speed.)
# selekcja wartości na te które są potrzebne do tworzenia wykresów 
BD_2 <- BD %>% select(Goal,SeriesDescription,GeoAreaName,TimePeriod,Value,key,group_value)
# zmiana wartości zmiennej Value na numeryczną 
as.numeric(BD_2$Value)

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
ques_easy <- ques_easy[!duplicated(ques_easy$nr),] 
#Replace to ochrona przed wsadzeniem zbyt wysokiej wartosci w question_quantity (wyzszej niz ilosc pytan w bazie danych)
ques_easy <- sample_n(ques_easy, question_quantity, if(length(ques_easy$nr) < question_quantity) {replace = T} else {replace = F}) %>%
             select(nr) 


#Filtrowanie po poziomie trudnosci i przypisanie do zmiennej pytania srednie
ques_med <<- pyt %>%
             filter(poz_trud == 2) 

#Usuniecie duplikatow i wybranie ustalonej liczby (nadanej w zmiennej question_quantity) nr ze wczesniej wyfiltrowanego zbioru.
ques_med <- ques_med[!duplicated(ques_med$nr),] 
#Replace to ochrona przed wsadzeniem zbyt wysokiej wartosci w question_quantity (wyzszej niz ilosc pytan w bazie danych)
ques_med <- sample_n(ques_med, question_quantity, if(length(ques_med$nr) < question_quantity) {replace = T} else {replace = F}) %>%
            select(nr) 

#Filtrowanie po poziomie trudnosci i przypisanie do zmiennej pytania trudne
ques_hard <<- pyt %>%
              filter(poz_trud == 3)

#Usuniecie duplikatow i wybranie ustalonej liczby (nadanej w zmiennej question_quantity) nr ze wczesniej wyfiltrowanego zbioru.
ques_hard <- ques_hard[!duplicated(ques_hard$nr),] 
#Replace to ochrona przed wsadzeniem zbyt wysokiej wartosci w question_quantity (wyzszej niz ilosc pytan w bazie danych)
ques_hard <- sample_n(ques_hard, question_quantity, if(length(ques_hard$nr) < question_quantity) {replace = T} else {replace = F}) %>%
  select(nr) 

#Zlaczenie wczesniej wyfiltrowanych numerow w jeden wektor
Numbers_of_questions <<- c(ques_easy, ques_med, ques_hard) %>%
                        unlist()

#Filtorwanie pytan i umieszczenie ich w osobnym data frame
pyt_selected <- pyt %>%
                filter(nr %in% Numbers_of_questions)

# Mozesz zapisac baze pytan, w RData i umiescic na serwerze. Dzieki temu przyspieszy sie wczytywanie danych.
# save(pyt, file="pytania.RData")

i18n <- Translator$new(translation_csvs_path = "data")
i18n$set_translation_language("pl")

