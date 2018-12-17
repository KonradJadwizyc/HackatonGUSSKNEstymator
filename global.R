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



#load datadase
My_SDG <- readRDS("My_SDG.rds")
# value as numeric
My_SDG <- My_SDG %>%
  mutate(Value=as.numeric(levels(Value))[Value])
# group value as character 
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
# use function gather on group variable  
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
# select varible to create plot
BD_2 <- BD %>% select(Goal,SeriesDescription,GeoAreaName,TimePeriod,Value,key,group_value)
# value as numeric
as.numeric(BD_2$Value)

#Save questions that were downloaded from xlsx file. Changed 2 columns of data frame to logical value! 
pyt <- read.xlsx(xlsxFile = "Pytania.xlsx",
                 colNames = TRUE) %>%
  mutate(praw=as.logical(praw)) %>%
  mutate(plot_img=as.logical(plot_img))

#Number of question that we wanna show to the user (depending on the base, test value is 2)
question_quantity <- 2

#Filtering by difficult lvl, and set to variable questions easy
ques_easy <<- pyt %>%
  filter(poz_trud == 1) 

#Delete duplicated rows, and pick choosen number of (given in question_quantity) nr from filtered collection
ques_easy <- ques_easy[!duplicated(ques_easy$nr),] 
#replace is protection from putting to high value for question_quantity (higher than number of question in base)
ques_easy <- sample_n(ques_easy, question_quantity, if(length(ques_easy$nr) < question_quantity) {replace = T} else {replace = F}) %>%
  select(nr) 

#Filtering by difficult lvl, and set to variable questions medium
ques_med <<- pyt %>%
  filter(poz_trud == 2) 

#Delete duplicated rows, and pick choosen number of (given in question_quantity) nr from filtered collection
ques_med <- ques_med[!duplicated(ques_med$nr),]
#replace is protection from putting to high value for question_quantity (higher than number of question in base)
ques_med <-  sample_n(ques_med, question_quantity, if(length(ques_med$nr) < question_quantity) {replace = T} else {replace = F}) %>%
             select(nr) 

#Filtering by difficult lvl, and set to variable questions hard
ques_hard <<- pyt %>%
  filter(poz_trud == 3)

#Delete duplicated rows, and pick choosen number of (given in question_quantity) nr from filtered collection
ques_hard <- ques_hard[!duplicated(ques_hard$nr),]
#replace is protection from putting to high value for question_quantity (higher than number of question in base)
ques_hard <- sample_n(ques_hard, question_quantity, if(length(ques_hard$nr) < question_quantity) {replace = T} else {replace = F}) %>%
  select(nr) 

#Fuse picked number into 1 vector
Numbers_of_questions <<- c(ques_easy, ques_med, ques_hard) %>%
  unlist()

#Filter picked question, and put them in another data frame
pyt_selected <- pyt %>%
  filter(nr %in% Numbers_of_questions)

#Saving data base with question to R format file (for faster loading). You can change load from excel file (but you must update this save R file every time you add question)
# save(pyt, file="pytania.RData")



