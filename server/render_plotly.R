data <- read.csv2("data.csv", sep = ",")
data_manager <- data %>% filter(SeriesDescription == "Proportion of women in managerial positions (%)")
library(tidyverse)
data_manager <- data_manager[c(7, 8, 9)]
data_denmark <- data_manager %>% filter(GeoAreaName == "Denmark")

output$plot_inter <- renderPlotly(
plotly::plot_ly(data_denmark, x= ~TimePeriod, y=~Value, type = "scatter", mode = "lines")
)