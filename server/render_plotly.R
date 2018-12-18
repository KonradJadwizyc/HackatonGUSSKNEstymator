observeEvent(input$add_my_page, {
  alert("You can download this chart ;) Just point mouse at the top of the chart and pick camera icon. ")
})
 # assigning an empty value and adding a number to write the chart
plot <- reactiveValues(plot = NULL, numer = 1)

# choose description list
output$description <- renderUI({
  
  goal <- BD_2 %>% 
    dplyr::filter(Goal == (input$goal))
  
  selectInput("description",
              label = "Choose description",
              choices = unique(goal$SeriesDescription),
              selected = unique(goal$SeriesDescription)[1])
  
})
# choose country list
output$countries <- renderUI({
  
  goal <- BD_2 %>% 
    dplyr::filter(Goal == (input$goal), SeriesDescription == input$description)
  
  selectInput("countries",
              label = "Chooes country / region",
              choices = unique(goal$GeoAreaName),
              selected = unique(goal$GeoAreaName)[2], multiple = TRUE)
  
  
})
# add sort and choice variable group to selectinput based on goal daescription and coaauntry

output$group <- renderUI({
  goal <- BD_2 %>%
    dplyr::filter(Goal == (input$goal), SeriesDescription == (input$description))
  
  
  choices_vector <- unique(goal$key)
  
  selectInput("group",
              label = "Group by:",
              choices = choices_vector)
  
})
# add sort and choice variable group to selectinput based on goal daescription and coaauntry
output$group2 <- renderUI({
  goal <- BD_2 %>%
    dplyr::filter(Goal == (input$goal), SeriesDescription == (input$description))
  
  
  selectInput("group2",
              label = "Group by:",
              choices = unique(goal$key),
              selected = unique(goal$key)[1])
  
  
})

# add sort and choice variable group to selectinput based on goal daescription and coaauntry and variable group 
output$value <- renderUI({
  #add sort options
  goal <- BD_2 %>%
    dplyr::filter(Goal == (input$goal), SeriesDescription == (input$description), key == (input$group))
  
  choices_vector2 <- unique(goal$group_value)
  
  
  selectInput("value",
              label = "Value 1",
              choices = choices_vector2)
  
})
# add sort and choice variable group to selectinput based on goal daescription and coaauntry and variable group
output$value2 <- renderUI({
  goal <- BD_2 %>%
    dplyr::filter(Goal == (input$goal), SeriesDescription == (input$description), key == (input$group2))
  
  selectInput("value2",
              label = "value 2",
              choices = unique(goal$group_value))
})
# create chart based on goal daescription and coaauntry and variable group

# chart line
output$plot_inter <- renderPlotly({
  # if description in not null show goal country description

  if(input$description != "") {
    # filter data
    seria <- BD_2 %>%
      dplyr::filter(Goal == (input$goal), # choices goal
                    GeoAreaName %in% input$countries, # choices country
                    SeriesDescription == input$description) # choices description
    # drow chart
    p <- plotly::plot_ly(data = seria,
                         y = ~Value,
                         x = ~TimePeriod,
                         color = ~GeoAreaName,
                         type = "scatter",
                         mode = "line+markers") %>%
      # add title baded on description
      layout(title = input$description,
             xaxis=list(range=c(2000,2018),
                        title = "Time"),
             yaxis = list(title = "Value"))
    # if group in not null show goal country description
  } else if(input$group != "") {
    seria <- BD_2 %>%
      # filter data
      dplyr::filter(Goal == (input$goal), # choices goal
                    GeoAreaName %in% input$countries,# choices country
                    SeriesDescription == input$description, # choices description
                    group_value == input$value) # choices variable group
    # drow chart            
    p <- plotly::plot_ly(data = seria,
                         y = ~Value,
                         x = ~TimePeriod,
                         color = ~GeoAreaName,
                         type = "scatter",
                         mode = "line+markers") %>%
      # add title baded on description
      layout(title = input$description,
             xaxis=list(range=c(2000,2018),
                        title = "Time"),
             yaxis = list(title = "Value"))
    # if group2 in not null show goal country description
  } else if(input$group2 != "") {
    # filter data 
    seria <- BD_2 %>%
      dplyr::filter(Goal == (input$goal),# choices goal
                    GeoAreaName %in% input$countries,# choices country
                    SeriesDescription == input$description,# choices variable group
                    
                    group_value == input$value,# choices variable group
                    group_value == input$value2)# choices variable group2
    
   # message lading chart
    progress1 <- shiny::Progress$new()
    on.exit(progress1$close())
    progress1$set(message = "waiting", value = 0)
    # drow chart   
    p <- plotly::plot_ly(data = seria,
                         y = ~Value,
                         x = ~TimePeriod,
                         color = ~GeoAreaName,
                         type = "scatter",
                         mode = "line+markers") %>%
      # add title baded on description
      layout(title = input$description,
             xaxis=list(range=c(2000,2018),
                        title = "Time"),
             yaxis = list(title = "Value"))
    # message lading progress chart
    n <- 5
    for (i in 1:n) {
      progress1$inc(1/n, detail = "loading", i)
      Sys.sleep(0.1)
    }
  # create variable to save chart 
    plot$plot <- p
    p
  }
})
# funkcja która ma zapisywać wykres do bazy danych wykresów które będą dodane do quizu
# z powodów technicznych i braku dostępu do zewnętrznej bazy danych nie mogliśmy zaimlementować funkcji zapisu wykresów
# i wykorzystanie ich w quizie 
output$save <- downloadHandler(
  
  if(!is.null(plot$plot)){
    
    p <- plot$plot
    
    i <- plot$numer
    
    save(p, file = paste0("plot/imgtest",i,".RData"))
    
    plot$numer <- i + 1
  }
  
  
)

output$plot_bar_inter <- renderPlotly({
  
  # create chart based on goal daescription and coaauntry and variable group
  
    # if description in not null show goal country description
    
    if(input$description != "") {
      # filter data
      seria <- BD_2 %>%
        dplyr::filter(Goal == (input$goal), # choices goal
                      GeoAreaName %in% input$countries, # choices country
                      SeriesDescription == input$description) # choices description
      # drow chart
      p <- plotly::plot_ly(data = seria,
                           y = ~Value,
                           x = ~TimePeriod,
                           color = ~GeoAreaName,
                           type = "bar",
                           mode = "markers") %>%
        # add title baded on description
        layout(title = input$description,
               xaxis=list(range=c(2000,2018),
                          title = "Time"),
               yaxis = list(title = "Value"))
      # if group in not null show goal country description
    } else if(input$group != "") {
      seria <- BD_2 %>%
        # filter data
        dplyr::filter(Goal == (input$goal), # choices goal
                      GeoAreaName %in% input$countries,# choices country
                      SeriesDescription == input$description, # choices description
                      group_value == input$value) # choices variable group
      # drow chart            
      p <- plotly::plot_ly(data = seria,
                           y = ~Value,
                           x = ~TimePeriod,
                           color = ~GeoAreaName,
                           type = "bar",
                           mode = "markers") %>%
        # add title baded on description
        layout(title = input$description,
               xaxis=list(range=c(2000,2018),
                          title = "Time"),
               yaxis = list(title = "Value"))
      # if group2 in not null show goal country description
    } else if(input$group2 != "") {
      # filter data 
      seria <- BD_2 %>%
        dplyr::filter(Goal == (input$goal),# choices goal
                      GeoAreaName %in% input$countries,# choices country
                      SeriesDescription == input$description,# choices variable group
                      
                      group_value == input$value,# choices variable group
                      group_value == input$value2)# choices variable group2
      
      # message lading chart
      progress1 <- shiny::Progress$new()
      on.exit(progress1$close())
      progress1$set(message = "waiting", value = 0)
      # drow chart   
      p <- plotly::plot_ly(data = seria,
                           y = ~Value,
                           x = ~TimePeriod,
                           color = ~GeoAreaName,
                           type = "bar",
                           mode = "markers") %>%
        # add title baded on description
        layout(title = input$description,
               xaxis=list(range=c(2000,2018),
                          title = "Time"),
               yaxis = list(title = "Value"))
      # message lading progress chart
      n <- 5
      for (i in 1:n) {
        progress1$inc(1/n, detail = "loading", i)
        Sys.sleep(0.1)
      }
      # create variable to save chart 
      plot$plot <- p
      p
    }
})


