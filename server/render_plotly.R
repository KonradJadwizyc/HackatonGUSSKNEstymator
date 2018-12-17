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
#dodanie opcji sortowania i wybór zmiennej grupującej do listy rozwijanej na podstawie wybranego celu, opisu i kraju
output$group <- renderUI({
  goal <- BD_2 %>%
    dplyr::filter(Goal == (input$goal), SeriesDescription == (input$description))
  
  
  choices_vector <- unique(goal$key)
  
  selectInput("group",
              label = "Group by:",
              choices = choices_vector)
  
})

output$group2 <- renderUI({
  goal <- BD_2 %>%
    dplyr::filter(Goal == (input$goal), SeriesDescription == (input$description))
  
  
  selectInput("group2",
              label = "Group by:",
              choices = unique(goal$key),
              selected = unique(goal$key)[1])
  
  
})

#dodanie opcji sortowania i wybór wartości zmiennej do listy rozwijanej na podstawie wybranego celu, kraju, opisu i zmiennej 
output$value <- renderUI({
  #dodanie opcji sortowania
  goal <- BD_2 %>%
    dplyr::filter(Goal == (input$goal), SeriesDescription == (input$description), key == (input$group))
  
  choices_vector2 <- unique(goal$group_value)
  
  
  selectInput("value",
              label = "Value 1",
              choices = choices_vector2)
  
})
#dodanie opcji sortowania i wybór wartości zmiennej do listy rozwijanej na podstawie wybranego celu, kraju, opisu i zmiennej 
output$value2 <- renderUI({
  goal <- BD_2 %>%
    dplyr::filter(Goal == (input$goal), SeriesDescription == (input$description), key == (input$group2))
  
  selectInput("value2",
              label = "value 2",
              choices = unique(goal$group_value))
})
# tworzenie wykresu na podstawie zadeklarowanych wcześniej wartości 
# wykres liniory
output$plot_inter <- renderPlotly({
  # jeżeli wartość opisu nie jest pusta to wyświatl tylko cel, kraj i opis
  if(input$description != "") {
    # filtrowanie danych 
    seria <- BD_2 %>%
      dplyr::filter(Goal == (input$goal), # wybranie celu
                    GeoAreaName %in% input$countries, # wybranie kraju
                    SeriesDescription == input$description) # wybranie opisu
    # rysowanie wykresu
    p <- plotly::plot_ly(data = seria,
                         y = ~Value,
                         x = ~TimePeriod,
                         color = ~GeoAreaName,
                         type = "scatter",
                         mode = "line+markers") %>%
      # dodanie tytuły pobranego z opisu
      layout(title = input$description,
             xaxis=list(range=c(2000,2018),
                        title = "Time"),
             yaxis = list(title = "Value"))
    # jeżeli wartość w polu wyboru zmiennej grupującej nie jest pusta to twórz wykres
  } else if(input$group != "") {
    seria <- BD_2 %>%
      # filtrowanie danych 
      dplyr::filter(Goal == (input$goal),# wybranie celu
                    GeoAreaName %in% input$countries,# wybranie kraju
                    SeriesDescription == input$description, # wybranie opisu
                    group_value == input$value) # wybranie wartości dla przypisanej zmiennej grupującej
    # rysowanie wykresu            
    p <- plotly::plot_ly(data = seria,
                         y = ~Value,
                         x = ~TimePeriod,
                         color = ~GeoAreaName,
                         type = "scatter",
                         mode = "line+markers") %>%
      # dodanie tytuły pobranego z opisu
      layout(title = input$description,
             xaxis=list(range=c(2000,2018),
                        title = "Time"),
             yaxis = list(title = "Value"))
    # jeżeli wartość w polu wyboru zmiennej grupującej nie jest pusta to twórz wykres
  } else if(input$group2 != "") {
    # filtrowanie danych 
    seria <- BD_2 %>%
      dplyr::filter(Goal == (input$goal),# wybranie celu
                    GeoAreaName %in% input$countries,# wybranie kraju
                    SeriesDescription == input$description,# wybranie opisu
                    
                    group_value == input$value,# wybranie wartości dla przypisanej zmiennej grupującej
                    group_value == input$value2)# wybranie wartości dla przypisanej zmiennej grupującej
    
    # okienko wyskakujące podczas ładowanie wykresu
    progress1 <- shiny::Progress$new()
    on.exit(progress1$close())
    progress1$set(message = "waiting", value = 0)
    # rysowanie wykresu 
    p <- plotly::plot_ly(data = seria,
                         y = ~Value,
                         x = ~TimePeriod,
                         color = ~GeoAreaName,
                         type = "scatter",
                         mode = "line+markers") %>%
      # dodanie tytuły pobranego z opisu
      layout(title = input$description,
             xaxis=list(range=c(2000,2018),
                        title = "Time"),
             yaxis = list(title = "Value"))
    # pakek ładowania w okienku wyskakującym
    n <- 5
    for (i in 1:n) {
      progress1$inc(1/n, detail = "loading", i)
      Sys.sleep(0.1)
    }
    # przypisanie zmienej do tworzonego wykresu w celu zapisania go 
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

# wyświetlenie u Ui wykresó wybranych przez użytkownika wyświetlrnie wyktesu kolumnowego
output$plot_bar_inter <- renderPlotly({
  
  # jeżeli wartość opisu nie jest pusta to wyświatl tylko cel, kraj i opis
  if(input$description != "") {
    # filtrowanie danych 
    seria <- BD_2 %>%
      dplyr::filter(Goal == (input$goal), # wybranie celu
                    GeoAreaName %in% input$countries, # wybranie kraju
                    SeriesDescription == input$description) # wybranie opisu
    # rysowanie wykresu
    p <- plotly::plot_ly(data = seria,
                         y = ~Value,
                         x = ~TimePeriod,
                         color = ~GeoAreaName,
                         type = "scatter",
                         mode = "line+markers") %>%
      # dodanie tytuły pobranego z opisu
      layout(title = input$description,
             xaxis=list(range=c(2000,2018),
                        title = "Time"),
             yaxis = list(title = "Value"))
    # jeżeli wartość w polu wyboru zmiennej grupującej nie jest pusta to twórz wykres
  } else if(input$group != "") {
    seria <- BD_2 %>%
      # filtrowanie danych 
      dplyr::filter(Goal == (input$goal),# wybranie celu
                    GeoAreaName %in% input$countries,# wybranie kraju
                    SeriesDescription == input$description, # wybranie opisu
                    group_value == input$value) # wybranie wartości dla przypisanej zmiennej grupującej
    # rysowanie wykresu            
    p <- plotly::plot_ly(data = seria,
                         y = ~Value,
                         x = ~TimePeriod,
                         color = ~GeoAreaName,
                         type = "scatter",
                         mode = "line+markers") %>%
      # dodanie tytuły pobranego z opisu
      layout(title = input$description,
             xaxis=list(range=c(2000,2018),
                        title = "Time"),
             yaxis = list(title = "Value"))
    # jeżeli wartość w polu wyboru zmiennej grupującej nie jest pusta to twórz wykres
  } else if(input$group2 != "") {
    # filtrowanie danych 
    seria <- BD_2 %>%
      dplyr::filter(Goal == (input$goal),# wybranie celu
                    GeoAreaName %in% input$countries,# wybranie kraju
                    SeriesDescription == input$description,# wybranie opisu
                    
                    group_value == input$value,# wybranie wartości dla przypisanej zmiennej grupującej
                    group_value == input$value2)# wybranie wartości dla przypisanej zmiennej grupującej
    
    # okienko wyskakujące podczas ładowanie wykresu
    progress1 <- shiny::Progress$new()
    on.exit(progress1$close())
    progress1$set(message = "waiting", value = 0)
    # rysowanie wykresu 
    p <- plotly::plot_ly(data = seria,
                         y = ~Value,
                         x = ~TimePeriod,
                         color = ~GeoAreaName,
                         type = "scatter",
                         mode = "line+markers") %>%
      # dodanie tytuły pobranego z opisu
      layout(title = input$description,
             xaxis=list(range=c(2000,2018),
                        title = "Time"),
             yaxis = list(title = "Value"))
    # pakek ładowania w okienku wyskakującym
    n <- 5
    for (i in 1:n) {
      progress1$inc(1/n, detail = "loading", i)
      Sys.sleep(0.1)
    }
    # przypisanie zmienej do tworzonego wykresu w celu zapisania go 
    plot$plot <- p
    p
  }
})
# testowy wykres właściwe wykresy to liniowy i kolumnowy

