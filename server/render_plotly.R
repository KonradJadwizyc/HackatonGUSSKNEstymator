observeEvent(input$add_my_page, {
  alert("You can download this chart ;) Just point mouse at the top of the chart and pick camera icon. ")
})
 # assigning an empty value and adding a number to write the chart
plot <- reactiveValues(plot = NULL, numer = 1)


# selection of descriptions to the drop-down list based on the selected goal
output$description <- renderUI({
  # choos goal 
  goal <- My_SDG %>%
    dplyr::filter(Goal == as.numeric(input$goal))
  # choose description goal
  selectInput("description", 
              label = "Choose description",
              choices = unique(goal$SeriesDescription),
              selected = unique(goal$SeriesDescription)[1])
})
# selection of countries to the drop-down list based on the selected goal
output$countries <- renderUI({
  
  # choose countri if is description 
  goal <- My_SDG %>%
    dplyr::filter(Goal == as.numeric(input$goal), SeriesDescription == input$description)
  # choose country to the drop-down list
  selectInput("countries", 
              label = "Choose country",
              choices = unique(goal$GeoAreaName),
              selected = unique(goal$GeoAreaName)[2], multiple = TRUE)
  
  
})



output$plot_inter <- renderPlotly({
 
  # filter data to plot
  seria <- My_SDG %>%
    dplyr::filter(Goal == as.numeric(input$goal),
                  GeoAreaName %in% input$countries,
                  SeriesDescription == input$description)

  # create plotly chart
  p <- plotly::plot_ly(data = seria,
                  y = ~Value,
                  x = ~TimePeriod,
                  color = ~GeoAreaName,
                  type = "scatter",
                  mode = "lines") %>%
    layout(title = input$description,
           xaxis=list(range=c(2000,2018),
                      title = "Time"),
           ysxis = list(title = "Value"))
  
  # translating the variable into the chartues
  plot$plot <- p
  
  p
  
})
# function to save img chart to database 
output$save <- downloadHandler(
  
  if(!is.null(plot$plot)){
    
    p <- plot$plot
    
    i <- plot$numer
    
    save(p, file = paste0("plot/imgtest",i,".RData"))
    
    plot$numer <- i + 1
  }
  
  
)

 # display of user-selected graphs at Ui
output$plot_bar_inter <- renderPlotly({
# filtr data to create line plot
  seria_2 <- My_SDG %>% 
    dplyr::filter(Goal == as.numeric(input$goal),
                  GeoAreaName %in% input$countries,
                  SeriesDescription == input$description)#
 
  
  plotly::plot_ly(data = seria_2,
                  x = ~TimePeriod,
                  y = ~Value,
                  color = ~GeoAreaName,
                  type = "bar",
                  mode = "markers") %>% 
    layout(title = input$description,
           xaxis=list(range=c(2000,2018),
                      title = "Time"),
           ysxis = list(title = "Value")
    )
  
})

output$plot_scatter_inter <- renderPlotly({
  
  seria_3 <- My_SDG %>% 
    dplyr::filter(Goal == as.numeric(input$goal), GeoAreaName %in% input$countries, SeriesDescription == input$description)

     plotly::plot_ly(data = seria_3,
                  x = ~TimePeriod,
                  y = ~Value,
                  color = ~GeoAreaName,
                  size = ~Value,
                  type = "scatter",
                  mode = "markers") %>% 
    layout(title = input$description,
           xaxis=list(range=c(2000,2018),
                      title = "Time"),
           ysxis = list(title = "Value")
    )
})
