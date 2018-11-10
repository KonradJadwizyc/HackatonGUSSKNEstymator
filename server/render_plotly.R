



observeEvent(input$img_1, {
  updateTabsetPanel(session, "navbar",
                    selected = "Education")
  
})

observeEvent(input$add_my_page, {
  alert("You can download this chart ;) Just point mouse at the top of the chart and pick camera icon. ")
})

data <- read.csv2("data.csv", sep = ",")
data_manager <- data %>% filter(SeriesDescription == "Proportion of women in managerial positions (%)")
library(tidyverse)

data_manager <- data_manager[c(7, 8, 9)]
data_manager$Value <- as.numeric(as.character(data_manager$Value))
data_poland <- data_manager %>% filter(GeoAreaName == "Poland")
data_inter <- reactive(
  data_manager %>% filter(GeoAreaName == input$searchCountry)
)

output$plot_poland <- renderPlotly(
plotly::plot_ly(data_poland, x= ~TimePeriod, y=~Value, type = "scatter", mode = "lines")
)

output$plot_inter <- renderPlotly(
  p <- plot_ly(data = data_inter()) %>% 
    add_lines( x = ~TimePeriod, y = ~Value, color = ~GeoAreaName, mode = "lines", line = list(width = 3))
)


########

glod <- read.csv("data (2).csv")
glod$Value <- as.numeric(as.character(glod$Value))
glod_World <- glod %>%
  filter(SeriesDescription == "Prevalence of undernourishment (%)")

glod_poland <- glod_World %>% filter(GeoAreaName == "Poland")
data_inter <- reactive(
  glod_World %>%  filter(GeoAreaName == input$searchCountry)
)

output$plot_poland <- renderPlotly(
  p <- plot_ly(data = data_inter()) %>% 
    add_lines( x = ~TimePeriod, y = ~Value, color = ~GeoAreaName, mode = "lines", line = list(width = 3)) %>%
    layout(
      title = "Proportion of women in managerial positions",
      scene = list(
        xaxis = list(title = "Time"),
        yaxis = list(title = "Value")))
  
)
observeEvent(input$Choose_SDG, {
  updateRadioButtons(session = session, Choose_topics, choices = c("% of women in ", "% of women in", "% of women in"))
})

####

data_ineqality <- read.csv("data nier_plac.csv")
data_ineqality_world <- filter(SeriesDescription == "Proportion of time spent on unpaid care work, by sex, age an location")
data_data_ineqality_poland <- data_ineqality_world %>% filter(GeoAreaName == "Poland")
data_inter_2 <- reactive(
  data_ineqality_world %>% filter(GeoAreaName == input$searchCountry)
)

output$plot_poland <- renderPlotly(
  p <- plot_ly(data = data_data_ineqality_poland()) %>% 
    add_lines( x = ~TimePeriod, y = ~Value, color = ~GeoAreaName, mode = "lines", line = list(width = 3)) %>%
    layout(
      title = "Proportion of time spent on unpaid care work",
      scene = list(
        xaxis = list(title = "Time"),
        yaxis = list(title = "Value")))
)


